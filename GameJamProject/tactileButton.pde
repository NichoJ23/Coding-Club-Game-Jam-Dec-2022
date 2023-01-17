/*
x, y: Coordinates of rectangle center
w, h: Width and height
r: Corner radius
mode: Mouse hover tactility mode
c: Highlight color
d: Pop out distance
*/


boolean button(String shape, float x,float y, float w,float h, float r, String mode, color c, float d) {
  drawButton(shape, x,y, w,h, r);
  switch(shape) {  // Detects mouse hover differently for different shapes
    case "rect":
      if(mouseX >= x-w/2 && mouseX <= x+w/2 && mouseY >= y-h/2 && mouseY <= y+h/2) {  // Mouse within button boundaries (RECTANGLE)
        highlight(shape, x,y, w,h, r, mode, c, d);
        return mouseClick;
      } break;
      
    case "circle":
      if(dist(mouseX,mouseY, x,y) <= w/2) {  // Mouse within button boundaries
        highlight(shape, x,y, w,h, r, mode, c, d);
        return mouseClick;
      } break; 
  }
  return false;
}

void highlight(String shape, float x,float y, float w,float h, float r, String mode, color c, float d) {
  switch(mode) {  // Hover mode
      case "fill":  // Highlights fill
      case "Fill":
        hFill(shape, x,y, w,h, r, c);  
        break;
      case "pop":  // Pops out button
      case "Pop": 
        hPop(shape, x,y, w,h, r, d);
        break;
      case "stroke":  // Highlights stroke
      case "Stroke":
        hStroke(shape, x,y, w,h, r, c);
        break;
      case "FP":  // Fill + Pop 
      case "fp":
        hFill(shape, x,y, w,h, r, c);
        hPop(shape, x,y, w,h, r, d);
        break;
      case "SP":  // Stroke + Pop
      case "sp":
        hStroke(shape, x,y, w,h, r, c);
        hPop(shape, x,y, w,h, r, d);
        break;
    }
}

void hFill(String shape, float x,float y, float w,float h, float r, color c) {  // Hightlight with fill color
  fill(c);
  drawButton(shape, x,y, w,h, r);
}

void hPop(String shape, float x,float y, float w,float h, float r, float d) {  // Highlight with "pop-out" effect
  w += d/2;
  h += d/2;
  drawButton(shape, x,y, w,h, r);
}

void hStroke(String shape, float x,float y, float w,float h, float r, color c) {  // Highlight with stroke color
  stroke(c);
  drawButton(shape, x,y, w,h, r);
}

void drawButton(String shape, float x,float y, float w,float h, float r) {  // Draw button, rect or circle
  switch(shape) {
    case "rect":   rect(x,y, w,h, r); break;  // Rectangle
    case "circle": circle(x,y, w);    break;  // Circle
  } 
}

boolean mouseClick = false;
boolean wasPressed = false;
void detectClicks() {
  mouseClick = false;
  if(mousePressed) wasPressed = true;
  if(wasPressed && !mousePressed) { mouseClick = true; wasPressed = false;}
}
