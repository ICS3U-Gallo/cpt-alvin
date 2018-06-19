class Fireball {
  float x, y, w, h;
  
  Fireball(float startX, float startY, float startW, float startH) {
    x = startX;
    y = startY;
    w = startW;
    h = startH;
  }
  
  void display() {  //fireball appearance
  //  noStroke();
//    fill(0, 0, 100);
  //  rect(x, y, w, h);
    image(fireball, x, y, w, h);
  }
}
