class Pipe {
  float top; //top pipe
  float bottom; //bottom pipe
  int pipeW = 40;
  int x;
  
  Pipe(){
    x = wid + pipeW;
    top = random(100, height/2);
    bottom = random(100, height/2);
  }
  
  void update() {
    x -= 3; 
  }
  
  boolean hits(Bird b){
    if((b.pos.x+16 > x) && (b.pos.x+16 < (x + pipeW))){
      if((b.pos.y < (top + b.r)) || (b.pos.y > (height - bottom - b.r))){
        return true;
      }
    }
    return false;
  }
  
  void show(){
    rect(x, 0, pipeW, top); //top pipe
    rect(x, 800 - bottom, pipeW, bottom);
  }
  
}
