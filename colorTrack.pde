color trackColor;
float closestX, closestY = 0;

void trackColor() {
  if (cam == null || cam.pixels == null) return; // Check if cam is available

  float record = 500;
  
  for (int x = 0; x < cam.width; x++) {
    for (int y = 0; y < cam.height; y++) {
      int loc = x + y * cam.width;
      
      // what is the current color
      color currentColor = cam.pixels[loc];
      
      float r1 = red(currentColor);
      float g1 = green(currentColor);
      float b1 = blue(currentColor);
      
      float r2 = red(trackColor);
      float g2 = green(trackColor);
      float b2 = blue(trackColor);
      
      // euclidean distance
      float d = dist(r1, g1, b1, r2, g2, b2);
      
      if (d < record) {
        record = d;
        closestX = x;
        closestY = y;
      }
    }
  }
  
  if (selectedEffectImage != null) {
      image(selectedEffectImage, closestX, closestY, imageSize, imageSize);
  }
}

void mousePressed() {
  if (mouseX >= 0 && mouseX < width && mouseY >= 0 && mouseY < height) {
    trackColor = get(mouseX, mouseY);
    println("Color at mouse click: " + trackColor);
  }
}
