class Pipe{
  float x;
  float top; 
  float bottom;
  float w = 20;
  float pipe_speed = 10;

  Pipe() 
  {
    x = width + w;
    top = random(100, height/2); // height of the top pipe
    bottom = random(100, height/2); // height of the bottom pipe
    // 100 is the minimum height of the pipes while the maximum height is 200
  }
  boolean hits(Bird b) 
  {
    if ((b.pos.x > x) && (b.pos.x < (x + w))) // if the bird lies within the width of the pipe
    {
      if ((b.pos.y < top) || (b.pos.y > (height - bottom ))) 
      // If the bird is either below the upper pipe or above the lower pipe
      {
        return true; // There is a collision
      }
    }
    return false; // There is no collision
  }
  void update(){
    x-= 2 ;
  }
  void show(boolean hit)
  {
    stroke(0,0,0); // Color of the outline of our pipes (Black)
    strokeWeight(2); // thickness of the outline 
    if (hit) // If the Pipe hits the bird
    {      
      fill(217, 74, 30,127); // Change color to reddish
    } 
    else // If the pipe does not hit the bird
    {
      fill(65,224,129,127); // Change the color to greenish
    }
    // create the pipes
    rect(x, 0, w, top);  // Upper Rectangular Pipe
    rect(x, height - bottom, w, bottom); // Lower Rectangular Pipe
  }
}
