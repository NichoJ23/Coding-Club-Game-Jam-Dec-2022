void pause() {
  background(240, 247, 244);

  // Buttons //
  stroke(0);
  strokeWeight(5);
  imageMode(CENTER);
  
  fill(0);
  textSize(70);
  text("GAME PAUSED", width / 2, 120);
  
  fill(50, 41, 47);
  textSize(25);
  text("Coins: "+coins, width/2, 200);
  
  int buttonSize = 120;
  
  // Range/Attack Speed
  fill(209, 230, 221);
  if (button("circle", width/2-150, height/2+50, buttonSize, buttonSize, 0, "fill", #A9D0BF, 10) && coins >= weaponCost) {
    coins -= weaponCost;
    weaponCost += UPGRADEINC;
    defRange += WEAPON_RANGEINC;
    attackSpeed += WEAPON_SPEEDINC;
  }
  PImage img = loadImage("damage.png");
  image(img, width/2-150, height/2+50, buttonSize, buttonSize);
  
  // Health
  fill(209, 230, 221);
  if (button("circle", width/2, height/2+50, buttonSize, buttonSize, 0, "fill", #A9D0BF, 10) && coins >= healthCost) {
    coins -= healthCost;
    healthCost += UPGRADEINC;
    tower.health += HEALTH_REGEN;
  }
  img = loadImage("heart.png");
  image(img, width/2, height/2+50, buttonSize, buttonSize);
  
  // Speed
  fill(209, 230, 221);
  if (button("circle", width/2+150, height/2+50, buttonSize, buttonSize, 0, "fill", #A9D0BF, 10) && coins >= speedCost) {
    coins -= speedCost;
    speedCost += UPGRADEINC;
    player.speed += SPEED_INC;
  }
  img = loadImage("speed.png");
  image(img, width/2+150, height/2+50, buttonSize, buttonSize);
  
  
  
  fill(0);
  textSize(20);
  text("+WEAPON", width/2-150, height/2+50 - buttonSize+40);
  text("+HP", width/2, height/2+50 - buttonSize+40);
  text("+SPD", width/2+150, height/2+50 - buttonSize+40);
  
  text("$"+weaponCost, width/2-150, height/2+50 + buttonSize-30);
  text("$"+healthCost, width/2, height/2+50 + buttonSize-30);
  text("$"+speedCost, width/2+150, height/2+50 + buttonSize-30);
  
  text("range: "+defRange+"\nspeed: "+(round(attackSpeed*10)/10)+"x", width/2-150, height/2+50 + buttonSize+10);
  text(tower.health+"/"+tower.maxHealth, width/2, height/2+50 + buttonSize+10);
  text((int)player.speed, width/2+150, height/2+50 + buttonSize+10);
  
  
  fill(50, 41, 47);
  textSize(15);
  text("press ESC to resume", width/2, height-30);
  
  
  // Resume
  if(esc) {
    esc = false;
    mode = Mode.GAME;
  }
}
