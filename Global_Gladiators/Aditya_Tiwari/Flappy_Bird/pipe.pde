class Pipe
{
  float x;
  float top;
  float bottom;
  float w=40;
  float pipe_speed=3;
  
  Pipe()
  {
     x = wid +w;
     top = random(100, height/2);
     bottom = random(100, height/2);
  // 100 is the minimum height of the pipes while the maximum height is 200
  }
  // Check if there is any collision between the bird and the pipes
  boolean hits(Bird b)
  {
     if((b.pos.x > x)&&(b.pos.x < (x+w))) // if the bird lies within the width of the pipe
     {
       if((b.pos.y < (top + b.r))||(b.pos.y > (height- bottom- b.r))) // If the bird is either below the upper pipe or above the lower pipe
       {
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
    stroke(0, 0, 0);
    strokeWeight(2);
    if(hit){
      fill(217, 74, 30, 127);
    }
    else{
      fill(64, 224, 129, 127);
    }
    rect(x, 0, w, top);
    rect(x, height-bottom, w, bottom);
    
  }
}
  
