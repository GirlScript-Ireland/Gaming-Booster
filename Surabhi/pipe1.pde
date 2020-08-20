class Pipe{

  float x;
  float top;
  float bottom;
  float w = 40;
  float pipe_speed = 3;
  
  Pipe(){
    x= wid + w;
    top = random(100, height/2);
    bottom = random(100 , height/2);
    
  }
  boolean hits(Bird b)
  {
    if((b.pos.x > x) && (b.pos.x < (x + w))){
      if((b.pos.y < (top + b.r)) || (b.pos.y > (height - bottom - b.r))){
        return true;
      }
    }
    return false;
  }
  void update()

  {
    x -= pipe_speed; 
  
  }
  void show(boolean hit)
  {
    stroke(0,0,0);
    strokeWeight(2);
    
    if(hit)
    {
      fill(250, 74, 30 ,127);
    }
    else 
    {
    
      fill(125, 128, 128, 180);
    }
    
   // fill(65,224,129,127);
    rect(x, 0 ,w ,top);
    rect(x, height - bottom ,w ,bottom);
    
  }
}
