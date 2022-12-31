class Tower {
  int health;
  int tier;
  int upgradeCost;
  
  Tower(int health){
    this.health = health;
    tier = 1;
    upgradeCost = 5;
  }
  
  void drawTower(){
    fill(183, 48, 199);
    circle(width / 2, height / 2, 200);
    
    if(button("circle", width/2, height/2, 150, 150, 0, "fill", #882393, 10)) {
      upgrade(); 
    }
    fill(240, 247, 244);
    textSize(23);
    textAlign(CENTER);
    text("UPGRADE\n$" + upgradeCost, width / 2, height / 2);
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
