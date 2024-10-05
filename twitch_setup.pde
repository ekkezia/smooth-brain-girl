String server = "irc.chat.twitch.tv"; // Twitch IRC server
int port = 6667; // Non-SSL port
String nick = "nichestitution"; // Your Twitch username
String oauth = "oauth:n6tv79rcp7r95e5jydrfwgq5rs6m0s"; // Your OAuth token with "oauth:" prefix
String channel = "#nichestitution"; // Twitch channel (must include the #)

ArrayList<String> chatLog = new ArrayList<String>(); // Chat log to display

int maxChatLogCount = 10;

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
    
    //    String line;
    //while ((line = reader.readLine()) != null) {
    //  println(line);  // Print raw IRC messages to the console
    //}

  } catch (Exception e) {
    e.printStackTrace();
  }
}

void processChat(String line) {
  if (line.contains("PRIVMSG")) {
    String user = line.substring(1, line.indexOf('!'));
    String message = line.substring(line.indexOf("PRIVMSG") + 9 + channel.length() + 1);
    
    String processedWord = processWords(message);
    
    // Add message to chat log
    chatLog.add(user + ": " + processedWord);
    println(user + ": " + processedWord + "|| actual message: " +  message);
    
    //sayWithSiri(message);
    
    processImage(message);
  }
}
