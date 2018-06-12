import java.awt.event.KeyEvent;

Player p;        
Portal po;
Level l;
Platform[] platforms;  
Enemy[] enemies;       
Sword[] swords;
Fireball[] fireballs;
Pokemon[] pokemons;
Portal[] portals;  
float platformSpeed;
PImage pokemoncard, magikarpCard, roastedchicken, sword, swordleft, fireball, portal;
String screen;
boolean left, right, up, down, hitEnemy;
int cardCount, enemySpeed;  

void setup() {
  fullScreen();
  smooth();
  screen = "lvl1";
  p = new Player();
  l = new Level();
  sword = loadImage("sword.png");
  pokemoncard = loadImage("pokemoncard.png"); 
  magikarpCard = loadImage("magikarp.jpeg");
  roastedchicken = loadImage("roastedchicken.png");
  fireball = loadImage("fireball.png");
  portal = loadImage("portal.png");
 // swordleft = loadImage("swordleft.png");
  cardCount = 0;
  hitEnemy = false;
  enemySpeed = 0;
  //  e = new Enemy(1000, 600);
  platforms = new Platform[23];     //location of platforms
  //------------------------------------------------
  platforms[0] = new Platform(200, 630, 100, 70);
  platforms[1] = new Platform(375, 580, 100, 120);
  platforms[2] = new Platform(550, 350, 100, 400);      //tutorial
  platforms[3] = new Platform(0, 700, width, 68);
  platforms[4] = new Platform(375, 400, 100, 13);
  platforms[5] = new Platform(475, 695, 75, 10);
  platforms[6] = new Platform(80, 530, 130, 20);
  platforms[7] = new Platform(300, 125, 100, 10);
  platforms[8] = new Platform(550, 0, 100, 200);
  platforms[9] = new Platform(800, 400, 200, 50);
  platforms[10] = new Platform(650, 350, 150, 10);
  platforms[11] = new Platform(1000, 400, 50, 150);
  platforms[12] = new Platform(900, 500, 50, 150);
  platforms[13] = new Platform(1100, 250, 300, 250);
//-------------------------------------------------------
  platforms[14] = new Platform(950, 500, 200, 200);
  platforms[15] = new Platform(0, 700, width, 200);
  platforms[16] = new Platform(0, 100, 100, 30);
  platforms[17] = new Platform(50, 350, 100, 30);
  platforms[18] = new Platform(200, 200, 50, 50);
  platforms[19] = new Platform(400, 150, 50, 50);        // lvl 1
  platforms[20] = new Platform(700, 0, 100, 200);
  platforms[21] = new Platform(600, 200, 200, 50);
  platforms[22] = new Platform(0, 600, 100, 30);
  
  
  
  platformSpeed = 0;
  for(int i = 0; i < platforms.length; i++) {
    platforms[i].y += platformSpeed;
    platforms[i].x += platformSpeed;
  }
 
  enemies = new Enemy[4];  //location of enemies
  enemies[0] = new Enemy(250, 410, 40, 40);
  enemies[1] = new Enemy(1100, 400, 100, 100);        //lvl 1
  //------------------------------------------------
  enemies[2] = new Enemy(575, 300, 50, 50); 
  enemies[3] = new Enemy(1200, 650, 50, 50);
  
  pokemons = new Pokemon[1];      //location of pokemon cards
  pokemons[0] = new Pokemon(350, 75, 30, 50);
  
  swords = new Sword[7];      //location of swords
  swords[0] = new Sword(307, 700, 20, 120);
  swords[1] = new Sword(327, 700, 20, 120);      //tutorial
  swords[2] = new Sword(347, 700, 20, 120);
  //--------------------------------------------
  swords[3] = new Sword(250, 220, 100, 10); 
  swords[4] = new Sword(600, 100, 100, 10); 
  swords[5] = new Sword(600, 120, 100, 10);       //lvl1
  swords[6] = new Sword(600, 140, 100, 10); 
  
  portals = new Portal[1];    //location of portal
  portals[0] = new Portal(1320, 690, 10, 10);
  
  fireballs = new Fireball[1];    //location of fireballs
  fireballs[0] = new Fireball(700, 500, 50, 70);
}
  
void draw() {
  if (screen == "tutorial") {            //change screens 
    tutorial();
  } if (screen == "tutorialPass") {
    tutorialPass();
  } if (screen == "lvl1") {      
    lvl1();
  } else if (screen == "gameover") {
    gameover();
  } else if (screen == "card1") {
    card1();
    if (keyPressed) {
      if (key == KeyEvent.VK_SPACE) {
        screen = "tutorial";
      }
    }
  }
}

void tutorial() {
  background(127, 0, 0);
  l.tutorial();
  p.player();
  p.playerScore();
  p.boundaries();
  p.move();
  p.enemyCollide();
  p.noFall();
}

void tutorialPass() {          //screen after you pass tutorial level
  background(0, 255, 0);
  textSize(50);
  text("Well Done!", width/2, 200);
  text("You are ready to go on your adventure.", 100, 300);
  
}

void lvl1() {              //lvl 1 screen
  background(135,206,250);
  p.player();
  p.boundaries();
  p.move();
  l.lvl1();
  p.enemyCollide();
  p.noFall();
 // enemies[0].move();
  println(p.topCollide, p.ySpeed, p.leftCollide);
}

