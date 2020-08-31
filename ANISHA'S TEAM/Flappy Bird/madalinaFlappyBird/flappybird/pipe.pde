
int wid = 400;

class pipe{

  float x;
  float top;
  float bottom;
  float w=40;
  
  pipe(){ //constructor
  
    x = wid + w;
    top = random( 100, height/2 ); //heihgt of top pipe
    bottom = random( 100, height/2 ); //height of bottom pipe
  
  }
  
  //check if theres collision of bird w pipe
  boolean hits( bird b ){
  
    if( (b.pos.x > x) && (b.pos.x <(x+w)) ){ //if bird lies within width of pipe
      if( (b.pos.y < (top+b.r)) || (b.pos.y > (height-bottom-b.r)) ){
        //if bird is either below upper pipe or above lower pipe
        return true; //collision
      }
    }
    return false; //no collision
  }
  
   void update(){
    x -= 3;
  }
  
  void show( boolean hit ){
    
    stroke(0);
    strokeWeight(2);
    
    if(hit){
      fill(0);
    }
    else{
      fill(255);
    }
    
    rect( x, 0, w, top );
    rect( x, height-bottom, w, bottom );
    
  }
  

}
