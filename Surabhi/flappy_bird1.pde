int score = 0;
Bird b;
int wid = 400;
ArrayList<Pipe> pipes = new ArrayList<Pipe>();
PImage mountain;
PVector gravity=new PVector(0,0.5);

void setup(){
   size(400,800);
   b = new Bird();
   pipes.add(new Pipe());
    mountain = loadImage("background.jpg");
}  
void draw(){
   image(mountain,0,0);
   
   if(frameCount % 75 == 0)
   {
     pipes.add(new Pipe());
   }
   
   if(keyPressed)
   {
     PVector up = new PVector(0, -5);
     b.applyForce(up);
   
   }
   
   b.update();
   b.show();
   boolean safe = true;
   for(int i = pipes.size()- 1; i>=0 ; i--)
   {
     Pipe p = pipes.get(i);
     
     p.update();
     if(p.hits(b)){
       p.show(true);
       safe = false;
     
     }
     else
     {
       p.show(false);
     }
     if(p.x < -p.w){
       pipes.remove(i);
     }
     
   }
  if(safe){
    score++;
  }
  else
  {
    score -=50;
  }
  
  fill(0, 0, 0);
  textSize(40);
  text(score, width/2, 50);
  
  score = constrain(score, 0, score);
}
