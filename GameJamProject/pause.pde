void pause() {
  background(240, 247, 244);
  
  
  
  
  // Buttons //
  stroke(0);
  strokeWeight(5);
  imageMode(CENTER);
  
  fill(0);
  textSize(70);
  text("GAME PAUSED", width / 2, 120);
  
  int buttonSize = 120;
  
  // Damage
  fill(209, 230, 221);
  if (button("circle", width/2-150, height/2+50, buttonSize, buttonSize, 0, "fill", #A9D0BF, 10)) {
    mode = Mode.GAME;
  }
  PImage img = loadImage("damage.png");
  image(img, width/2-150, height/2+50, buttonSize, buttonSize);
  
  // Health
  fill(209, 230, 221);
  if (button("circle", width/2, height/2+50, buttonSize, buttonSize, 0, "fill", #A9D0BF, 10)) {
    mode = Mode.GAME;
  }
  img = loadImage("heart.png");
  image(img, width/2, height/2+50, buttonSize, buttonSize);
  
  // Speed
  fill(209, 230, 221);
  if (button("circle", width/2+150, height/2+50, buttonSize, buttonSize, 0, "fill", #A9D0BF, 10)) {
    mode = Mode.GAME;
  }
  img = loadImage("speed.png");
  image(img, width/2+150, height/2+50, buttonSize, buttonSize);
  
  
  
  fill(0);
  textSize(20);
  text("+DMG", width/2-150, height/2+50 - buttonSize+40);
  text("+HP", width/2, height/2+50 - buttonSize+40);
  text("+SPD", width/2+150, height/2+50 - buttonSize+40);
  
  text("$???", width/2-150, height/2+50 + buttonSize-30);
  text("$???", width/2, height/2+50 + buttonSize-30);
  text("$???", width/2+150, height/2+50 + buttonSize-30);
  

}
