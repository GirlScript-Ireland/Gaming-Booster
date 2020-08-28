function Snake() {
  this.x = 0;
  this.y = 0;
  this.xspeed = 1;
  this.yspeed = 0;
  this.total = 0;
  this.tail = [];
  
  this.eat = function(pos) {
    let d = dist(this.x, this.y, pos.x, pos.y);
    if(d<0.5) {
      this.total++;
      return true;
    }
    else{
      return false;
    }
  };
  
  this.dir = function(x, y) {
    this.xspeed = x;
    this.yspeed = y;
  };
  
  this.death = function() {
    for(let i = 0; i<this.tail.length; i++){
      let pos = this.tail[i];
      let d = dist(this.x, this.y, pos.x, pos.y);
      
      if(d<1){
        console.log('starting over!');
        this.total = 0;
        this.tail = [];
      }
      
    }
  }
  
  this.update = function() {
    for(let i=0; i<this.tail.length - 1; i++){
      this.tail[i] = this.tail[i+1];
    }
    
    if(this.total >= 1){
      this.tail[this.total-1] = createVector(this.x, this.y);
    }
    
    this.x = this.x + this.xspeed * scl;
    this.y = this.y + this.yspeed * scl;
    
    this.x = constrain(this.x, 0, width - scl);
    this.y = constrain(this.y, 0, height - scl);
    
  }
  
  this.show = function() {
    stroke(0,0,0);
    stroke(2);
    fill(255, 251, 148);
    
    for(let i=0; i<this.tail.length; i++){
      rect(this.tail[i].x, this.tail[i].y, scl, scl, 10);
      
      if(i==this.tail.length-1)
      {
        fill(255, 162, 0);
      }
      else if(i%2==0)
      {
        fill(255, 236, 28);
      }
      else
      {
        fill(255, 251, 148);
      }
    }
    //rect(this.x, this.y, scl, scl);
    ellipse(this.x+scl/2, this.y+scl/2, scl, scl);
    //rect(this.x+scl/2, this.y+scl/2, scl/2, scl/10, 10);
      
      score = this.tail.length*10;
      fill(170, 255, 13);
      textSize(64);
      text(score, width/2, 75);
  };
  
}
