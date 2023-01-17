
ArrayList<Character> keysDown = new ArrayList<Character>(); // Stores all pressed keys
Player player;
Tower tower;
ArrayList<Enemy> enemies;
Weapon weapon;
int coins;
int counter = 0;

PFont bestFont;

enum Mode {
  INTRO,
  GAME,
  PAUSE,
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
  counter = 0;
}

void testCode(){
  
}

void draw(){
  // Mode Framework
  switch(mode) {
    case INTRO:
      introScreen(); 
      break;
    case GAME:
      game();
      break;
    case PAUSE:
      pause();
      break;
    case GAMEOVER:
      endScreen();
      break;
  }
  

  detectClicks();
  
  if (keysDown.contains('l')) {
    mode = Mode.GAMEOVER;
  }
}
