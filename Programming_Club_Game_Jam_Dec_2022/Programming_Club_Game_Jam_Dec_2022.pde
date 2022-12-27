
ArrayList<Character> keysDown = new ArrayList<Character>(); // Stores all pressed keys
Player player;
Tower tower;

void setup(){
  size(600, 600);
  
  player = new Player(width / 2, 100);
  tower = new Tower(5);
  
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
