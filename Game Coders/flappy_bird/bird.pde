class Bird{
  PVector pos;
  float r=16;
  Bird(){
    pos=new PVector(50,height/2);
  }
  void show(){
    ellipse(pos.x,pos.y,r*2,r*2);
    fill(255,0,34);
    stroke(0,0,0);
    strokeWeight(2);  
  }
}
