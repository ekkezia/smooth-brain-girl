//HashMap<Float, String> alphabetsHashmap;

//String[] alphabets = {"a", "b", "c", "d", "e"};
//float[] pitch = {69, 70, 71, 72, 73};


//void initAlphabetsHashmap() {
//    alphabetsHashmap = new HashMap<Float, String>();
//    for (int i = 0; i < alphabets.length; i++) {
//      alphabetsHashmap.put(pitch[i], alphabets[i]);
//    }
//}

void transcribeNote(String note) {
  if (note.equals("send")) {
    writeMessage(transcribedNote);
  } else {
    transcribedNote += note;
  }
}
