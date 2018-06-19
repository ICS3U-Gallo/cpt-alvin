class Level { 

  void tutorial() {
  //  tree();
    for (int i = 0; i < 3; i++) {
      swords[i].display();          //display some swords in the array
    }
    
    for (int i = 0; i < 3; i++) {
      if (intersectSword(p, swords[i])) {  //if hit by sword you lose life
        lives -= 1;                      //and sent back to starting point
        p.x = 0;
        p.y = 600;
      } 
    }
    
    
    portals[0].display();
    if (intersectPortal(p, portals[0]) && pokemons[0].x == -100) {
      screen = "tutorialPass";
    } else if (intersectPortal(p, portals[0]) && pokemons[0].x != 100) {
      p.x = 0;
      p.y = 600;      // if you didnt collect pokemon card, you are sent back where
    }                // you started
    
    

    pokemons[0].display();
    if (intersectPokemon(p, pokemons[0])) {   //display pokmon card
      pokemons[0].x = -100;
      cardCount += 1;            //increase card collected and change screen
      screen = "card1";
    }
    
    
 /*   for (int i = 0; i < 1; i++) {
      fireballs[i].display();
      if (intersectFireball(p, fireballs[i])) {
        screen = "gameover";
      }
    } */ 
    
    for (int i = 0; i < 14; i++) {    // show the visual of the level
      platforms[i].display();
    }
    
    for (int i = 0; i < 14; i++) {    // apply collisions
      if (topCollide(p, platforms[i])) {
        p.touchPlatformTop(platforms[i].y);
        break;
      } 
      if (botCollide(p, platforms[i])) {
        p.touchPlatformBot();
        break;
      } 
      if (leftCollide(p, platforms[i])) {
        p.touchPlatformLeft();
        break;
      } 
      if (rightCollide(p, platforms[i])) {
        p.touchPlatformRight();
        break;
        //} if (p.y >= platforms[0].y) {
        //p.y = platforms[0].y-p.h;
      } else {
        p.topCollide = false;
        p.botCollide = false;
        p.leftCollide = false;
        p.rightCollide = false;
      }
    }

    if (topCollide(p, platforms[6])) {
      if (platforms[6].y >= 200) {        //platform movement
        platforms[6].y -= 2;              //move up if on top of platform
      }
    } 
    
    if (!topCollide(p, platforms[6])) {
      if (platforms[6].y <= 530) {
        platforms[6].y += 3;        //move down if not on top of platform
      }
    } 
    
    if (topCollide(p, platforms[5])) {
      if (platforms[5].y >= 581) {          //platform moving up if player
        platforms[5].y -= 5;                //is on this platform
      }
    } 
    
    if (!topCollide(p, platforms[5])) {
      if (platforms[5].y <= 690) {         //the same platform moving down
        platforms[5].y += 1;              //if player not on it
      }
    }
    
    for (int i = 3; i < 4; i++) {
      enemies[i].display();          //display enemies
      if (intersectEnemy(p, enemies[i])) {
        lives -= 1;
          p.x = 0;             //if collide with enemies, lose 1 life
          p.y = 600;           //and respawn to starting point
      } 
    }

    enemies[3].x -= 5;
    enemies[3].y -= 5;                  //enemy movement diagonally
    if (enemies[3].y < -50) {
      enemies[3].y = height+50;        //if move out of screen, reset enemy location
      enemies[3].x = width-300;
    }
    
    enemies[4].y -= enemySpeed;
    if (enemies[4].y >= 650) {
      enemySpeed = 5;                 //enemy movement up and down
      enemies[4].y -= enemySpeed;     //if enemy moves to a certain point, reverse speed
    } else if (enemies[4].y <= 500) {
      enemySpeed = -enemySpeed;
    }
    

    for (int i = 0; i < 3; i++) {
      if (p.x > 250) {            //sword is originally hidden
        swords[i].y = 580;        //swords appear when player passes a certain point 
      } 
    }
    
    for (int i = 0; i < 1; i++) {
      fireballs[i].display();              //display fireballs
      fireballs[0].y -= 10;
      if (fireballs[0].y <= -50) {         //reset fireball location when it leaves screen
        fireballs[0].y = height+50;
      } if (intersectFireball(p, fireballs[i])) {
        lives -= 1;
        p.x = 0;              //if player collide with fireball, lose life
        p.y = 600;            //reset player location to starting point
      }
    }
    

    // if (enemies[y] 
    /*if (platforms[11].y <= 530 && platforms[11].y >= 200) {
     platformSpeed = 2;
     platforms[11].y -= platformSpeed;
     } else if (platforms[11].y <= 200) {
     platformSpeed = -platformSpeed;
     }*/
  } 
  
  void tutorialPass() {
    
  }

  void lvl1() {
  
    swords[3].swordRight();              //display sword (different image)
    if (intersectSword(p, swords[3])) {      //if player collide with this sword
        lives -= 1;                         //lose life
        p.x = 0;                            //and reset player location to starting point
        p.y = 100;
    }
    for (int i = 4; i < 7; i++) {
      swords[i].display();                  //display swords
      if (intersectSword(p, swords[i])) {   //if player collides with these swords
        lives -= 1;                         //lose life
        p.x = 0;                            //and reset player location
        p.y = 100;
      }
    }
    
    portals[1].display();    //display portal 
    if (intersectPortal(p, portals[1]) && pokemons[1].x == -100) { 
      screen = "lvl2";    //if player collide with portal and collected pokemon card
      p.x = 0;            //player moves to next level
      p.y = 550;
    } else if (intersectPortal(p, portals[1]) && pokemons[1].x != 100) {
      p.x = 0;
      p.y = 150;     // if you didnt collect pokemon card, you are sent back where
    }                // you started
    
    pokemons[1].display(); // pokemon card
    if (intersectPokemon(p, pokemons[1])) {  //if player collide pokemon card
      screen = "card2";            //go to card screen
      cardCount += 1;              //increase cards collected
      pokemons[1].x = -100;        
    } if (pokemons[1].x == -100) {  //if card collected, trigger enemy movement
      enemies[2].x -= 25;
    } if (intersectEnemy(p, enemies[2])) {    //when fist hits player, move swords away
      p.x -= 35;
      p.y -= 7;
      swords[4].x = -100;
      swords[5].x = -100;
      swords[6].x = -100;
    }

    
    for (int i = 14; i < 26; i++) {    // show the visual of the level
      platforms[i].display();
    }

    for (int i = 0; i < 2; i++) {    //display enemies
      enemies[i].display();
    }
    
    enemies[2].punchleft();    //display enemy (different type) it's a fist

    for (int i = 14; i < 26; i++) {    // apply collisions
      if (topCollide(p, platforms[i])) {
        p.touchPlatformTop(platforms[i].y);
        break;
      } 
      if (botCollide(p, platforms[i])) {
        p.touchPlatformBot();
        break;
      } 
      if (leftCollide(p, platforms[i])) {
        p.touchPlatformLeft();
        break;
      } 
      if (rightCollide(p, platforms[i])) {
        p.touchPlatformRight();
        break;
        //} if (p.y >= platforms[0].y) {
        //p.y = platforms[0].y-p.h;
      } else {
        p.topCollide = false;
        p.botCollide = false;
        p.leftCollide = false;
        p.rightCollide = false;
      }
    }

    platforms[19].x += platformSpeed;
    if (platforms[19].x >= 750) {          //platform movement left and right
      platformSpeed = -platformSpeed;      //reverse speed if reaches a certain point
    } else if (platforms[19].x <= 150) {
      platformSpeed = -platformSpeed;
    }
    
    if (topCollide(p, platforms[19]) && platforms[19].x <= 800) {
      p.x += platformSpeed;            //player stays still on the platform
    } else if (topCollide(p, platforms[19]) && platforms[19].x >= 150) {
      platformSpeed = -platformSpeed;
    }
    
    
    
    if (p.x > 200 && p.y < 200) {  //sword originally hidden
      swords[3].x = 250;           //sword revealed if player passes a certain point
    }
    
    for (int i = 4; i < 7; i++) {
      if (p.x > 900 && p.y < 200) {  //swords originally hidden
        swords[i].y = 150;            //reveal swords if player passes a certain point
      }
    }
    
    if (topCollide(p, platforms[23]) || topCollide(p, platforms[25])) {
      p.ySpeed -= 10;      //if player collides with these platforms
    }                      //player bounces up
    
    if (intersectEnemy(p, enemies[0]) || intersectEnemy(p, enemies[1])) {
      lives -= 1;        //if player collides with enemies
      p.x = 0;          // lose life and reset location
      p.y = 50;
    }
    
    enemies[0].x += enemySpeed;
    if (enemies[0].x >= 850) {      //enemy movement left and right
      enemySpeed = -enemySpeed;
    } if (enemies[0].x <= 350) {
      enemySpeed = -enemySpeed;
    }
    
    enemies[1].y -= 10;
    if (enemies[1].y < 250) {         //enemy moves upward
      enemies[1].y = height+50;       //if enemy reaches a certain point, reset location
    }
    /* for(int i = 0; i < 2; i++) {
     if (enemyTopCollide(enemies[i], platforms[i])) {
     enemies[i].touchPlatformTop(enemies[i].y);
     }
     } */


    /*  enemies[0].x -= 5;
     if (enemies[0].x <= 900) {
     enemies[0].x += 20;
     } else if (enemies[0].x >= 1000) {
     enemies[0].x -= 5;
     }
     */
  }
  
  void lvl2() {
     for (int i = 26; i < 36; i++) {    // show the visual of the level
      platforms[i].display2();
     }
     
     for (int i = 26; i < 36; i++) {    // apply collisions
      if (topCollide(p, platforms[i])) {
        p.touchPlatformTop(platforms[i].y);
        break;
      } 
      if (botCollide(p, platforms[i])) {
        p.touchPlatformBot();
        break;
      } 
      if (leftCollide(p, platforms[i])) {
        p.touchPlatformLeft();
        break;
      } 
      if (rightCollide(p, platforms[i])) {
        p.touchPlatformRight();
        break;
        //} if (p.y >= platforms[0].y) {
        //p.y = platforms[0].y-p.h;
      } else {
        p.topCollide = false;
        p.botCollide = false;
        p.leftCollide = false;
        p.rightCollide = false;
      }
    }
    
    portals[2].display();
    if (intersectPortal(p, portals[2]) && pokemons[2].x == -100) {
      screen = "lvl3";    //if collide with portal and pokemon card collected
      p.x = 0;            //go to level 3
      p.y = 300;
    } else if (intersectPortal(p, portals[2]) && pokemons[2].x != 100) {
      p.x = 0;          //if pokemon card not collected and collide with portal 
      p.y = 500;        //player sent back to where it started
    }
    
    pokemons[2].display(); // pokemon card
    if (intersectPokemon(p, pokemons[2])) {
      screen = "card3";      //if collide with pokemon card
      cardCount += 1;        //change to card screen
      pokemons[2].x = -100;
    }
     
   for(int i = 0; i < swordz.length; i++) {
    float ySpeed = random(0, 9);  //different ranges of speed of swordz falling
    // move each sword
    swordz[i].add(0, ySpeed); //each sword has a different speed from 0 to 9 flying downward

    // reset if they go too far
    if (swordz[i].y > height) {
      swordz[i].x = (int) random(100, width); //swords reappear anywhere between 100 and width of screen
      swordz[i].y = -100;                      //if it is moved pass the bottom of the screen
    }
      
      //draw swordz
      fill(0, 0, 255);
      //rect(swordz[i].x, swordz[i].y, 20, 100);
      image(swordDown, swordz[i].x, swordz[i].y, 20, 100);
      
      if (p.x >= swordz[i].x-p.w && p.x <= swordz[i].x+20) {
        if (p.y >= swordz[i].y-p.h && p.y <= swordz[i].y+100) {    //swordz collision
          lives -= 1;      //lose life
          p.x = 0;
          p.y = 530;      // respawn
        }
      }
    }
    
    if (p.y >= height) {
      lives -= 1;
      p.x = 0;           //if player falls below the screen
      p.y = 530;         //lose life and respawn
    }
  }
  
  void lvl3() {
    background(100, 100, 100);
    pokemons[3].display(); // pokemon card
    if (intersectPokemon(p, pokemons[3])) {
      screen = "card4";      //if player collides with pokemon card
      cardCount += 1;        //increase card count
      pokemons[3].x = -100;      //portal location is changed
      portals[3].x = 1320;
    } if (pokemons[3].x == -100) {
      portals[3].display();      //if pokemon card collected, reveal portal location
    }
    
    for (int i = 36; i < platforms.length; i++) {    // show the visual of the level
      platforms[i].display();
     }
     
     for (int i = 36; i < platforms.length; i++) {    // apply collisions
      if (topCollide(p, platforms[i])) {
        p.touchPlatformTop(platforms[i].y);
        break;
      } 
      if (botCollide(p, platforms[i])) {
        p.touchPlatformBot();
        break;
      } 
      if (leftCollide(p, platforms[i])) {
        p.touchPlatformLeft();
        break;
      } 
      if (rightCollide(p, platforms[i])) {
        p.touchPlatformRight();
        break;
        //} if (p.y >= platforms[0].y) {
        //p.y = platforms[0].y-p.h;
      } else {
        p.topCollide = false;
        p.botCollide = false;
        p.leftCollide = false;
        p.rightCollide = false;
      }
    }
    
   for (int i = 1; i < fireballs.length; i++) {
      fireballs[i].display();
      fireballs[i].y -= 15;               //display fireballs
      if (fireballs[i].y <= -50) {        //fireball movement
        fireballs[i].y = height+50;       //if fireball moves out of screen
      } if (p.x > 230 && right) {         //reset location
        fireballs[i].x += 5;              //if player moves past a certain location
      }                                   
    }
    
    for(int i = 0; i < swordz.length; i++) {
    float ySpeed = random(0, 15);
    // move each sword
    swordz[i].add(0, ySpeed); //each sword has a different speed from 0 to 15 flying downward

    // reset if they go too far
    if (swordz[i].y > height) {
      swordz[i].x = (int) random(300, 1100); //swordz reappear anywhere between 300 and 1100
      swordz[i].y = -100;                      //if it is moved pass the bottom of the screen
    }
      
      //draw swordz
      fill(0, 0, 255);
   //   rect(swordz[i].x, swordz[i].y, 20, 100);
      image(swordDown, swordz[i].x, swordz[i].y, 20, 100);
      
      if (p.x >= swordz[i].x-p.w && p.x <= swordz[i].x+20) {
        if (p.y >= swordz[i].y-p.h && p.y <= swordz[i].y+100) {    //swordz collision
          lives -= 1;      //lose life
          p.x = 0;
          p.y = 530;      // respawn
        }
      }
      
      if (p.x > 230 && right) {
        swordz[i].x += 5;        //swordz move away from player
        swordz[i].y -= 15;
      }
    }
    
    if (intersectPortal(p, portals[3]) && pokemons[3].x == -100) {
      screen = "victory";
    } 
      
  }
}
