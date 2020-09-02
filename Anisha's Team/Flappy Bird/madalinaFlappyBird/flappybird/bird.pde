//file for class for bird

class bird{
  
  PVector pos; //make an object of vector class instead of int bc the pos will have direction x&y aka vector
  PVector vel;
  PVector acc;
  float r = 16; //will be used to determine shape of the bird object in "ellipse"
  
  bird(){ //default constructor
    
    pos = new PVector( 50, height/2 );
    vel = new PVector( 50, 50 );
    acc = new PVector();
  
  }
  
  void applyForce( PVector force ){ //whenevr key pressed, acceleration is added
  
    acc.add(force);
    
  }
  
  void update(){ //update for every frame how the bird appears
  
  applyForce(gravity); //bird obj is acted upon by a gravitational force
  pos.add(vel); //pos of bird incremented by dist travelled
  vel.add(acc); //vel of the bird is incremented by change of speed
  vel.limit(4); //max speed the bird can have
  acc.mult(0);
  
  if( pos.y > height ){ //if bird escapes screen
  
    pos.y = height; //then reset the position and velocity
    vel.mult(0);
    
    }
  
  }
  
  void show(){
 
    stroke( 0 ); //stroke is the border/outline of the object
    fill( 255 ); //col of object
    ellipse( pos.x, pos.y, r, r ); //shape of the object
  
  }
  
}
