function Food(){
  this.x=ceil( random(windowWidth)/scl)*scl;
  this.y=ceil(random(windowHeight)/scl)*scl;
  
  this.update = function(){
    this.x = ceil( random(windowWidth)/scl)*scl;
    this.y = ceil(random(windowHeight)/scl)*scl;
    
  };
  
  this.show = function(){
    fill(250,300,100);
    ellipse(this.x,this.y,scl,scl);
    
    
  };
  
}