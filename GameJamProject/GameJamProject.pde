import ddf.minim.*;

Minim minim;
AudioPlayer audioPlayer, hitPlayer;

ArrayList<Character> keysDown = new ArrayList<Character>(); // Stores all pressed keys
Player player;
Tower tower;
ArrayList<Enemy> enemies;
Weapon weapon;
int coins;
int score;
int counter = 0;

PFont bestFont;

enum Mode {
  INTRO,
  GAME,
  PAUSE,
  GAMEOVER
}

Mode mode;


// UPGRADE PARAMETERS //
final int WEAPON_COST = 125;
final int WEAPON_RANGEINC = 20;  // Amount to increrase range by
final float WEAPON_SPEEDINC = 0.2;  // Amount to increase speed by

final int HEALTH_COST = 75;
final int HEALTH_REGEN = 10;  // Amount of HP to heal by

final int SPEED_COST = 15;
final int SPEED_INC = 1;  // Amount to increase speed by


// DEFAULT PARAMETERS //
float defRange = 70;  // Weapon range
float attackSpeed = 1; // Weapon attack speed


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
  
  minim = new Minim(this);
  
  audioPlayer = minim.loadFile(dataPath("gameplay.mp3"));
  audioPlayer.setGain(-20);
  audioPlayer.loop();

  hitPlayer = minim.loadFile(dataPath("hitsound.mp3"));
}

void reset() {
  player.pos.x = width / 2f;
  player.pos.y = 100;
  tower.health = tower.maxHealth;
  tower.tier = 1;
  tower.upgradeCost = 5;
  enemies = new ArrayList<Enemy>();
  coins = 0;
  score = 0;
  mode = Mode.GAME;
  counter = 0;
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
