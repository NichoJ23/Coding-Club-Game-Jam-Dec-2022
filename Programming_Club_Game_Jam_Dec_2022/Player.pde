class Player extends GameObject {
  
  // Can't remember how to do Vector2's so imma use two ints for pos
  float speed;

  Player(float x, float y, float speed) {
    super(x, y, 50);
    this.speed = speed;
  }
  
  void show() {
    super.show(color(153, 225, 217));  // Pretty basic, could change if have time
  }
  
  void move(){
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
    
    pos.add(vel);
    
    float towerDST = pos.dist(tower.pos);
    if (towerDST * 2 < size + tower.size) {
      // ask lyndon
      PVector ang = pos.copy().sub(tower.pos);
      PVector opp = ang.setMag((tower.size + size) / 2f - towerDST);
      pos.add(opp);
    }
    
    if(pos.x > width-size/2f) pos.x = width-size/2f;  // Prevent player from going outside of boundary
    if(pos.x < size/2f) pos.x = size/2f;
    if(pos.y > height-size/2f) pos.y = height-size/2f;
    if(pos.y < size/2f) pos.y = size/2f;
  }
}
