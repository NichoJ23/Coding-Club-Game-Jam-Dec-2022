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
