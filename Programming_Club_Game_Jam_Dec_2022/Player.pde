class Player {
  
  // Can't remember how to do Vector2's so imma use two ints for pos
  PVector pos;
  float speed;
  
  Player(int x, int y, float speed) {
    pos = new PVector(0, 0);
    pos.x = x;
    pos.y = y;
    this.speed = speed;
  }
  
  void drawPlayer() {
    fill(153, 225, 217);
    circle(pos.x, pos.y, 50); // Pretty basic, could change if have time
  }
  
  void movePlayer(){
    PVector vel = new PVector(0, 0);
    
    if (keysDown.contains('w')) {
      vel.y -= 1;
    }
    if (keysDown.contains('s')) {
      vel.y += 1;
    }
    if (keysDown.contains('a')) {
      vel.x -= 1;
    }
    if (keysDown.contains('d')) {
      vel.x += 1;
    }
    vel.normalize();
    vel.mult(speed);
    
    pos.x += vel.x;
    float towerDST = getDistance(pos.x, pos.y, width / 2f, height / 2f);
    if (towerDST < 125f){
      pos.x -= vel.x;
    }
    
    pos.y += vel.y;
    towerDST = getDistance(pos.x, pos.y, width / 2f, height / 2f);
    if (towerDST < 125f){
      pos.y -= vel.y;
    }
  }
  
  float getDistance(float x1, float y1, float x2, float y2){
    float dx = abs(x1 - x2);
    float dy = abs(y1 - y2);
    
    return sqrt(dx * dx + dy * dy);
  }
}
