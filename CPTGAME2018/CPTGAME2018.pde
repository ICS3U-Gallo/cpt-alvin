import java.awt.event.KeyEvent;

Player p;        
Portal po;
Level l;
Platform[] platforms;  
Enemy[] enemies;       
Sword[] swords;
PVector[] swordz;
Fireball[] fireballs;
Pokemon[] pokemons;
Portal[] portals;  
float platformSpeed;
PImage chicken, oven, pokemoncard, magikarpCard, stunfiskCard, arceusCard, soitsuCard, roastedchicken, sword, swordleft, fireball, portal,
       punchleft, grass, space, swordDown, swordRight;
String screen;
boolean left, right, up, down;
int cardCount, enemySpeed, playerSpeed, lives;  

void setup() {
  size(1366, 768);
  smooth();
  screen = "menu";          //screen
  p = new Player();
  l = new Level();
  chicken = loadImage("chicken.png");
  oven = loadImage("oven.png");
  sword = loadImage("sword.png");
  pokemoncard = loadImage("pokemoncard.png"); 
  magikarpCard = loadImage("magikarp.jpeg");      //pictures uploaded
  stunfiskCard = loadImage("stunfisk.jpg");
  arceusCard = loadImage("arceuscard.jpeg");
  soitsuCard = loadImage("soitsu.png");
  roastedchicken = loadImage("roastedchicken.png");
  fireball = loadImage("fireball.png");
  portal = loadImage("portal.png");
  punchleft = loadImage("punchleft.png");
  grass = loadImage("grass.png");
  space = loadImage("space.png");
  swordDown = loadImage("sworddown.png");
  swordRight = loadImage("swordright.png");
 // swordleft = loadImage("swordleft.png");
  cardCount = 0;
  lives = 3;
  enemySpeed = 5;
  playerSpeed = 3;
  swordz = new PVector[15];
  for(int i = 0; i < swordz.length; i++) {    //setup a PVector for swordz
    float x = random(100, width);  //swordz (x position) appear between 100 and width of screen
    float y = random(0, 400);      //swordz (y position) appear between 0 and 400 in the beginning
    swordz[i] = new PVector(x, y);    //set PVector to each swordz
  }
  platforms = new Platform[37];     //location of platforms
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
  platforms[15] = new Platform(250, 690, 50, 10);
  platforms[14] = new Platform(950, 500, 200, 200);
  platforms[16] = new Platform(0, 700, width, 200);
  platforms[17] = new Platform(200, 200, 50, 50);
  platforms[18] = new Platform(0, 200, 100, 30);
  platforms[19] = new Platform(250, 450, 100, 30);
  platforms[20] = new Platform(400, 150, 50, 50);        // lvl 1
  platforms[21] = new Platform(1200, 0, 100, 200);
  platforms[22] = new Platform(600, 200, 700, 50);
  platforms[23] = new Platform(90, 590, 10, 10);
  platforms[24] = new Platform(0, 600, 100, 30);
  platforms[25] = new Platform(250, 690, 50, 10);
  //----------------------------------------------
  platforms[26] = new Platform(400, 525, 40, 40);
  platforms[27] = new Platform(300, 650, 700, 20);
  platforms[28] = new Platform(0, 600, 300, 20);
  platforms[29] = new Platform(1000, 600, 366, 20);
  platforms[30] = new Platform(550, 420, 40, 40);
  platforms[31] = new Platform(650, 500, 40, 40);      //lvl2
  platforms[32] = new Platform(800, 580, 40, 40);
  platforms[33] = new Platform(200, 250, 200, 40);
  platforms[34] = new Platform(700, 350, 40, 40);
  platforms[35] = new Platform(500, 300, 40, 40);
  //----------------------------------------------
  platforms[36] = new Platform(0, 600, width, 50);     //lvl3
  
  platformSpeed = 3;
  
  /*for(int i = 0; i < platforms.length; i++) {
    platforms[i].y += platformSpeed;
    platforms[i].x += platformSpeed;
  }*/
 
  enemies = new Enemy[5];  //location of enemies
  enemies[0] = new Enemy(500, 640, 60, 60);
  enemies[1] = new Enemy(1100, 400, 50, 50);        //lvl 1
  enemies[2] = new Enemy(1400, 0, 200, 200);
  //------------------------------------------------
  enemies[3] = new Enemy(575, 300, 50, 50);            // tutorial 
  enemies[4] = new Enemy(1200, 650, 50, 50);
  //------------------------------------------------
  
  
  pokemons = new Pokemon[4];      //location of pokemon cards
  pokemons[0] = new Pokemon(350, 75, 30, 50);      // tutorial
  //----------------------------------------------
  pokemons[1] = new Pokemon(1150, 100, 30, 50);    // lvl1
  //---------------------------------------------- 
  pokemons[2] = new Pokemon(230, 200, 30, 50);     // lvl2
  //-----------------------------------------------
  pokemons[3] = new Pokemon(650, 550, 30, 50);  // lvl3
  
  swords = new Sword[7];      //location of swords
  swords[0] = new Sword(307, 700, 20, 120);
  swords[1] = new Sword(327, 700, 20, 120);      //tutorial
  swords[2] = new Sword(347, 700, 20, 120);
  //--------------------------------------------
  swords[3] = new Sword(-150, 220, 100, 10); 
  swords[4] = new Sword(1000, -100, 20, 50); 
  swords[5] = new Sword(1020, -100, 20, 50);       //lvl1
  swords[6] = new Sword(1040, -100, 20, 50); 
  
  /*for (int i = 7; i < 20; i++) {
    int x = 0;
    swords[i] = new Sword(x, 700, 30, 100);
    x += 50;
  }*/
  
  portals = new Portal[4];    //location of portal
  portals[0] = new Portal(1320, 690, 10, 10);
  portals[1] = new Portal(1320, 690, 10, 10);
  portals[2] = new Portal(1320, 590, 10, 10);
  portals[3] = new Portal(-100, 590, 10, 10);
  
  fireballs = new Fireball[6];    //location of fireballs
  fireballs[0] = new Fireball(700, 500, 50, 70);    // tutorial
  //------------------------------------------------
  fireballs[1] = new Fireball(300, 400, 100, 100);
  fireballs[2] = new Fireball(450, 550, 100, 100);
  fireballs[3] = new Fireball(600, 700, 100, 100);
  fireballs[4] = new Fireball(750, 850, 100, 100);
  fireballs[5] = new Fireball(900, 1000, 100, 100);
  
}
  
