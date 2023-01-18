class Tower extends GameObject {
  final int maxHealth = 50; 
  
  int tier;
  int upgradeCost;
  int health;
  
  Tower(float x, float y) {
    super(x, y, 170);
    tier = 1;
    upgradeCost = 5;
    health = maxHealth;
  }
  
  void show(){
    fill(183, 48, 199);
    stroke(0);
    strokeWeight(5);
    circle(pos.x, pos.y, size);
    
    
    // show health
    rectMode(CORNER);
    stroke(0);
    strokeWeight(5);
    fill(0);
    rect(100, 39, 400, 20, 10);
    fill(#ff0000);
    rect(100, 39, map(health, 0, maxHealth, 0, 400), 20, 10);
    rectMode(CENTER);
    
    //println(health);
  }
  
  
  void upgrade(){
    if(coins < upgradeCost) return;
    tier += 1;
    coins -= upgradeCost;
    upgradeCost += 5;
    player.speed += 0.5;
    
    // Make some sort of upgrade here
    
  }
  
  void takeDamage(int damage){
    health -= damage;
    if (health <= 0) {
      mode = Mode.GAMEOVER;
    }
  }
}
