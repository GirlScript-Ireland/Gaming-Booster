PVector velocity;
class Bird {
  PVector acc; //acceleration pvector
  PVector pos;
  int r = 16;
  
    Bird() {
        pos = new PVector(50, height/2);
        velocity = new PVector(0, 0);
        acc = new PVector();
    }
    void show() {
        fill(255, 255, 0);
        ellipse(pos.x, pos.y, r*2, r*2);
    }
    
    void applyforce(PVector force){
        acc.add(force);
    }
    
    void update() {
        applyforce(gravity);
        pos.add(velocity);
        velocity.add(acc);
        velocity.limit(4);
        acc.mult(0);
        
        if(pos.y > height-16) {
          pos.y = height-16;
          velocity.mult(0);
        }
    }
}
