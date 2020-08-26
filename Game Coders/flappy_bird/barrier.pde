class Barrier {
  float top;
  float bottom;
  float w = 80;
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

  //Detects Bird and Barrier Collisions
  boolean hits(Bird b)
  {
    return ((b.pos.x > x) && (b.pos.x < (x + wid))) && ((b.pos.y < (top + b.r)) || (b.pos.y > (height - bottom - b.r)));
  }
  void show(boolean hit)
  {
    //Checks if a hit has been made and changes the colour accordingly 
    if (hit)
    {
      fill(217, 74, 30, 127);
    } else
    {
      fill(65, 224, 129, 127);
    }
    //stroke(0, 0, 0);
    //strokeWeight(2);
    //rect(x, 0, w, top);
    //rect(x, height - bottom, w, bottom);
    image(topPipe, x, 0, w, top);
    image(bottomPipe, x, height-bottom, w, bottom);
  }
}
