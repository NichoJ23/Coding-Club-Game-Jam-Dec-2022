class Tower extends GameObject {
  int tier;
  int upgradeCost;
  
  Tower(float x, float y) {
    super(x, y, 200);
    tier = 1;
    upgradeCost = 5;
  }
  
  void show(){
    fill(183, 48, 199);
    stroke(0);
    strokeWeight(5);
    circle(pos.x, pos.y, size);
    
    if(button("circle", pos.x, pos.y, 150, 150, 0, "fill", #882393, 10)) {
      upgrade(); 
    }
    fill(240, 247, 244);
    textSize(23);
    textAlign(CENTER);
    text("UPGRADE\n$" + upgradeCost, pos.x, pos.y);
  }
  
  
  void upgrade(){
    if(coins < upgradeCost) return;
    tier += 1;
    coins -= upgradeCost;
    upgradeCost += 5;
    player.speed += 0.5;
    
    // Make some sort of upgrade here
    
  }
  
  void takeDamage(){
    health--;
    
    if (health <= 0) {
      // GAME OVER
    }
  }
}
