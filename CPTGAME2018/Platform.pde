class Platform {
  float x, y, w, h;
  
  Platform(float startX, float startY, float startW, float startH) {
    x = startX;
    y = startY;
    w = startW;
    h = startH;
  }
  
  void display() {      //display platform
    noStroke();
    fill(0, 0, 100);
    rect(x, y, w, h);
    ellipse(x, y, 5, 5);
    image(grass, x-5, y, w+10, h);
  }
  
  void display2() {      //display platform (different image)
    noStroke();
    fill(0, 0, 100);
    rect(x, y, w, h);
    ellipse(x, y, 5, 5);
    image(space, x-5, y, w+10, h);
  }
  
}
