
ArrayList<Character> keysDown = new ArrayList<Character>(); // Stores all pressed keys
Player player;
Tower tower;
int coins;

void setup(){
  size(600, 600);
  
  player = new Player(width / 2, 100, 3f);
  tower = new Tower(5);
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
  
  player.drawPlayer();
  player.movePlayer();
  
  tower.drawTower();
  
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
