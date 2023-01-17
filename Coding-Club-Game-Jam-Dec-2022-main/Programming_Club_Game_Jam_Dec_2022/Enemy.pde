class Enemy extends GameObject {
  PVector vel;
  float speed;
  color col;
  int damage;
  
  Enemy(float x, float y, float speed, int damage) {
    super(x, y, 25);
    this.speed = speed;
    this.damage = damage;
    
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
      pos.y = int(random(2)) * (height + 50) - 25; // +50 - 25 to start off screen
    } else {
      pos.x = int(random(2)) * (width + 50) - 25;
      pos.y = random(height);
    }
  }
  
  void move(){
    pos.add(vel);
  }
  
  void show() {
    super.show(col);
  }
}
