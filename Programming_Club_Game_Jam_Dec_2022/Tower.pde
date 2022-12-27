class Tower {
  int health;
  int tier;
  
  Tower(int health){
    this.health = health;
    tier = 1;
  }
  
  void drawTower(){
    fill(112, 93, 86);
    circle(width / 2, height / 2, 200);
  }
}
