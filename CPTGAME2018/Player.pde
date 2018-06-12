class Player {
  float x, y, w, h, g;
  float xSpeed, ySpeed, maxSpeed;
  boolean topCollide, botCollide, leftCollide, rightCollide;
  
  Player() {
    x = 0;
    y = 600;
    w = 25;
    h = 25;
    g = 0.1;      //gravity
    
    xSpeed = 0;
    ySpeed = 0;
    maxSpeed = 6;
   
    leftCollide = false;
    rightCollide = false;
    leftCollide = false;
  }
  
  void player() {
    noStroke();
    fill(255, 0, 0);
    rect(x, y, w, h);
  }
  
  void playerScore() {
    textSize(20);
    text("Pokemon Cards: " + cardCount + "/4", 20, 20);
  }
  
/*  void shoot() {
    if (key == KeyEvent.VK_RIGHT) {
      egg.shootRight();
    }
  } */
  
  void move() {
    if (left) {        //move left
      xSpeed = -5;
    } if (right) {     //move right
      xSpeed = 5;
    } else if (!left && !right) {   //no movement in x-axis if left and right isn't pressed
      xSpeed = 0;
    } if (up && topCollide) {  // only jump once when on platform
      ySpeed = -7;
    } if (!topCollide) {
      ySpeed += g;
    } if (right && leftCollide && topCollide) {
      ySpeed = 0;
    } if (up && leftCollide) {
      //up = false;
    } if (right && leftCollide) {
      //ySpeed = 0;
    }
    
    x += xSpeed;      
    y += ySpeed;
    
    if (ySpeed >= maxSpeed) {    //player's maximum speed 
      g = 0;
    } else {
      g = 0.3;
    }
  }
  
  void shoot() {
    if (key == RIGHT) {
     // shootRight();
    } else if (key == LEFT) {
    //  shootLeft();
    }
  }
  
  void boundaries() {     //boundaries for player so he cant move out of screen
    if (x >= width-p.w) {
      x = width-p.w;        //player stays in place if he touches boundaries
    } if (x <= 0) {
      x = 0;
    } if (y <= 0) {
      y = 0;
    } if (y >= height-50) {
      y = height-50;
    }
  }
  
  void noFall() {
    if (p.y >= 705) {
      p.y = 700-p.h-5;      //sometimes player falls through ground 
      right = false;        //put them back on platform
      left = false;
    }
  }
  
  void touchPlatformTop(float locY) {
     ySpeed = 0;      // if player touches platform, he stops moving down
     topCollide = true;  
     y = locY-h; //player's location at y always stays -player height from platform when
   }              // touching any platform. So player will always be standing on platform
   
   void touchPlatformBot() { // when player jumps and hits the bottom of a platform
    ySpeed = 0;
    botCollide = true;      // he won't go through
    
  }
  
  void touchPlatformLeft() {  // player can't jump through left side of platforms
    x = x-5;
    leftCollide = true;
    right = false;
  }
  
  void touchPlatformRight() { // player can't jump through right side of platforms
    x = x+5;
    rightCollide = true;
    left = false;
  }
  
 /* void topLeftCollide() {
    x = x-5;
    leftCollide = true;
    xSpeed = 0;
  }*/
  
  void enemyCollide() {
   // for (int i = 0; i < enemies.length; i++) {
     // if (intersectEnemy(p, enemies[i])) {
       // screen = "gameover";
    //  }
  //  }
  }
}
