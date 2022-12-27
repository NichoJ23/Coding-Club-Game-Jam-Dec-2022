class Player {
  
  // Can't remember how to do Vector2's so imma use two ints for pos
  int posX;
  int posY;
  
  Player(int x, int y) {
    posX = x;
    posY = y;
  }
  
  void drawPlayer() {
    fill(153, 225, 217);
    circle(posX, posY, 50); // Pretty basic, could change if have time
  }
  
  void movePlayer(){
    int velX = 0;
    int velY = 0;
    
    if (keysDown.contains('w')) {
      velY -= 5;
    }
    if (keysDown.contains('s')) {
      velY += 5;
    }
    if (keysDown.contains('a')) {
      velX -= 5;
    }
    if (keysDown.contains('d')) {
      velX += 5;
    }
    
    posX += velX;
    float towerDST = getDistance(posX, posY, width / 2, height / 2);
    if (towerDST < 125f){
      posX -= velX;
      println(towerDST);
    }
    
    posY += velY;
    towerDST = getDistance(posX, posY, width / 2, height / 2);
    if (towerDST < 125f){
      posY -= velY;
    }
  }
  
  float getDistance(int x1, int y1, int x2, int y2){
    int dx = abs(x1 - x2);
    int dy = abs(y1 - y2);
    
    return sqrt(dx * dx + dy * dy);
  }
}
