Bird b;

PVector gravity = new PVector(0, 0.5);

void setup(){
  size(400,800);
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
