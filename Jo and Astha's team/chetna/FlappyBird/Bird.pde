class Bird{
 float r=16;
 PVector pos;
 PVector vel;
 PVector acc;
 
 
 Bird(){
   pos = new PVector(width/2,height/2);
   vel = new PVector(0,0);
   acc = new PVector(0,0);
 }
 void show(){
   //ellipse(pos.x,pos.y,r*2,r*2);
 
  //ERROR Fix: loadImage needs to be done in setup since we need to load it before game starts
  //use image(image, x, y) to draw it on canvas in show()
  
    //b1=loadImage("bird.png"); //i have added it in comments 
    //whenevr i try to do this it shows error , here i am trying to add
    //real bird image.
    image(b1, pos.x, pos.y);
      b1.resize(60, 60);
 

 }
 void update(){
   pos.add(vel);
   vel.add(acc);
   vel.limit(4);
   acc.mult(0);
   
   if(pos.y > height) 
   {
     pos.y=height;
     vel.mult(0); //multiplication function
   }
   
   if(pos.y < 0)
   { pos.y = 0;
     vel.mult(0);
   }
 }
 void applyForce(PVector force){
    acc.add(force);
 }
}