void draw() {
  if (screen == "menu") {
    menu();
  } if (screen == "instructions") {
    instructions();
  } if (screen == "pretutorial") {
    pretutorial();
  } if (screen == "tutorial") {            //change screens 
    tutorial();
  } if (screen == "tutorialPass") {
    tutorialPass();
  } if (screen == "lvl1") {      
    lvl1();
  } if (screen == "lvl2") {
    lvl2();
  } if (screen == "lvl3") {
    lvl3();
  } else if (screen == "gameover") {
    gameover();
  } else if (screen == "card1") {
    card1();
  } else if (screen == "card2") {
    card2();
  } if (screen == "card3") {
    card3();
  } if (screen == "card4") {
    card4();
  } if (screen == "victory") {
    victory();
  }
}

void menu() {
  background(#87CEEB);
  fill(#FDFD13);
  ellipse(1200, 150, 200, 200);
  textSize(100);
  fill(100, 100, 100);
  text("Bob's Adventure", 280, 150);
  fill(#608038);
  noStroke();
  rect(0, 650, width, 200);
  if (mouseX > 460 && mouseX < 860 && mouseY > 250 && mouseY < 350) {
    fill(0, 150, 0, 255);     // play button
  } else {
    fill(0, 150, 0, 170);     //change opacity when mouse is on button
  }
  rect(460, 250, 400, 100);
  if (mouseX > 460 && mouseX < 860 && mouseY > 400 && mouseY < 500) {
    fill(0, 150, 0, 255);        //instructions button
  } else {
    fill(0, 150, 0, 170);        //change opacity when mouse is on button
  }
  rect(460, 400, 400, 100);
  
  textSize(70);
  fill(255, 0, 0);
  text("PLAY", 570, 320);
  textSize(50);
  text("INTRUCTIONS", 495, 470); 
}

void instructions() {
  background(255,165,0);
  textSize(100);
  fill(255, 0, 255);
  text("INTRUCTIONS", 350, 150);
  textSize(40);
  text("CONTROLS:", 200, 250);
  text("OBJECTIVE:", 200, 480);
  fill(139,69,19);
  text("JUMP: Up arrow key", 200, 300);
  text("MOVE LEFT: Left arrow key", 200, 350);
  text("MOVE RIGHT: Right arrow key", 200, 400);
  text("Your goal is to collect a pokemon card from each", 200, 530);
  text("level and make it to the portal to continue your", 200, 580);
  text("adventure, while dodging obstacles along the way.", 200, 630); 
  fill(32,178,170);
  text("Press SPACE to go back to menu screen", 300, 700);
  if (keyPressed) {
    if (key == KeyEvent.VK_SPACE) {  //in gameover screen
      screen = "menu";                    //press backspace key to go to menu
    }
  }
}
  
void pretutorial() {
  background(106,90,205);
  image(chicken, 600, 550, 150, 150);
  textSize(50);
  fill(255,165,0);
  text("Hello there, I have been searching for the most", 100, 100); 
  text("valuable pokemon cards out there in this world.", 100, 200);
  text("It is my passion to collect pokemon cards, and", 100, 300);
  text("I will not stop until I collect every single pokemon", 100, 400);
  text("card created. Will you help me on my adventure?", 100, 500);
  noStroke();

 if (mouseX > 275 && mouseX < 575 && mouseY > 550 && mouseY < 650) {
    fill(200, 0, 0, 255);     // yes button
  } else {
    fill(200, 0, 0, 170);     //change opacity when mouse is on button
  }
  rect(275, 550, 300, 100);
  if (mouseX > 775 && mouseX < 1075 && mouseY > 550 && mouseY < 650) {
    fill(200, 0, 0, 255);        //no button
  } else {
    fill(200, 0, 0, 170);        //change opacity when mouse is on button
  }
  rect(775, 550, 300, 100);
  
  fill(135,206,250);
  textSize(70);
  text("YES!", 360, 625); 
  text("NOPE", 835, 625);
  
  fill(0, 0, 0);
  textSize(20);
  text("(You will do a tutorial if you press yes)", 490, 730);
  
}

void tutorial() {
  background(176,224,230);
  l.tutorial();
  p.player();
  p.playerScore();          
  p.lives();
  p.boundaries();
  p.move();
  p.enemyCollide();
  p.noLives();
}

void tutorialPass() {          //screen after you pass tutorial level
  background(255,182,193);
  textSize(50);
  fill(255, 255, 0);
  text("Well Done!", 550, 200);
  fill(0, 0, 150);
  text("With your help, I am ready to go on my adventure", 100, 300);
  text("Let's get those pokemon cards!!!", 280, 400);
  fill(255,20,147);
  text("Press SPACE to proceed to the next level", 180, 600);
  if (keyPressed) {
    if (key == KeyEvent.VK_SPACE) {  //in gameover screen
      screen = "lvl1";                    //press backspace key to go to menu
      p.x = 0;
      p.y = 150;
    }
  }
  
}

void lvl1() {              //lvl 1 screen
  background(135,206,250);
  l.lvl1();
  p.player();
  p.playerScore();
  p.lives();
  p.boundaries();
  p.move();
  p.noFall();
  p.noLives();
}

void lvl2() {
  background(176,224,230);
  l.lvl2();
  p.player();
  p.playerScore();
  p.lives();
  p.boundaries();
  p.move();
  p.noLives();
}

void lvl3() {
  l.lvl3();
  p.player();
  p.boundaries();
  p.playerScore();
  p.lives();
  p.noLives();
  p.move();
  textSize(60);
  text("USE THE FORCE!", 450, 350);
}

void gameover() {          //gameover screen
  background(0);
  fill(255, 0, 0);
  textSize(100);
  text("GAME OVER!", 350, 200);
  image(roastedchicken, 450, 250, 500, 300);
  textSize(40);
  fill(199,21,133);
  text("Click BACKSPACE to return to the menu", 300, 650);
    
  if (keyPressed) {
    if (key == KeyEvent.VK_BACK_SPACE) {  //in gameover screen
      setup();             //press backspace to restart the game
    }
  }
}

void victory() {
  background(135,206,250);
  image(chicken, 400, 150, 500, 500);
  textSize(150);
  fill(255,140,0);
  text("I WIN!", 475, 300); 
  textSize(60);
  fill(255, 0, 0, 200);
  text("I collected all the pokemon cards!!!", 150, 400);
  text("All by myself! With no help at all!", 200, 500);
  fill(32,178,170);
  text("You can go away now.", 370, 600);
}

/*void tree() {      //drawing of tree
  fill(139,69,19);
  rect(1250, 150, 20, 100);
  triangle(30, 75, 58, 20, 86, 75);
}*/

void card1() {                //screen when you collect pokemon card1
  background(34,139,34);
  textSize(60);
  fill(255, 255, 0);
  text("CARD EARNED!", 200, 150);
  fill(255, 0, 0);
  text("WOW NICE!!! YOU JUST", 75, 275);
  text("GOT A SUPER ULTRA", 75, 375);
  text("RARE LIMITED EDITION", 75, 475);
  text("ONE OF A KIND MAGIKARP", 50, 575);
  textSize(40);
  fill(0, 0, 255);
  text("Press SPACE to continue", 175, 675);
  image(magikarpCard, 850, 50, 475, 663);
  if (keyPressed) {
    if (key == KeyEvent.VK_SPACE) {
      screen = "tutorial";
    }
  }
}

void card2() {                        //screen when you collect pokemon card2
  background(105,105,105);
  textSize(60);
  fill(255, 255, 0);
  text("CARD EARNED!", 200, 150);
  fill(255, 0, 0);
  text("SO COOL!!! WHAT A", 75, 275);
  text("WONDERFUL POKEMON!", 75, 375);
  text("One of the most antique", 75, 475);
  text("pokemon cards in the world.", 10, 575);
  textSize(40);
  fill(0, 0, 255);
  text("Press SPACE to continue", 175, 675);
  image(stunfiskCard, 850, 50, 475, 663);
  if (keyPressed) {
    if (key == KeyEvent.VK_SPACE) {
      screen = "lvl1";
    }
  }
}

void card3() {                    //screen when you collect pokemon card3
  background(150, 100, 100);
  
  textSize(60);
  fill(255, 255, 0);
  text("CARD EARNED!", 200, 150);
  fill(127, 0, 0);
  text("Oh, it's just an arceus.", 75, 275);
  text("What a useless card.", 75, 375);
  text("No one would even pay", 75, 475);
  text("a dollar for it...", 75, 575);
  textSize(40);
  fill(0, 0, 255);
  text("Press SPACE to continue", 175, 675);
  image(arceusCard, 850, 50, 475, 663);
  if (keyPressed) {
    if (key == KeyEvent.VK_SPACE) {
      screen = "lvl2";
    }
  }
}

void card4() {                            //screen when you collect pokemon card1
  background(10, 160, 100);
  
  textSize(60);
  fill(127, 0, 0);
  text("CARD EARNED!", 200, 150);
  text("WOW!!! WHAT A LUCKY", 75, 275);
  text("FIND! It is said that soitsu", 75, 375);
  text("can purify even the most", 75, 475);
  text("wicked demons.", 75, 575);
  textSize(40);
  fill(0, 0, 255);
  text("Press SPACE to continue", 175, 675);
  image(soitsuCard, 850, 50, 475, 663);
  if (keyPressed) {
    if (key == KeyEvent.VK_SPACE) {
      screen = "lvl3";
    }
  }
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

//Every collision is centered around the player's topleft corner
//So p.x > pl.x-p.w would mean the player would collide when the topleft corner of
//the player is the player's width away from the leftside of the collided item
//Same thing for the y position.
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

boolean intersectEnemy(Player p, Enemy e) {  //collision detection when player and enemy collide
  
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

boolean intersectPortal(Player p, Portal po) {  //collision detection when player and portal collide
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

boolean intersectFireball(Player p, Fireball f) { //collision detection when player and fireball collide
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

boolean intersectSword(Player p, Sword s) { //collision detection when player and sword collide
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

boolean intersectPokemon(Player p, Pokemon c) { //collision detection when player and pokemon card collide
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

void mouseClicked() {  //teleport player anywhere you want
  p.x = mouseX;        //for testing
  p.y = mouseY;
  p.g = 0;
  p.g = 0.3;
} 

void mouseReleased() {  //if mouse is on a specific button and released, go to specific screen
  if (screen == "menu") {    //only in the menu
    if(mouseX > 460 && mouseX < 860 && mouseY > 250 && mouseY < 350) {
      screen = "pretutorial";
    } if (mouseX > 460 && mouseX < 860 && mouseY > 400 && mouseY < 500) {
      screen = "instructions";    
    }
  }
  if (screen == "pretutorial") { //if mouse is on specific button and released, go to specific screen
    if (mouseX > 275 && mouseX < 575 && mouseY > 550 && mouseY < 650) {
      screen = "tutorial";      //only in pretutorial
    } if (mouseX > 775 && mouseX < 1075 && mouseY > 550 && mouseY < 650) {
      screen = "menu";
    }
  }
}
