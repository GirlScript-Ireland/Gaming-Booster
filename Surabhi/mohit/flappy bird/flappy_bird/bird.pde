class Bird{

  PVector pos;
  PVector vel;
  PVector acc;
  float r= 13;
  
  Bird(){
    pos = new  PVector(50, height/2);
    vel = new  PVector(50, height/2);
    acc = new  PVector(50, height/2);
  
  
  }
  void applyForce(PVector force){
    acc.add(force);
  
  }
  void update()
  {
    applyForce(gravity);
    pos.add(vel);
    vel.add(acc);
    vel.limit(4);
    acc.mult(0);
    
    if(pos.y > height)
    {
      pos.y = height;
      vel.mult(0);
    
    }

  }
  void show(){
  
    stroke(0,0,0);
    strokeWeight(2);
    fill(224,218,34);
    ellipse(pos.x,pos.y,r*2,r*2);
  
  }
}
