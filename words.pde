void initializeWordsHashmap() {
  for (int i = 0; i < angelAffirmationWords.length; i++) {
    censoredWordsMap.put(angelAffirmationWords[i][0], angelAffirmationWords[i][1]);
  }
}

void initializeImageHashmap() {
  for (int i = 0; i < pngWords.length; i++) {
    String word = pngWords[i][0];          
    String imageFilename = pngWords[i][1];  
    censoredImageMap.put(word, loadImage(imageFilename));
  }
 
}

String processWords(String input) {
  StringBuilder result = new StringBuilder();  // To store the processed result
  int i = 0;

  while (i < input.length()) {
    boolean matchFound = false;

    // Check if the next part of the string matches any word in the censoredImageMap
    for (String key : censoredImageMap.keySet()) {
        if (input.toLowerCase().contains(key.toLowerCase())) {
            println("Image effect triggered for: " + key);
            selectedEffectImage = censoredImageMap.get(key);  // Set the effect image
            matchFound = true; 
        }
    }

    // Check if the next part of the string matches any word in the censoredWordsMap
    for (String key : censoredWordsMap.keySet()) {
      if (input.regionMatches(true, i, key, 0, key.length())) {
        result.append(censoredWordsMap.get(key));  // Replace the word
        i += key.length();  // Skip the length of the matched word
        matchFound = true;
        
        break;
      }
    }

    if (!matchFound) {
      result.append(input.charAt(i));  // If no match, append the current character
      i++;
    }
  }
  
  return result.toString();
}

// Helper method to check if the word is in which category
//boolean isBabyWord(String word) {
//  for (String[] pair : angelAffirmationWords) {
//    if (pair[0].equals(word)) {
//      return true;
//    }
//  }
//  return false;
//}
