
class Bird
{
  PImage bi;
  PVector pos;
  PVector vel;
  PVector acc;
  float r=16;
  Bird()
  {
    pos = new PVector(50, height/2);
    vel = new PVector(50,50);
    acc = new PVector();
    bi = loadImage("image.png");//image for bird will be loaded
  }
   void display()
   {
    image(bi,pos.x,pos.y,40,40);
   }
  
  void applyForce(PVector force){
    acc.add(force);
  }
  
  
  void update(){
    //for every frame
    applyForce(gravity); 
    pos.add(vel); 
    vel.add(acc); 
    vel.limit(4); 
    acc.mult(0);
    
    if(pos.y>height)
    {
      pos.y=height; 
      vel.mult(0); 
    }
    
  }
  
 
 
}
