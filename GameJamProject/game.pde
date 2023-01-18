void game(){
  counter++;
  
  background(240, 247, 244);
  if (counter % 50 == 0){
    Enemy e = new Enemy(0f, 0f, 0.5f, 1);
    e.col = color(133, 126, 97);
    enemies.add(e);
  }
  if (counter % 1000 == 0) {
    Enemy e = new Enemy(0f, 0f, 1.5, 5);
    e.col = #ff40dc;
    enemies.add(e);
  }
  
  for(int i = 0; i < enemies.size(); i++){
    Enemy e = enemies.get(i);
    
    e.move();
    e.show();
    
    for(PVector w : weapon.swordPoints) {  // Detect collision with weapon
      if(e.pos.dist(w) < e.size/2 && weapon.attacking) {
        e.health = 0;
        coins++;
        score++;
      }
    }
    
    if(e.pos.dist(tower.pos) < e.size/2 + tower.size/2){
      tower.takeDamage(e.damage);
      enemies.remove(i);
      hitPlayer.play();
      hitPlayer.rewind();
      i--;
    }
    
    else if(e.health <= 0) {
      enemies.remove(i);
      hitPlayer.play();
      hitPlayer.rewind();
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
  textSize(25);
  textAlign(RIGHT);
  text("COINS: " + coins, width - 110, 30);
  textAlign(CENTER);
  textSize(15);
  text("press ESC for upgrades", width/2, height-30);
  
  // PAUSE
  if(esc) {
    esc = false;
    mode = Mode.PAUSE;
  }
  
}
