
ArrayList<Character> keysDown = new ArrayList<Character>(); // Stores all pressed keys
Player player;
Tower tower;
ArrayList<Enemy> enemies;
Weapon weapon;
int coins;

PFont bestFont;

enum Mode {
  INTRO,
  GAME,
  GAMEOVER
}

Mode mode;

void setup(){
  size(600, 600);
  
  rectMode(CENTER);
  
  player = new Player(width / 2f, 100, 3f);
  tower = new Tower(width / 2f, height / 2f);
  enemies = new ArrayList<Enemy>();
  weapon = new Weapon();
  coins = 0;
  mode = Mode.INTRO;
  
  bestFont = createFont("data/font.ttf", 1);
  
  testCode();
}

void reset() {
  player.pos.x = width / 2f;
  player.pos.y = 100;
  tower.health = tower.maxHealth;
  tower.tier = 1;
  tower.upgradeCost = 5;
  enemies = new ArrayList<Enemy>();
  coins = 0;
  mode = Mode.GAME;
}

void testCode(){
  
}

void draw(){
  if (mode == Mode.INTRO) {
    introScreen();
  } else if (mode == Mode.GAME) {
    game();
  } else {
    endScreen();
  }
  detectClicks();
  
  if (keysDown.contains('l')) {
    mode = Mode.GAMEOVER;
  }
}

void introScreen() {
  background(240, 247, 244);
  
  fill(209, 230, 221);
  stroke(0);
  strokeWeight(5);
  if (button("circle", width / 2, height / 2 + 50, 200, 200, 0, "fill", #A9D0BF, 10)) {
    mode = Mode.GAME;
  }
  
  fill(0);
  textAlign(CENTER);
  textFont(bestFont, 50);
  text("START", width / 2 + 2, height / 2 + 68);
  
  textSize(70);
  text("SPHERICAL", width / 2, 120);
  text("SIEGE", width / 2, 200);
  
  textSize(20);
  text("Brought to you by Brendan Chen,", width / 2, height - 65);
  text("Lyndon Ho & Nicholas Nesbitt", width / 2, height - 40);
  
}

void game(){
  background(240, 247, 244);
  if (frameCount % 50 == 0){
    Enemy e = new Enemy(0f, 0f, 0.5f, 1);
    e.col = color(133, 126, 97);
    enemies.add(e);
  }
  if (frameCount % 1000 == 0) {
    Enemy e = new Enemy(0f, 0f, 1, 2);
    e.col = #ff40dc;
    enemies.add(e);
  }
  
  for(int i = 0; i < enemies.size(); i++){
    Enemy e = enemies.get(i);
    
    e.move();
    e.show();
    
    for(PVector w : weapon.swordPoints) {
      if(e.pos.dist(w) < e.size/2 && weapon.attacking) {
        e.health = 0;
        coins++;
      }
    }
    
    if(e.pos.dist(tower.pos) < e.size/2 + tower.size/2){
      tower.takeDamage(e.damage);
      enemies.remove(i);
      i--;
    }
    
    else if(e.health <= 0) {
      enemies.remove(i);
      i--;
    }   
  }
  
  weapon.show();
  player.show();
  player.move();
  tower.show();
  
  if(mouseClick) {
   weapon.attack(); 
  }
  
  fill(50, 41, 47);
  textSize(30);
  text("COINS: " + coins, width - 130, 30);
}

void endScreen() {
  background(240, 247, 244);
  
  fill(209, 230, 221);
  if (button("circle", width / 2, 400, 225, 225, 0, "fill", #A9D0BF, 10)) {
    reset();
  }
  
  fill(0);
  textAlign(CENTER);
  textFont(bestFont, 65);
  text("GAME OVER", width / 2, 200);
  
  textSize(35);
  text("Your Score: " + (coins + tower.tier * 5 - 5), width / 2, 240);
  
  textSize(50);
  text("Play", width / 2, 380);
  text("Again?", width / 2 + 7, 440);
  
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