void gameover() {          //gameover screen
  background(0);
  fill(255, 0, 0);
  textSize(100);
  text("GAME OVER!", 350, 200);
  image(roastedchicken, 450, 250, 500, 300);
  
  if (keyPressed) {
    if (key == KeyEvent.VK_BACK_SPACE) {
      screen = "menu";
    }
  }
}

void tree() {      //drawing of tree
  fill(139,69,19);
  rect(1250, 150, 20, 100);
  triangle(30, 75, 58, 20, 86, 75);
}

void card1() {                //screen when you collect pokemon card1
  background(0, 255, 0);
  textSize(60);
  fill(255, 0, 0);
  text("CARD EARNED!", 200, 150);
  text("WOW NICE!!! YOU JUST", 75, 275);
  text("GOT A SUPER ULTRA", 75, 375);
  text("RARE LIMITED EDITION", 75, 475);
  text("ONE OF A KIND MAGIKARP", 50, 575);
  textSize(40);
  fill(0, 0, 255);
  text("Press SPACE to continue", 175, 675);
  image(magikarpCard, 850, 50, 475, 663);
}

void keyPressed() {
  switch (keyCode) {
  case 37: //left arrow key
    left = true;              //When you press a button movement becomes true
    break;
  case 39://right arrow key
    right = true;             //Multiple buttons can be true, so you can move in
    break;                    //different ways, diagonally and vertically
  case 38://up arrow key
    up = true;
    break;
  case 40://down arrow key
    down = true;
    break;
  }
/*  case 32://space key
    fire = true;
    break; */

}

void keyReleased() {
  switch (keyCode) {
  case 37://left arrow key
    left = false;
    break;
  case 39://right arrow key
    right = false;               //When you release button movement becomes false
    break;
  case 38://up arrow key
    up = false;
    break;
  case 40://down arrow key
    down = false;
    break;
  }
/*  case 32://space key
    fire = true;
    break; */
}

boolean topCollide(Player p, Platform pl) {    
  
  if (p.x > pl.x-p.w && p.x < pl.x+pl.w) { // if player touches the top of a platform
    if (p.y >= pl.y-p.h && p.y <= pl.y-p.h+6){  // return true
      return true;
    }
  }
  return false;      //not touching platform return false
} 

boolean botCollide(Player p, Platform pl) {
  
  if (p.x > pl.x-p.w && p.x < pl.x+pl.w) {    //if player touches bottom of a platform
    if(p.y > pl.y+pl.h && p.y < pl.y+pl.h+5) {  //return true
      return true;
    }
  }
  return false;       //not touching platform return false
}

boolean leftCollide(Player p, Platform pl) {
  
 if (p.x >= pl.x-p.w && p.x <= pl.x) {
   if (p.y > pl.y-p.h && p.y < pl.y+pl.h) {
    return true;
   }
 }
  return false;    //not touching platform return false
}

boolean rightCollide(Player p, Platform pl) {
  
  if (p.x >= pl.x+pl.w && p.x <= pl.x+pl.w+5) {
    if (p.y > pl.y-p.h && p.y < pl.y+pl.h) {
    return true;
    }
  }
  return false;    //not touching platform return false
}

boolean intersectEnemy(Player p, Enemy e) {  
  
  float distanceX = (p.x + p.w/2) - (e.x + e.w/2);
  
  float distanceY = (p.y + p.h/2) - (e.y + e.h/2);

  float halfW = p.w/2 + e.w/2;

  float halfH = p.h/2 + e.h/2;

  if (abs(distanceX) < halfW) {

    if (abs(distanceY) < halfH) {
      return true;
    }
  }
  return false;
}

boolean intersectPortal(Player p, Portal po) {
  float distanceX = (p.x + p.w/2) - (po.x + po.w/2);
  
  float distanceY = (p.y + p.h/2) - (po.y + po.h/2);

  float halfW = p.w/2 + po.w/2;

  float halfH = p.h/2 + po.h/2;

  if (abs(distanceX) < halfW) {

    if (abs(distanceY) < halfH) {
      return true;
    }
  }
  return false;
}

boolean intersectFireball(Player p, Fireball f) {
  float distanceX = (p.x + p.w/2) - (f.x + f.w/2);
  
  float distanceY = (p.y + p.h/2) - (f.y + f.h/2);

  float halfW = p.w/2 + f.w/2;

  float halfH = p.h/2 + f.h/2;

  if (abs(distanceX) < halfW) {

    if (abs(distanceY) < halfH) {
      return true;
    }
  }
  return false;
}

boolean intersectSword(Player p, Sword s) {
  float distanceX = (p.x + p.w/2) - (s.x + s.w/2);
  
  float distanceY = (p.y + p.h/2) - (s.y + s.h/2);

  float halfW = p.w/2 + s.w/2;

  float halfH = p.h/2 + s.h/2;

  if (abs(distanceX) < halfW) {

    if (abs(distanceY) < halfH) {
      return true;
    }
  }
  return false;
}

boolean intersectPokemon(Player p, Pokemon c) {
  float distanceX = (p.x + p.w/2) - (c.x + c.w/2);
  
  float distanceY = (p.y + p.h/2) - (c.y + c.h/2);

  float halfW = p.w/2 + c.w/2;

  float halfH = p.h/2 + c.h/2;

  if (abs(distanceX) < halfW) {

    if (abs(distanceY) < halfH) {
      return true;
    }
  }
  return false;
}
  

void mouseClicked() {
  p.x = mouseX;
  p.y = mouseY;
  p.g = 0;
  p.g = 0.3;
}  
