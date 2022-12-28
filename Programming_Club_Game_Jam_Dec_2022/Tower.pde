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
    fill(112, 93, 86);
    circle(width / 2, height / 2, 200);
    
    drawButton();
  }
  
  void drawButton(){
    fill(50, 41, 47);
    rect(width / 2 - 75, height / 2 - 30, 150, 60);
    
    fill(240, 247, 244);
    textSize(23);
    text("UPGRADE - " + upgradeCost, width / 2 - 60, height / 2 + 10);
  }
  
  void upgrade(){
    tier += 1;
    coins -= upgradeCost;
    upgradeCost += 5;
    
    // Make some sort of upgrade here
    
  }
  
  void takeDamage(){
    health--;
    
    if (health <= 0) {
      // GAME OVER
    }
  }
}
