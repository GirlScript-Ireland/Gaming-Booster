function Food(){
  this.x= random(windowWidth);
  this.y=random(windowHeight);;
  
  this.variable = function(){
    this.x = random(windowWidth);
    this.y = random(windowHeight);
    
  };
  
  this.show = function(){
    fill(255,0,200);
    rect(this.x,this.y,20,20);
    
    
  };
  
};
