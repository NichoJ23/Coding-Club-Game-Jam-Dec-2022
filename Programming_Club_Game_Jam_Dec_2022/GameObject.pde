class GameObject {
  PVector pos;
  int size, health;
  
  public GameObject(float x, float y, int size) {
    this.pos = new PVector(x, y);
    this.health = 1;
    this.size = size;
  }
  
  void show(color col) {
    fill(col);
    stroke(0);
    strokeWeight(5);
    circle(pos.x, pos.y, size);
  }
  
}
