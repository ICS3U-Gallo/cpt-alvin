class Enemy {
  float x, y, w, h;
 
  Enemy(float startX, float startY, float startW, float startH) {
    x = startX;
    y = startY;
    w = startW;
    h = startH;
  }

 void display() {  //enemy appearance
  //  noStroke();
   // fill(0, 128, 143, 100);
    image(oven, x, y, w, h+5);
    //rect(x, y, w, h);  
  }

  void punchleft() {  //different type of enemy
   // rect(x, y, w, h);
    image(punchleft, x-30, y-30, w+30, h+70);
  }
  
  
  /*void move() {
    if (enemyTopCollide) {
      ySpeed = 0;
    } if (!enemyTopCollide) {
      ySpeed += g;
    } 
    y += ySpeed;
  }
  void touchPlatformTop(float locY) {
   ySpeed = 0;      // if enemy touches platform, he stops moving down
   enemyTopCollide = true;  
   y = locY-h; //enemy's location at y always stays -player height from platform when
  }              // touching any platform. So enemy will always be standing on platform
  */
}
