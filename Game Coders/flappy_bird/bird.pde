class Bird{
  PVector pos;
  float r=16;
  PVector acc;
  PVector vel;
  
  Bird() {
    pos=new PVector(50,height/2);
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
  
  void show() {
    ellipse(pos.x,pos.y,r*2,r*2);
    fill(255,0,34);
    stroke(0,0,0);
    strokeWeight(2);  
  }
}
