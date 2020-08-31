PImage pow[] = new PImage[23];

class power{
  
  float x,y;
 
  power(){
    x=50;
    y=20;
    for(int i=0;i<23;i++)
    {
      pow[i] = loadImage("./image/powerbar/power"+i+".png");
    }
  }
  
  void display(int a){
    pow[a].resize(150,20);
    image(pow[a],x,y);
  }
  
  
}
