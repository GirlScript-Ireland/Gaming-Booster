class Barrier {
  float top;
  float bottom;
  float w = 40;
  float x;
  float barrier_speed = 3;
  
  Barrier()
  {
    top = random(100, height/2);
    bottom = random(100, height/2);
    
    x = wid + w;
  }
  void update ()
  {
    x -= barrier_speed;
  }
  
  void show() {
    stroke(0,0,0);
    strokeWeight(2);
    rect(x, 0, w, top);
    rect(x, height - bottom, w, bottom);
  }
}
