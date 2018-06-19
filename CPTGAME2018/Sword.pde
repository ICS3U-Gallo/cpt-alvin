class Sword {
  float x, y, w, h;
  
  Sword(float startX, float startY, float startW, float startH) {
    x = startX;
    y = startY;
    w = startW;
    h = startH;
  }
  
  void display() {      //display sword (facing up)
  //  noStroke();
//    fill(0, 0, 100);
   // rect(x, y, w, h);
    image(sword, x, y, w, h);
  }
 
  void swordRight() {      //display sword (facing right)
  //  noStroke();
//    fill(0, 0, 100);
   // rect(x, y, w, h);
    image(swordRight, x, y, w, h);
  }
}
