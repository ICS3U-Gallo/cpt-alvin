class Enemy {
  float x, y, w, h;
 
  Enemy(float startX, float startY, float startW, float startH) {
    x = startX;
    y = startY;
    w = startW;
    h = startH;
  }

 void weak() {
    noStroke();
    fill(0, 128, 143);
    rect(x, y, w, h);
  }
  
  void mediocre() {
    noStroke();
    fill(154,205,50);
    rect(x, y, w, h);
  }
  
  void punchleft() {
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
