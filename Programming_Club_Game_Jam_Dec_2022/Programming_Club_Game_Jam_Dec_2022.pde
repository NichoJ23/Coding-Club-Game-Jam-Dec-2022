
ArrayList<Character> keysDown = new ArrayList<Character>(); // Stores all pressed keys
Player player;
Tower tower;
ArrayList<Enemy> enemies;
int coins;

void setup(){
  size(600, 600);
  
  player = new Player(width / 2, 100, 3f);
  tower = new Tower(5);
  enemies = new ArrayList<Enemy>();
  coins = 0;
  
  testCode();
}

void testCode(){
  
}

void draw(){
  game();
}

void game(){
  background(240, 247, 244);
  
  if (frameCount % (240 - frameCount / 10) == 0){
    Enemy e = new Enemy(0f, 0f, 1f + frameCount / 1800f);
    enemies.add(e);
  }
  
  player.drawPlayer();
  player.movePlayer();
  
  tower.drawTower();
  
  for (int i = 0; i < enemies.size(); i++){
    Enemy e = enemies.get(i);
    
    e.moveEnemy();
    e.drawEnemy();
    
    if (getDistance(e.pos.x, e.pos.y, width / 2f, height / 2f) < 125f){
      tower.takeDamage();
      enemies.remove(i);
    }
  }
  
  fill(50, 41, 47);
  textSize(30);
  text("COINS: " + coins, width - 130, 30);
}

void keyPressed(){
  if (!keysDown.contains(key)) {
    keysDown.add(key); // Document all keys currently pressed
  }
}

void keyReleased(){
  if (keysDown.contains(key)){
    keysDown.remove(keysDown.indexOf(key));
  }
}

void mouseClicked(){
  // Check if the mouse is on the UPGRADE button
  if (mouseX > width / 2 - 75 && mouseX < width / 2 + 75 && mouseY > height / 2 - 30 && mouseY < height / 2 + 30){
    if (coins > tower.upgradeCost){
      tower.upgrade();
      
      // For now i'll increase move speed as the upgrade
      
      player.speed += 0.5f;
    }
  }
}

float getDistance(float x1, float y1, float x2, float y2){
    float dx = abs(x1 - x2);
    float dy = abs(y1 - y2);
    
    return sqrt(dx * dx + dy * dy);
  }
