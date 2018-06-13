class Portal {
  float x, y, w, h;
  
  Portal(float startX, float startY, float startW, float startH) {
    x = startX;
    y = startY;
    w = startW;
    h = startH;
  }
  
  void display() {
    image(portal, x-30, y-70, w+50, h+70);
    rect(x, y, w, h);
  }
  
}