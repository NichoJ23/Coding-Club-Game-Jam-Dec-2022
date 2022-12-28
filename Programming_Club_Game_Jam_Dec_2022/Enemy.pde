class Enemy {
  PVector pos;
  PVector vel;
  float speed;
  
  Enemy(float x, float y, float speed){
    pos = new PVector(x, y);
    this.speed = speed;
    
    positionRandom();
    
    vel = new PVector(width / 2f - pos.x, height / 2f - pos.y);
    vel.normalize();
    vel.mult(speed);
  }
  
  void positionRandom(){
    // Start the enemy at a random point on the edge of the screen
    
    int side = int(random(2)); // Whether it starts on the top/bottom or left/right
    
    if (side == 0){
      pos.x = random(width);
      pos.y = int(random(2)) * (height + 100) - 50; // +100 - 50 to start off screen
    } else {
      pos.x = int(random(2)) * (width + 100) - 50;
      pos.y = random(height);
    }
  }
  
  void moveEnemy(){
    pos.add(vel);
  }
  
  void drawEnemy(){
    fill(133, 126, 97);
    circle(pos.x, pos.y, 50);
  }
}
