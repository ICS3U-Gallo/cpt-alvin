class Sword {
  float x, y, w, h;
  
  Sword(float startX, float startY, float startW, float startH) {
    x = startX;
    y = startY;
    w = startW;
    h = startH;
  }
  
  void display() {
  //  noStroke();
//    fill(0, 0, 100);
    rect(x, y, w, h);
    image(sword, x, y, w, h);
  }
 
  void left() {
    rect(x, y, w, h);
    image(pokemoncard, x, y, w, h);
  }
}
