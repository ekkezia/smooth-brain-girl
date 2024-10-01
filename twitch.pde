import http.requests.*;
import java.io.*; // For input/output streams
import java.net.*; // For networking
import oscP5.*;
import netP5.*;
import java.net.URLEncoder;
import processing.video.*;

Socket socket;
BufferedWriter writer;
BufferedReader reader;

Capture cam;

String server = "irc.chat.twitch.tv"; // Twitch IRC server
int port = 6667; // Non-SSL port
String nick = "ek3zia"; // Your Twitch username
String oauth = "oauth:fv3vw4w7drsvqo8xgxx53atdnt6j3e"; // Your OAuth token with "oauth:" prefix
String channel = "#ek3zia"; // Twitch channel (must include the #)

String lastMessage = ""; // Last chat message
ArrayList<String> chatLog = new ArrayList<String>(); // Chat log to display
ArrayList<String> emotionLog = new ArrayList<String>(); // Emotion log to display

OscP5 oscP5;
NetAddress myAddress;

String emotion = "EMOTION";

void setup() {
  size(800, 600);
  background(0);
  
  String[] cameras = Capture.list();
  
  if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } else {
    println("Available cameras:");
    for (int i = 0; i < cameras.length; i++) {
      println(cameras[i]);
    }
    
    // Set up the camera with the first available camera
    cam = new Capture(this, cameras[0]);
    cam.start();
  }


  // Connect to Twitch IRC server
  connectToTwitch();
  
  // Initialize OSC
  oscP5 = new OscP5(this, 12000); // Port 8000 (or match with Max/MSP port)

  // Set up the address for sending messages
  //myAddress = new NetAddress("127.0.0.1", 8000); // IP address and port of Max/MSP
  
  setupEmojiHashmap();
}

void draw() {  
  // Read chat messages from Twitch
  if (socket != null && socket.isConnected()) {
    try {
      if (reader.ready()) {
        String line = reader.readLine();
        processChat(line);
      }
    } catch (IOException e) {
      e.printStackTrace();
    }
  }
  

  // Camera
  if (cam.available() == true) {
    cam.read();
  }
  image(cam, 0, 0, width, height);
  
  // Image
  if (img != null) {
    image(img, 0, 0, width/2, height/2);
  }
  
  fill(255);
  textSize(32);

  // Display the latest 10 chat messages
  for (int i = 0; i < min(chatLog.size(), 10); i++) {
    text(chatLog.get(chatLog.size() - 1 - i), 10, height - 32 * (i + 1));
  }

  //for (int i = 0; i < min(emotionLog.size(), 10); i++) {
  //  text(emotionLog.get(emotionLog.size() - 1 - i), width - 100, height - 32 * (i + 1));
  //}
  
  // moving emotion text
  if (emotionLog.size() > 0) { 
    text(emotionLog.get(emotionLog.size() -1), closestX, closestY);
  }
  
  if (send) {
        writeMessage(transcribedNote);
  }
  
  text(transcribedNote, 50, 100);
  
      trackColor();
}

void connectToTwitch() {
  try {
    socket = new Socket(server, port);
    writer = new BufferedWriter(new OutputStreamWriter(socket.getOutputStream()));
    reader = new BufferedReader(new InputStreamReader(socket.getInputStream()));

    // Authenticate with Twitch IRC
    writer.write("PASS " + oauth + "\r\n");
    writer.write("NICK " + nick + "\r\n");
    writer.write("JOIN " + channel + "\r\n");
    
    writer.flush();
    
    println("Connected to Twitch Chat!");
  } catch (Exception e) {
    e.printStackTrace();
  }
}

void writeMessage(String message) {
  println("attempting to send message to twitch", message);
    try {
   if (writer == null) {
      throw new IllegalStateException("Writer is not initialized. Call connectToTwitch() first.");
    }

    writer.write("PRIVMSG " + channel + " :" + message + "\r\n");
    writer.flush();
    
    send = false; // reset send
    println("Message sent to " + channel + ": " + message);
    
  } catch (Exception e) {
    e.printStackTrace();
  }
}

void processChat(String line) {
  if (line.contains("PRIVMSG")) {
    String user = line.substring(1, line.indexOf('!'));
    String message = line.substring(line.indexOf("PRIVMSG") + 9 + channel.length() + 1);
    
    // Add message to chat log
    chatLog.add(user + ": " + message);
    println(user + ": " + message);
        
    if (message.equals("pink")) {
      print("message is pink");
      changeBackground();
    }
    
    //fetchImage(message);
    sayKeyword(message);
    nlp(message);
  }
}

void changeBackground() {
        background(0, 255, 0);
}
