class Pokemon {
  float x, y, w, h;
  
  Pokemon(float startX, float startY, float startW, float startH) {
    x = startX;
    y = startY;
    w = startW;
    h = startH;
  }
  
  void display() {        //display pokemon card
    rect(x, y, w, h);
    image(pokemoncard, x-10, y, w+20, h);
  }
  
}
