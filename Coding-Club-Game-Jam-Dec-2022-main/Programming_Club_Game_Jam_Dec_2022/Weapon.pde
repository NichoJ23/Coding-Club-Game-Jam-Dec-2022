class Weapon {
  
  float ang;
  float initialAng;
  float range;
  float defRange;
  boolean attacking;
  float attackTimer;
  PVector[] swordPoints;
  
  Weapon() {
    defRange = 50;
    range = 0;
    attacking = false;
  }
  
  void show() {

    // Animate //
     if(attacking) {
       attackTimer += 1;

       float x = attackTimer;
       float d = 45;
       float h = PI/8;
       float q = (2*PI*d)/((2*PI)-acos(-PI/(PI+2.0*h)));
       float f = -(PI+2*h)*cos((2*PI/q)*(x+(q/2)-d))+PI;

       ang = initialAng + f;
       
       if(attackTimer >= 2*d-q/2) {
         attacking = false;
         ang = initialAng;
         range = 0;
         // insert reset animation here 
       }
       
     } else {
       ang = new PVector(mouseX-player.pos.x, mouseY-player.pos.y).heading();  // point weapon towards player
       //ang = 0;
       //initialAng = ang;
     }
    
    
    // Display //
    stroke(0);
    strokeWeight(5);
    pushMatrix();
      translate(player.pos.x, player.pos.y);
      rotate(ang);
      line(0,0, defRange + range,0);
    popMatrix();
    
    
    
    
    // Collision points //
    swordPoints = new PVector[] {
      new PVector(player.pos.x+(player.size/2+range+defRange)*cos(ang), player.pos.y+(player.size/2+range+defRange)*sin(ang)),
      new PVector(player.pos.x+(player.size/2+(range+defRange)/2)*cos(ang), player.pos.y+(player.size/2+(range+defRange)/2)*sin(ang)),
      new PVector(player.pos.x+(player.size/2+(range+defRange)/4)*cos(ang), player.pos.y+(player.size/2+(range+defRange)/4)*sin(ang))
    };
    
    
    //circle(swordPoints[0].x, swordPoints[0].y, 10);
    //circle(swordPoints[1].x, swordPoints[1].y, 10);
    
  }
  
  void attack() {
    if(!attacking) {
      attacking = true;
      initialAng = ang;
      attackTimer = 0;
    }
  }
  
}
