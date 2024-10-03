HashMap<String, String> censoredWordsMap = new HashMap<String, String>();

String[][] babyWords = {
    {"kiss", "💋KISS💋"},
    {"love", "💝LOVE💝"}
};
  
String[][] naughtyWords = {
    {"suck", "🐤DUCK🐤"},
    {"dick", "🌸ICK🌸"}
};

void initializeWordsHashmap() {
  for (int i = 0; i < babyWords.length; i++) {
    censoredWordsMap.put(babyWords[i][0], babyWords[i][1]);
  }
  
  for (int i = 0; i < naughtyWords.length; i++) {
    censoredWordsMap.put(naughtyWords[i][0], naughtyWords[i][1]);
    selectedEffectImage = null;
  }
}

String processWords(String input) {
  String[] words = input.split(" ");

  for (int i = 0; i < words.length; i++) {
    String word = words[i].toLowerCase();  
    
    if (censoredWordsMap.containsKey(word)) {
      words[i] = censoredWordsMap.get(word);
    }
  }
  
  selectedEffectImage = heart;
  
  return String.join(" ", words);
}
