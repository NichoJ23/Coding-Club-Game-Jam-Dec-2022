void game(){
  counter++;
  
  background(240, 247, 244);
  
  normSpawnOffset = pow(counter / 150, 1.1);
  normSpawnOffset = min(40, normSpawnOffset);
  
  enemySpeedOffset = pow(counter / 1000, 1.2);
  
  if (counter % (50 - normSpawnOffset) < 1) {
    Enemy e = new Enemy(0f, 0f, 0.5f + enemySpeedOffset / 10, 1);
    e.col = color(133, 126, 97);
    enemies.add(e);
  }
  if (counter % (1000 - normSpawnOffset * 20) < 1) {
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
        coins += 2;
        score += 2;
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
  
  // show kill counter
  
  if(mouseClick) {
   weapon.attack(); 
  }
  
  fill(0);
  textSize(25);
  textAlign(RIGHT);
  text("Coins: " + coins, width - 110, 30);
  textAlign(CENTER);
  textSize(15);
  text("press ESC for upgrades", width/2, height-30);
  
  textAlign(CENTER, CENTER);
  textSize(20);
  text("Score:", width/2, height/2-40);
  textSize(64);
  text(score+"", width/2, height/2);
  
  // PAUSE
  if(esc) {
    esc = false;
    mode = Mode.PAUSE;
  }
  
}
