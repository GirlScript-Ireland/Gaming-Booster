class Bird {
  
  PVector pos;
  PVector vel;
  PVector acc;
  float r = 16;
  
  Bird(){
    pos = new PVector(50,height/2);
    vel = new PVector(50,50);
    acc = new PVector();
    
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
      
      if(pos.y > height){
      pos.y = height;
      vel.mult(0);
      }
    }
    
    void show(){
      PImage bd = loadImage("bd.png");
      image(bd,pos.x , pos.y);
  
    }
}
