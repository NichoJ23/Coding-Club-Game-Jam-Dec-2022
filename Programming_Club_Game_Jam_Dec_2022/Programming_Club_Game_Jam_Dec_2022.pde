
ArrayList<Character> keysDown = new ArrayList<Character>(); // Stores all pressed keys
Player player;
Tower tower;
ArrayList<Enemy> enemies;
int coins;

void setup(){
  size(600, 600);
  
  player = new Player(width / 2f, 100, 3f);
  tower = new Tower(width / 2f, height / 2f);
  enemies = new ArrayList<Enemy>();
  coins = 0;
  
  testCode();
}

void testCode(){
  
}

void draw(){
  game();
  detectClicks();
}

void game(){
  background(240, 247, 244);
  if (frameCount % 20 == 0){
    Enemy e = new Enemy(0f, 0f, 2);
    enemies.add(e);
  }
  
  player.show();
  player.move();
  
  tower.show();
  
  for (int i = 0; i < enemies.size(); i++){
    Enemy e = enemies.get(i);
    
    e.move();
    e.show();
    
    if (e.pos.dist(tower.pos) < 125f){
      tower.takeDamage();
      enemies.remove(i);
      i--;
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
  
}
