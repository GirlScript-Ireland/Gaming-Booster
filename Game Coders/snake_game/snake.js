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
   this.update=function(){
    this.x = this.x + this.xspeed*scl;
    this.y = this.y + this.yspeed*scl;
    this.x = constrain(this.x,0,width-scl);
    this.y = constrain(this.y,0,height-scl);
  };
  this.dir=function(x,y){
    this.xspeed=x;
    this.yspeed=y;

  };  
  
  this.eat = function(pos) {
    let d = dist(this.x, this.y, pos.x, pos.y);
    return (d < 0.5);
  };
  
  this.death = function() {
    for(let i = 0; i < this.tail.length; i++)
    {
      let pos = this.tail[i];
      let d = dist(this.x, this.y, pos.x, pos.y);
      if(d < 1) 
      {
        this.tail = [];
        this.total = 0;
      }
    }
  };
}
