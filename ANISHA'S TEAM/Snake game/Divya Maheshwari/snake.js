function Snake(){
  this.x = 0;
  this.y = 0;
  this.xspeed=1;
  this.yspeed = 0;
  this.total = 0; //total length od snake initially
  this.tail=[]; // initialise an array
  
  this.eat = function(pos){
  let d=dist(this.x,this.y, pos.x, pos.y);
  if(d<0.5){
  this.total++;
  return true;
  }
  else
  {
  return false;
  }
};
  
  this.dir=function(x,y){
    this.xspeed=x;
    this.yspeed=y;
  };
  this.death=function(){
    for(let i=0;i<this.tail.length;i++)
    {  
      let pos=this.tail[i];
      let d=dist(this.x,this.y, pos.x, pos.y);
      if(d<1){
      console.log("Starting again");
      this.total=0;
      this.tail=[];
    }
  }
};
  // update
  this.update=function(){
  for(let i=0; i<this.tail.length - 1; i++)
  {
    this.tail[i]=this.tail[i+1]; 
  }
  if(this.total >=1){
    this.tail[this.total-1] =createVector(this.x, this.y);
  }
this.x=this.x+this.xspeed * scl;
this.y=this.y+this.yspeed * scl;

this.x=constrain(this.x, 0, width-scl);
this.y=constrain(this.y, 0, height-scl);
  };

  this.show=function(){
    stroke(0,0,0);
    strokeWeight(1);
    fill(144,69,19);
    for(let i=0; i<this.tail.length; i++) // in case of array length is just a variable in java and js
    {
      rect(this.tail[i].x, this.tail[i].y, scl, scl);
    }
    rect(this.x,this.y,scl,scl);
  };
}
