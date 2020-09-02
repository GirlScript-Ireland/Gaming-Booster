class Pipe
{
  float x; //pos on x-axis
  float top;//height of the top pipe
  float bottom;
  float wid = 40;//width of pipe
  float pipe_speed = 3;//speed of px that pipes move left

  // PIPE CONSTRUCTOR

  Pipe()
  {
    x = width + wid;
    top = random(100, height/2);//randomise the heights of these two pipes
    bottom = random(100, height/2);
  }

  //function to check to see of the bird touches the pipe
  boolean hits(Bird obj)
  {
    if ((obj.position.x > x) && (obj.position.x < (x + width)))
    {
      if ((obj.position.y < (top+obj.rad)) || (obj.position.y > (height - bottom - obj.rad)))
      {
        return true;//collision
      }
    }
    return false;//no collision
  }

  void update()
  {
    x -= pipe_speed;//moves the pipes to the left
  }

  void show(boolean hit)
  {
    stroke(0);
    strokeWeight(2);
    if (hit)//change pipe colour to red
    {
      fill(230, 74, 30);
    } else
    {
      fill(100, 280, 129);
    }

    rect(x, 0, wid, top-40);
    rect(x-10,top-40,wid+20,20);
   
    rect(x, height - bottom, wid, bottom);//shape of the pipe
    rect(x-10,height-bottom,wid+20,20);
  }
}
