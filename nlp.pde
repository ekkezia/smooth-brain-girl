
void nlp(String input) {
  println("sending nlp request " + input);
  
  String apiKey = "Bearer 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";
  
  String apiUrl = "https://api-inference.huggingface.co/models/j-hartmann/emotion-english-distilroberta-base";
  
  String jsonData = "{\"inputs\": \"" + input + "\"}";

  // Initialize POST request
  PostRequest post = new PostRequest(apiUrl);
  post.addHeader("Authorization", apiKey);
  post.addHeader("Content-Type", "application/json");

  // Set body and content type
  post.addData(jsonData);
  
  post.send();
  
  // Get the response
  println("Response Content: " + post.getContent());
  
  String response = post.getContent();
  
  emotion = emotionsMap.get(getHighestEmotion(response));
  println("Emotion Analysis Response: " + response);
}

String getHighestEmotion(String jsonResponse) {
  JSONArray jsonArray = JSONArray.parse(jsonResponse); // Parse the JSON response
  JSONArray emotionsArray = jsonArray.getJSONArray(0); // Get the first array (assumed structure)
  
  String highestEmotion = ""; // Variable to hold the highest emotion label
  float highestScore = -1; // Initialize the highest score to a low value
  
  for (int i = 0; i < emotionsArray.size(); i++) {
    JSONObject emotionObject = emotionsArray.getJSONObject(i); // Get the current JSONObject
    String label = emotionObject.getString("label"); // Extract the label
    float score = emotionObject.getFloat("score"); // Extract the score

    // Check if the current score is higher than the highestScore
    if (score > highestScore) {
      highestScore = score; // Update highest score
      highestEmotion = label; // Update highest emotion label
    }
  }
  
  emotionLog.add(highestEmotion);
  println("emotion log", emotionLog);
  
  return highestEmotion; // Return the label of the emotion with the highest score
}
