void sayWithSiri(String input) {
  try {
    // Build the command to say the keyword using macOS's `say` command
    String[] command = { "say", input };
    Process p = Runtime.getRuntime().exec(command);
    p.waitFor(); 
  } catch (Exception e) {
    println("Error executing say command: " + e.getMessage());
  }
}
