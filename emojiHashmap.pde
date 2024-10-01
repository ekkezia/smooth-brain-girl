HashMap<String, String> emotionsMap;

void setupEmojiHashmap() {
  emotionsMap = new HashMap<String, String>(); // Initialize the HashMap

  // Add key-value pairs for the emotions
  emotionsMap.put("joy", ":D"); // Replace 0.0 with the actual score if needed
  emotionsMap.put("surprise", ">_>");
  emotionsMap.put("neutral", ":-|");
  emotionsMap.put("sadness", ":'(");
    emotionsMap.put("anger", ">:(");
  emotionsMap.put("disgust", ":-x");
  emotionsMap.put("fear", ">_<");

  // Print the HashMap contents
  for (String key : emotionsMap.keySet()) {
    println(key + ": " + emotionsMap.get(key));
  }
}
