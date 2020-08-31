PImage img;

class Logs{
 
  float x,y,var;
  Logs(){
    x=720;
    y=random(200,350);
    var=random(150,250);
    img = loadImage("./Image/wood.png");
  }
  
  void display(){
     image(img,x,y);
     image(img,x,y-500-var);
     x=x-2;
  }
  
  boolean overlap(drogo pass){
    float dro_x=pass.x,dro_y=pass.y;
    if(dro_x+50>=x&&dro_x<=x+50)
    {
      if(dro_y+45>=y||dro_y<=y-var)
        return false;
    }
    return true;
  } 
  
  boolean check(){
      float dro_x=75;
      if(dro_x>x+50)
      {
        return true;
      }
      return false;
    }    
  
}
