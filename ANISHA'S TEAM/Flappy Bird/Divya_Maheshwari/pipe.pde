int wid=700;

class Pipe{
  //================data members===============
  float x;
  float bottom;
  float top;
  float w=48;
  
  Pipe(){
    x=wid+w;
    top=random(100,(height/2)-18); //height of the top pipe
    bottom=random(100,(height/2)-18); //height of the bottom pipe
  }
  
  //check if there is collision of bird with the pipe
  boolean hits(Bird b){
    if((b.pos.x>x)&&(b.pos.x<(x+w))) //if bird lies within the width of the pipe
    {
      if((b.pos.y<(top+b.r)) || (b.pos.y>(height-bottom-b.r)))
      //if bird is either below the upper pipe or above the lower pipe
      {
        return true; //collision
      }
    }
      return false; //no collision
  }
  
  
  //progress the pipes
  void update()
  {
    x-=3;    
  }
  
  //show the pipes
  void show(boolean hit){
    stroke(0); //outline
    strokeWeight(2); //thickness of the border
    if(hit){
      //if pipe hits the bird, change the color to black
      fill(0,0,0);
    }
    else{
      //otherwise, it will apper white in color
      fill(165,82,45);
    }
    
    rect(x,0,w,top); //upper rectangular pipe
    rect(x,height-bottom, w,bottom); //lower rectangular pipe
  }

}
