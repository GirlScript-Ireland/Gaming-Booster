Bird b;
PVector gravity=new PVector(0,0.5);
void setup(){
  size(480,800);
  b=new Bird();
  
}

void draw(){
  if(keyPressed){
    PVector up = new PVector(0,-5);
    b.applyForce(up);
  }
  background(142, 232, 181);
  b.update();
  b.show();
}
