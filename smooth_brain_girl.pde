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

int canvasWidth = 1600;
int canvasHeight = canvasWidth / 4 * 3;

Capture cam;

PFont emojiFont;

int defaultFontSize = 32;

void setup() {
  size(1600, 1200);
  
  emojiFont = createFont("NotoColorEmoji-32.vlw", 32);
  textFont(emojiFont);

  background(0);
  
  // Camera
  String[] cameras = Capture.list();
  
  if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } else {
    println("Available cameras:");
    for (int i = 0; i < cameras.length; i++) {
      println(cameras[i]);
    }
    
    // Set up the camera with the first available camera, replace with your choice of camera (depending on the index being listed in "Available cameras:")
    cam = new Capture(this, cameras[0]);
    cam.start();
  }


  // Connect to Twitch IRC server
  connectToTwitch();
  
  // Initialize the words key-value pair that will be used to replace a word with its pair word
  initializeWordsHashmap();
  
  initializeImageHashmap();
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
    
  fill(255);
  textSize(defaultFontSize);
  for (int i = 0; i < min(chatLog.size(), maxChatLogCount); i++) {
    text(chatLog.get(chatLog.size() - 1 - i), 10, defaultFontSize + (defaultFontSize *1.5)  * i);
  }
  
  trackColor();
}
