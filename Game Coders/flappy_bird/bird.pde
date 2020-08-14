class Bird{

  PVector pos;
  PVector acc;
  PVector vel;
  
  float r=16;
  
  Bird() {
    pos = new PVector(50,height/2);
    vel = new PVector(0, 0);
    acc = new PVector();
  }
  
  void applyForce(PVector force) {
    acc.add(force);
  }
  
  void update() {
    applyForce(gravity);
    pos.add(vel);
    vel.add(acc);
    vel.limit(4);
  }
  void show()
  {
    fill(255,0,34);
    stroke(0,0,0);
    strokeWeight(2);
    ellipse(pos.x,pos.y,r*2,r*2);
  }
}
