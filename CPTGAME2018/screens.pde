String screen;
PImage arceusCard;

void setup() {
  size(1366, 768);
  screen = "card4";
  arceusCard = loadImage("arceuscard.jpeg.jpg");
}

void draw() {
  if (screen == "card3") {
    card3();
  } else if (screen == "card4") {
    card4();
  }
}

void card3() {
  background(150, 100, 100);
  
  textSize(60);
  fill(127, 0, 0);
  text("CARD EARNED!", 200, 150);
  text("Oh, it's just an arceus.", 75, 275);
  text("What a useless card.", 75, 375);
  text("No one would even pay", 75, 475);
  text("a dollar for it...", 75, 575);
  textSize(40);
  fill(0, 0, 255);
  text("Press SPACE to continue", 175, 675);
  image(arceusCard, 850, 50, 475, 663);
}

void card4() {
  background(10, 160, 100);
  
  textSize(60);
  fill(127, 0, 0);
  text("CARD EARNED!", 200, 150);
  text("Oh, it's just an arceus.", 75, 275);
  text("What a useless card.", 75, 375);
  text("No one would even pay", 75, 475);
  text("a dollar for it...", 75, 575);
  textSize(40);
  fill(0, 0, 255);
  text("Press SPACE to continue", 175, 675);
  image(arceusCard, 850, 50, 475, 663);
}
