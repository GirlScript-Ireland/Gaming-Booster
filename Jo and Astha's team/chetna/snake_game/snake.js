function Snake(){
  this.x=0;
  this.y=0;
  this.xdirection = 1;
  this.ydirection = 0;
  this.speed = 2;
  this.update=function(){
    this.x=this.x+(this.xdirection * this.speed);
    this.y=this.y+(this.ydirection * this.speed);

    
};
  
  
  this.show = function(){
    fill(255,255,255);
    rect(this.x,this.y,20,20);
    
  };
  this.changeDirection = function(x,y){
    this.xdirection=x;
    this.ydirection=y;
  };
  
};
