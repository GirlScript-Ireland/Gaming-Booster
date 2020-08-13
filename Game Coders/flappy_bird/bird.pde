class Bird{
  PVector pos;
  PVector acc;
  PVector vel;
  
  float r=16;
  Bird(){
    pos=new PVector(50,height/2);
    vel = new PVector(0,0);
    acc = new PVector();
  }
  
  void update()
  {
    pos.add(vel);
    vel.add(acc);
    vel.limit(4);
  }
  void show(){
    ellipse(pos.x,pos.y,r*2,r*2);
    fill(255,0,34);
    stroke(0,0,0);
    strokeWeight(2);  
  }
}
