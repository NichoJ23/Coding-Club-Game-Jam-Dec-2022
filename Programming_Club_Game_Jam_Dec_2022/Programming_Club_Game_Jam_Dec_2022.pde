
ArrayList<Character> keysDown = new ArrayList<Character>(); // Stores all pressed keys
Player player;
Tower tower;
ArrayList<Enemy> enemies;
Weapon weapon;
int coins;

PFont bestFont;

void setup(){
  size(600, 600);
  
  rectMode(CENTER);
  
  player = new Player(width / 2f, 100, 3f);
  tower = new Tower(width / 2f, height / 2f);
  enemies = new ArrayList<Enemy>();
  weapon = new Weapon();
  coins = 0;
  
  bestFont = createFont("data/font.ttf", 1);
  
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
  if (frameCount % 50 == 0){
    Enemy e = new Enemy(0f, 0f, 0.5f);
    e.col = color(133, 126, 97);
    enemies.add(e);
  }
  if (frameCount % 1000 == 0) {
    Enemy e = new Enemy(0f, 0f, 1);
    e.col = #ff40dc;
    enemies.add(e);
  }
  
  weapon.show();
  player.show();
  player.move();
  tower.show();
  
  for(int i = 0; i < enemies.size(); i++){
    Enemy e = enemies.get(i);
    
    e.move();
    e.show();
    
    for(PVector w : weapon.swordPoints) {
      if(e.pos.dist(w) < e.size/2 && weapon.attacking) {
        e.health = 0; 
      }
    }
    
    if(e.pos.dist(tower.pos) < e.size/2 + tower.size/2){
      tower.takeDamage();
      enemies.remove(i);
      i--;
    }
    
    else if(e.health <= 0) {
      enemies.remove(i);
      i--;
    }   
  }
  
  
  if(mouseClick) {
   weapon.attack(); 
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
