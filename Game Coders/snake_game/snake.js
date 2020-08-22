function Snake() {
  
  this.x=0;
  this.y=0;
  this.xspeed=1;
  this.yspeed=1; 
  
  this.show=function(){
    stroke(0,0,0);
    strokeWeight(2);
    fill(255);
    rect(this.x,this.y,scl,scl);    
  };
}


  
