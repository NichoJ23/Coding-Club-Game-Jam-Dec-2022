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
int weaponCost, healthCost, speedCost;

PFont bestFont;

enum Mode {
  INTRO,
  GAME,
  PAUSE,
  GAMEOVER
}

Mode mode;

final int UPGRADEINC = 15;  // Price increment after each subsequence upgrade

// UPGRADE PARAMETERS //
final int WEAPON_STARTING_COST = 66;
final int WEAPON_RANGEINC = 10;  // Amount to increrase range by
final float WEAPON_SPEEDINC = 0.11;  // Amount to increase speed by

final int HEALTH_STARTING_COST = 75;
final int HEALTH_REGEN = 10;  // Amount of HP to heal by

final int SPEED_STARTING_COST = 30;
final float SPEED_INC = 0.3;  // Amount to increase speed by


// DEFAULT PARAMETERS //
float defRange = 70;  // Weapon range
float attackSpeed = 1; // Weapon attack speed

float normSpawnOffset = 0;
float enemySpeedOffset = 0;

void setup(){
  size(600, 600);
  
  rectMode(CENTER);

  reset();
  
  bestFont = createFont("data/font.ttf", 1);
  
  minim = new Minim(this);
  
  audioPlayer = minim.loadFile(dataPath("gameplay.mp3"));
  audioPlayer.setGain(-20);
  audioPlayer.loop();

  hitPlayer = minim.loadFile(dataPath("hitsound.mp3"));
}

void reset() {
  player = new Player(width / 2f, 100, 3f);
  tower = new Tower(width / 2f, height / 2f);
  weapon = new Weapon();
  enemies = new ArrayList<Enemy>();
  coins = 0;
  score = 0;
  mode = Mode.GAME;
  counter = 0;
  
  weaponCost = WEAPON_STARTING_COST;
  healthCost = HEALTH_STARTING_COST;
  speedCost = SPEED_STARTING_COST;
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
