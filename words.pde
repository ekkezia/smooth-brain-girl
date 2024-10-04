void initializeWordsHashmap() {
  for (int i = 0; i < angelAffirmationWords.length; i++) {
    censoredWordsMap.put(angelAffirmationWords[i][0], angelAffirmationWords[i][1]);
  }
  
  for (int i = 0; i < publicAffirmationWords.length; i++) {
    censoredWordsMap.put(publicAffirmationWords[i][0], publicAffirmationWords[i][1]);
  }
}

void initializeImageHashmap() {
  for (int i = 0; i < cuteImagePaths.length; i++) {
    cuteImages[i] = loadImage(cuteImagePaths[i]); // Ensure filenames match
  }
  
  for (int i = 0; i < loveImagePaths.length; i++) {
    loveImages[i] = loadImage(loveImagePaths[i]); // Ensure filenames match
  }
  
  for (int i = 0; i < ascendImagePaths.length; i++) {
    ascendImages[i] = loadImage(ascendImagePaths[i]); // Ensure filenames match
  }
}

String processWords(String input) {
  StringBuilder result = new StringBuilder();  // To store the processed result
  int i = 0;

  while (i < input.length()) {
    boolean matchFound = false;

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

void processImage(String input) {
   for (int i = 0; i < cuteWords.length; i++) {
        if (input.toLowerCase().contains(cuteWords[i].toLowerCase())) {
          println("contain input image");
            selectedEffectImage = cuteImages[(int) random(cuteImages.length)];
        }
    }
    
       for (int i = 0; i < loveWords.length; i++) {
        if (input.toLowerCase().contains(loveWords[i].toLowerCase())) {
          println("contain input image");
            selectedEffectImage = loveImages[(int) random(loveImages.length)];
        }
    }
    
       for (int i = 0; i < ascendWords.length; i++) {
        if (input.toLowerCase().contains(ascendWords[i].toLowerCase())) {
          println("contain input image");
            selectedEffectImage = ascendImages[(int) random(ascendImages.length)];
        }
    }
}
