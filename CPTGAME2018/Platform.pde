class Platform {
  float x, y, w, h;
  
  Platform(float startX, float startY, float startW, float startH) {
    x = startX;
    y = startY;
    w = startW;
    h = startH;
  }
  
  void display() {
    noStroke();
    fill(0, 0, 100);
    rect(x, y, w, h);
    ellipse(x, y, 5, 5);
  }
  
  
}
