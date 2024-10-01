String apiKey = "AIzaSyAdEXFSMk4RwACzZkgnKtLzPQzL9Ugbo0U";  // Replace with your Google API Key
String searchEngineId = "878804cd5ea274f9b";  // Replace with your search engine ID
String searchKeyword = "puppy";  // Replace with your search keyword

PImage img;

void fetchImage(String searchKeyword) {
  println("Searching on google..." + searchKeyword);

  try {
    // URL encode the search keyword to handle spaces and special characters
    String encodedKeyword = URLEncoder.encode(searchKeyword, "UTF-8");
    String url = "https://www.googleapis.com/customsearch/v1?q=" + encodedKeyword + "&cx=" + searchEngineId + "&searchType=image&key=" + apiKey;

    JSONObject json = loadJSONObject(url);
    JSONArray items = json.getJSONArray("items");
    if (items != null && items.size() > 0) {
      boolean imageFound = false;  // To track if we found a valid image

      for (int i = 0; i < items.size(); i++) {
        JSONObject item = items.getJSONObject(i);
        String imageUrl = item.getString("link");

        // Check if the image URL ends with ".jpg"
        if (imageUrl.toLowerCase().endsWith(".jpg")) {
          println("Image found: " + imageUrl);
          img = loadImage(imageUrl);  // Load the image
          imageFound = true;  // Mark that we found a valid image
          break;  // Exit the loop after finding a valid image
        }
      }

      if (!imageFound) {
        println("No valid .jpg image found.");
      }

    } else {
      println("No image found for the search term.");
    }

  } catch (UnsupportedEncodingException e) {
    println("Encoding not supported: " + e.getMessage());
  } catch (Exception e) {
    println("Error fetching image: " + e.getMessage());
  }
}

void sayKeyword(String keyword) {
  try {
    // Build the command to say the keyword using macOS's `say` command
    String[] command = { "say", keyword };
    Process p = Runtime.getRuntime().exec(command);
    p.waitFor();  // Wait for the command to finish
  } catch (Exception e) {
    println("Error executing say command: " + e.getMessage());
  }
}
