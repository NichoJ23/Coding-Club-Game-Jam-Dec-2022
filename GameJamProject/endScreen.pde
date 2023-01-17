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
