class Enemy {
  float x, y, w, h /*, g*/;
  float ySpeed;
  //boolean enemyTopCollide;
 
  Enemy(float startX, float startY, float startW, float startH) {
    x = startX;
    y = startY;
    w = startW;
    h = startH;
   // g = 0.3;
    
    ySpeed = 0;
   // enemyTopCollide = false;
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
