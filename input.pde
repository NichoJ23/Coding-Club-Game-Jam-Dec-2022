boolean esc;


void keyPressed(){
  if (!keysDown.contains(key)) {
    keysDown.add(key); // Document all keys currently pressed
  }
  
  if(key == ESC) {
    key = 0;
  }

}

void keyReleased(){
  if (keysDown.contains(key)) {
    keysDown.remove(keysDown.indexOf(key));
  }
  
  if(key == ESC) {
    esc = true; 
  }
}

boolean mouseClick = false;
boolean wasPressed = false;
void detectClicks() {
  mouseClick = false;
  if(mousePressed) wasPressed = true;
  if(wasPressed && !mousePressed) { mouseClick = true; wasPressed = false;}
}
