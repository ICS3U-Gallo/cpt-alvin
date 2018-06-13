class Level { 

  void tutorial() {
    tree();
    for (int i = 0; i < 3; i++) {
      swords[i].display();
    }
    
    for (int i = 0; i < 3; i++) {
      if (intersectSword(p, swords[i])) {
        //screen = "gameover";
      }
    }
    
    for (int i = 0; i < 1; i++) {
      portals[i].display();
      if (intersectPortal(p, portals[i])) {
        screen = "tutorialPass";
      }
    }

    for (int i = 0; i < 1; i++) {
      pokemons[i].display();
      if (intersectPokemon(p, pokemons[i])) {
        pokemons[i].x = -100;
        cardCount += 1;
        screen = "card1";
      }
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
      if (platforms[5].y >= 581) {
        platforms[5].y -= 5;
      }
    } 
    
    if (!topCollide(p, platforms[5])) {
      if (platforms[5].y <= 690) {
        platforms[5].y += 1;
      }
    }
    
    for (int i = 2; i < 4; i++) {
      enemies[i].mediocre();
    }

    enemies[2].x -= 5;
    enemies[2].y -= 5;
    if (enemies[2].y < -50) {
      enemies[2].y = height+50;
      enemies[2].x = width-300;
    }
    
    enemies[3].y -= enemySpeed;
    if (enemies[3].y >= 650) {
      enemySpeed = 5;
      enemies[3].y -= enemySpeed;
    } else if (enemies[3].y <= 500) {
      enemySpeed = -enemySpeed;
    }
    

    for (int i = 0; i < 3; i++) {
      if (p.x > 250) {
        swords[i].y = 580;
      } 
    }
    
    for (int i = 0; i < 1; i++) {
      fireballs[i].display();
      fireballs[0].y -= 10;
      if (fireballs[0].y <= -50) {
        fireballs[0].y = height+50;
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
    for (int i = 3; i < swords.length; i++) {
      swords[i].display();
    }
    
    for (int i = 4; i < 7; i++) {
      if (intersectSword(p, swords[i])) {
        screen = "gameover";
      }
    }
    
    pokemons[1].display();
    
    for (int i = 14; i < platforms.length; i++) {    // show the visual of the level
      platforms[i].display();
    }

    for (int i = 0; i < 1; i++) {
      enemies[i].weak();
    }

    for (int i = 1; i < 2; i++) {
      enemies[i].mediocre();
    }
    
    enemies[2].punchleft();

    for (int i = 14; i < platforms.length; i++) {    // apply collisions
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
    
    platformSpeed = 1;
    if (topCollide(p, platforms[17])) {
      p.x += platformSpeed;
      if (platforms[17].x <= 650) {
        platforms[17].x += platformSpeed;
      } else if (platforms[17].x >= 50) {
        platforms[17].x += -platformSpeed;      }
    }
    
    enemySpeed = 30;
    if (p.x > 600 && p.y < 200) {
      enemies[2].x -= enemySpeed;
      if (intersectEnemy(p, enemies[2])) {
        p.x -= 60;
      } if (enemies[2].x < 600) {
        enemies[2].y = -1000;
      }
      
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
}