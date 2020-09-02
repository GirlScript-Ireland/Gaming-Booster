function Snake(){

  this.x = 0;
  this.y = 0;
  this.xspeed = 1;
  this.yspeed = 0;
  this.total = 0;
  this.tail = [];
  
  this.eat = function(pos){ //check if food is being eaten a ta position
  
    let d = dist(this.x, this.y, pos.x, pos.y); //then find the distance between the snake and the food 
    
    if (d < 0.5) { //dist cannot be exactly 0, so using 0.5, if distc is less than 1
    
      this.total++; //increase the size of the snake by 1
      return true; //and return true that it has eaten the food
      
    }
    else{
      return false; //else return false
    }
  
  };
  
  this.dir = function(x, y){ //diretion ofsnake
  
    this.xspeed = x;
    this.yspeed = y;
  
  };
  
  this.death = function(){
  
    for(let i=0; i<this.tail.length; i++){
      
        let pos = this.tail[i];
        let d = dist(this.x, this.y, pos.x, pos.y);
        
        if( d<1 ){ //if the snake is touching itself reset game
        
          console.log('Starting Over');
          this.total = 0;
          this.tail = [];
        
        }
        
    }
  
  };
  
  this.update = function(){ 
  
  //traverse whole tail and increment by 1, every i po is reinitialized to its next one
  for( let i=0; i<this.tail.length-1; i++ ){
    
       this.tail[i] = this.tail[i+1];
      
      }
      
      //if total lenght of snake is bigger than 1, then itll get updated then
      if( this.total >= 1 ){
        
        this.tail[this.total-1] = createVector(this.x, this.y);
        
      }
      
      //reinitialie x and y pos according to lenght and speed
      this.x = this.x + this.xspeed * scl;
      this.y = this.y + this.yspeed * scl;
      
      ////confine the snake to the width of the canvas, reset size if hits wall
      this.x = constrain( this.x, 0, width-scl ); //speed is 0
      this.y = constrain( this.y, 0, height-scl );
  
  };
  
  
  this.show = function(){ //create visuals for snake
  
    stroke(0, 0, 0);
    strokeWeight(2);
    fill(255);
    
    for (let i = 0; i < this.tail.length; i++) {//want blocks/length of the array, we want those many blockso n the screen
    
      rect(this.tail[i].x, this.tail[i].y, scl, scl);
      
    }
      
      rect( this.x, this.y, scl, scl ); //display the rectangles one after the other, 
      //or else as lenght increases theyll appear random positions
      
  };
  
 
}
