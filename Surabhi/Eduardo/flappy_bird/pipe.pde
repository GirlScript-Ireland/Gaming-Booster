class Pipe
{
  // -------------------Data members of our Pipe Class -------
  float x;
  float top;
  float bottom;
  float w = 40;
  float pipe_speed = 3;
  // ------------ Functions of our Pipe Class ----------------
  // Constructor to Initialize our Pipe object
  Pipe()
  {
    x = wid + w;
    top = random(100, height/2); // height of the top pipe
    bottom = random(100, height/2); // height of the bottom pipe
    // 100 is the minimum height of the pipes while the maximum is half the height
  }
  // Check if there is any collision between the bird and the pipe
 boolean hits(Bird b)
 {
   if ((b.pos.x > x) && (b.pos.x < (x+w))) 
   {
     if((b.pos.y < (top + b.r)) || (b.pos.y > (height - bottom - b.r)))
     // if the bird is either below the upper pipe or above the bottom pipe
     {
       return true; // There is a collision
     }
   }
   return false; // There is no collision
 }
 // Progress the pipes
   void update()
   {
     x -= pipe_speed;
   }
  // Show the pipes
  void show(boolean hit)
  {
    stroke(0,0,0); // Color of the outline of our pipes
    strokeWeight(2); // thickness of the outline
     // If the pipe hits the bird
    if(hit)
    {
      fill(252, 3, 3, 127); // Pipe color if collision
    }
    else
    {
      fill(65,224,129,127); // Pipe color
      
    }
    rect(x,0,w,top); // Form of our pipes
    rect(x, height - bottom, w, bottom); // Position of our pipes
  }
  
}
