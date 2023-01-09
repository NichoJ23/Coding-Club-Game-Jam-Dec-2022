class Weapon {
  
  float ang;
  float initialAng;
  float range;
  float defRange;
  boolean attacking;
  float attackTimer;
  float attackAng;
  float angSpeed;
  
  Weapon() {
    
    defRange = 50;
    range = 0;
    attacking = false;
  }
  
  void show() {
    
     
    

    
    
    // Animate 
     if(attacking) {
       attackTimer += 0.03;
       
       angSpeed = 0.5*( sin(attackTimer-PI/2) + 1 );
       
       attackAng += angSpeed;
       ang = attackAng;

        
        
       if(attackTimer <= 2*PI) println(round(attackTimer) +" -- " + attackAng);
       
       if(ang >= initialAng + 2*PI) {
         attacking = false;
         ang = initialAng;
         range = 0;
         // insert reset animation here 
       }
       
     } else {
       ang = 0;
       
       //ang += 0.05;
       //if(ang >= 2*PI) ang = 0;
     }
    
    
    stroke(0);
    strokeWeight(10);
    //line(player.pos.x, player.pos.y, ang.x, ang.y);
    pushMatrix();
      translate(player.pos.x, player.pos.y);
      rotate(ang);
      line(-defRange - range,0, defRange + range,0);
    popMatrix();
  }
  
  void attack() {
    if(!attacking) {
      attacking = true;
      initialAng = ang;
      attackTimer = 0;
      attackAng = 0;
      angSpeed = 0;
    }
  }
  
}
