PImage[] d = new PImage[5];

class drogo{
    int j;
   float x,y,z;
   float gravity=1.2;
   
  drogo(){
     j=0;
     x=75;
     y=50;
     z=2;
     for(int i=0;i<d.length;i++)
     {
     d[i] = loadImage("./Image/drogo/tile00"+i+".png");
     }
  }
  
  void display(){
  
   d[j].resize(50,45);
   image(d[j],x,y);
 
   if(frameCount%5==0)
    {
      j++;
      if(j>4)
        j=0;
    } 
  }
  
  
  
  void gravity(){
  y=y+(0.25*gravity*z);
    if(z<10)
      z++;
  }
  
  void assend(){
    y=y-(1*gravity*z);
    if(y>gravity*z)
    {
      y=y+(0.25*gravity*z);
    }
    if(z<10)
      z++;
  }
  
  void canvas(){
    if(y>=height-50)
      y=height-50;
    if(y<=0)
      y=0;
  }
}
