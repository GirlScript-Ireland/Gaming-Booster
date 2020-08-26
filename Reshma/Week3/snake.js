function Snake(){
 this.x = 0;
 this.y = 0;
 this.xspeed = 1;
 this.yspeed = 0;
 this.value = 20;
 this.total = 0;
 this.tail = [];

 this.update = function(){
   for(let i=0;i<this.tail.length-1;i++){
     this.tail[i] = this.tail[i+1];
   }
   
   if(this.total>=1){
     this.tail[this.total-1] = createVector(this.x,this.y);
   } 
   this.x = this.x + this.xspeed*this.value;
   this.y = this.y + this.yspeed*this.value;
   
  this.x = constrain(this.x, 0 , width-20);
  this.y = constrain(this.y, 0, height-20);
  
 };
 
 this.death = function(){ 
   for(let i=0;i<this.tail.length;i++){
     let pos = this.tail[i];
     let d = dist(this.x,this.y,pos.x,pos.y);
     if(d<1){
       console.log("Snake is dead! Start Over !");
       this.total = 0;
       this.tail = [];
     }
   }
   
 };
 
 this.eats = function(food){
   let d = dist(this.x,this.y,food.x,food.y);
   if(d<1){
     this.total++;
     return true;
   }
   else {
      return false;
   }
   
 };
 
 
 this.dir = function(x,y){
   this.xspeed = x;
   this.yspeed = y;
   
   
 };





  this.show = function(){   
    fill(255,0,0);
    stroke(0);
    for(let i=0;i<this.tail.length;i++){
      rect(this.tail[i].x,this.tail[i].y,this.value,this.value);    
    }
    rect(this.x,this.y,this.value,this.value); 
  };  
  
}
