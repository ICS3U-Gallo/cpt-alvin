class Player {
  float x, y, w, h, g;
  float xSpeed, ySpeed, maxSpeed;
  boolean topCollide, botCollide, leftCollide, rightCollide;
  
  Player() {
    x = 0;
    y = 600;
    w = 35;
    h = 35;
    g = 0.1;      //gravity
    
    xSpeed = 0;
    ySpeed = 0;
    maxSpeed = 6;
   
    leftCollide = false;
    rightCollide = false;
    leftCollide = false;
  }
  
  void player() {        //display player 
    noStroke();
    fill(255, 0, 0);
  //  rect(x, y, w, h);  
    image(chicken, x-5, y, w+10, h);
  }
  
  void playerScore() {
    textSize(20);                  //display cards collected
    text("Pokemon Cards: " + cardCount + "/4", 20, 20);
  }
  
  void lives() {
    textSize(20);              //display lives
    text("Lives: " + lives, 300, 20);
  }
  
  void noLives() {
    if (lives == 0) {            //when player runs out of lives, change screen
      screen = "gameover";       //to game over screen
    }
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
  
  
  void boundaries() {     //boundaries for player so he cant move out of screen
    if (x >= width-p.w) {
      x = width-p.w;        //player stays in place if he touches boundaries
    } if (x <= 0) {
      x = 0;
    } if (y <= 0) {
      y = 0;
    } 
  }
  
  void noFall() {
      if (right && p.y >= 705 || right && p.x >= platforms[14].x && p.x <= platforms[14].x+10
          && p.y > platforms[14].y) {
        p.x -= 20;
        p.y = 700-p.h-5;      //sometimes player falls through ground 
        right = false;        //put them back on platform
        left = false;
      } else if (left && p.y >= 705 || left && p.x >= platforms[14].x+platforms[15].w-5 
        && p.x <= platforms[14].x+platforms[14].w && p.y > platforms[14].y) {
        p.x += 20;
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
