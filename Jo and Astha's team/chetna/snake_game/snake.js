function Snake(){
  this.x=0; //positon along x-axis
  this.y=0; //position along y-axis
  this.xdirection = 1; //moves positively across x a xis
  this.ydirection = 0; //doesnt move across y
  //this.speed = 5; //how fast snake moves
  this.total=0;
  this.tail=[];
  this.update=function()
  {   for(let i=0; i < this.tail.length-1 ; i++)
    { this.tail[i]=this.tail[i+1];
    
    
      }
      if(this.total >=1){
        this.tail[this.total-1]=createVector(this.x,this.y);
      }
    this.x=this.x+this.xdirection * scl;
    this.y=this.y+this.ydirection * scl;
    

    
  };
  
  
  this.show = function(){
    stroke(0,0,0);
    strokeWeight(2);
     fill(0,255,0);
    for(let i=0;i<this.tail.length;i++)
    {
      ellipse(this.tail[i].x,this.tail[i].y,scl,scl);
    }
    ellipse(this.x,this.y,scl,scl);
    
  };
  this.changeDirection = function(x,y)
  {
    this.xdirection=x;
    this.ydirection=y;
  };
  this.eat=function(food)
  {
    let d=dist(this.x,this.y,food.x,food.y);
    if(d<0.5){
      this.total++;
      return true;
    }
    else{
      return false;
    }
  };
  this.death=function(){
    for(let i=0 ;i<this.tail.length;i++)
    
    {
      let pos=this.tail[i];
      let d=dist(this.x,this.y,pos.x,pos.y);
      if(d<1)
      {
        this.total=0;
        this.tail=[];
        console.log('starting over');
        count=0;
        return true;
      }
    }
    return false;
  };
}