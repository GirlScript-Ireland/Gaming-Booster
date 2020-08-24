int wid=400;
class Pipe
{
  float x;
  float bottom;
  float top;
  float w=40;
  
  Pipe()
  {
    x=wid;
    top=random(100,(height/2)-8); //height of the top pipe
    bottom=random(100,(height/2)-8); //height of the bottom pipe
  }
  boolean hits(Bird b)
  {
    if((b.pos.x>x)&&(b.pos.x<(x+w)))
    {
      if((b.pos.y<(top+b.r)) || (b.pos.y>(height-bottom-b.r)))
      
      {
        return true;
      }
    }
      return false; 
  }
 void update()
 {
    x-=3;
 }
 void show(boolean hit)
 {
    stroke(0); 
    strokeWeight(2); 
    if(hit)
    {
      fill(0,0,0);
    }
    else
    {
      //The pipes will apper green
      fill(50,205,50);
    }
    rect(x,0,w,top); 
    rect(x,height-bottom, w,bottom); 
}
}//end of pipe class
