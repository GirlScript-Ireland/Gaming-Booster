Bird b;
void setup(){
  size(400,800);
  b=new Bird();
}

void draw(){
  background(142, 232, 181);
  b.update();
  b.show();
}