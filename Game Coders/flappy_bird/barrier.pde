class Barrier {
  float top;
  float bottom;
  float w = 40;
  float x;
  
  Barrier() {
    top = random(100, height/2);
    bottom = random(100, height/2);
  }
  
  void show() {
    fill(255,0,34);
    rect(x, 0, w, top);
    rect(x, height - bottom, w, bottom);
  }
}
