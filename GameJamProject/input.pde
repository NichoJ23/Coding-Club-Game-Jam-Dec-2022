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

boolean mouseClick = false;
boolean wasPressed = false;
void detectClicks() {
  mouseClick = false;
  if(mousePressed) wasPressed = true;
  if(wasPressed && !mousePressed) { mouseClick = true; wasPressed = false;}
}
