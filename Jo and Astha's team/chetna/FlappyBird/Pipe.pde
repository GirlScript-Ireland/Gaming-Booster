class Pipe{
float x;
float top;
float bottom;
float w =40;

Pipe(){
  x = width+w;
  top = random(100,height/2);  //different length pipes
  bottom = random(100,height/2);
}
void show(boolean hit){
  if(hit)
  {
    fill(95,158,160);
  }
  else{
    fill(176,224,230);
  }
  rect(x,0,w,top); //first rectangle
  rect(x,height-bottom,w,bottom); //second rectangle
  
}
void update(){
  //with every update decrease size
  x-=3;
}
//when bird collide with pipe they will have same x and y axis position
boolean hits(Bird b){
   if((b.pos.x > x) && (b.pos.x < (x+w)))
   {
     //less than y and grater then x bord will not hit
     if(!((b.pos.y > top) && (b.pos.y < (height-bottom))))
     { 
       return true;
     }
    
   }
return false;
}
}
