String transcribedNote = "";
Boolean send = false;

void oscEvent(OscMessage theOscMessage) {
  try {
    //println("Address: " + theOscMessage.addrPattern());
    
    String value = theOscMessage.get(0).stringValue();

    if (theOscMessage.checkAddrPattern("/note")) {  
      println("Pitch value:" + value);
      transcribeNote(value);
      //if (value == "send") {
      //  // send to twitch
      //  send = true;
      //}
    }
  } catch (Exception e) {
    e.printStackTrace();
  }
}
