let img;

function Snake(){

  this.x = 0; //positioning along x
  this.y = 0; //position along y
  this.xspeed = 1; //speed
  this.yspeed = 0; 
  this.total = 0; //total length initially
  this.tail = []; //array of the tail
  img=loadImage('bird.png');
  
//function to check if snake ate the food
  this.eat = function(pos) { //if eaten at that position
    let d = dist(this.x, this.y, pos.x, pos.y);
    if (d < 0.5) { //if the distance is less than 1
      this.total++; //increase the size of the snake by 1
      score=score+1
      return true; //and return true that it has eaten the food
    } else{
      return false; //else return false
    }
  };
  
  //direction of the snake
  this.dir = function(x, y) {
    this.xspeed = x;
    this.yspeed = y;
  };
  
  this.death = function() {
    for (let i = 0; i < this.tail.length; i++) {
      let pos = this.tail[i];
      let d = dist(this.x, this.y, pos.x, pos.y);
      
      if (d<1) {
        console.log('starting over');
        this.total = 0;
        this.tail = [];
        score=0;
      } 
    }
  };
  
  this.update = function(){
    for (let i = 0; i < this.tail.length - 1; i++) {
      this.tail[i] = this.tail[i + 1];
    }
   
    if(this.total >= 1) {
      this.tail[this.total-1] = createVector(this.x, this.y);
    }
    
    this.x = this.x + this.xspeed * scl;
    this.y = this.y + this.yspeed * scl;
      
    this.x = constrain(this.x, 0, width - scl);
    this.y = constrain(this.y, 0, height - scl);
  };

  //showing the snake on the screen + filling with color
  this.show = function() {
    stroke(0,0,0);
    stroke(2);
   fill(53, 116, 107);
    //fill(53, 116, 107);
      //image(img,this.x,this.y);
    for (let i = 0; i < this.tail.length; i++) {
      ellipse(this.tail[i].x+scl/2, this.tail[i].y+scl/2, scl, scl);
      if(i%2==0){
      fill(21, 212, 185);
      }
      else{
        fill(53, 116, 107);
      }
    }
  
    rect(this.x, this.y, scl, scl);
    
  };
}
