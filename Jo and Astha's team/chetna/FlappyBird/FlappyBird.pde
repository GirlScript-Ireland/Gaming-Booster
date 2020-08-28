
PImage bg;
PImage b1;
//int bgx,bgy;
Bird b;
int score=0;
PVector gravity = new PVector(0,0.5);
ArrayList<Pipe> pipes = new ArrayList<Pipe>(); //adding pipe
void setup()
{
  size(400,700);
  bg=loadImage("e.jpg");
  bg.resize(400,700);
  b = new Bird();
 
}
  
void draw(){

background(bg);
//image(bg,bgx,bgy);
//bgx=bgx-1;
boolean safe = true;
//ellipse(200,400,32,32);
//make pipes after every 75 frmaes
if(frameCount % 75 == 0 )
{
  pipes.add(new Pipe());
}

b.show();

if(keyPressed)
{ 
  PVector up = new PVector(0,-5);
   b.applyForce(up);
  
}

b.applyForce(gravity);
b.update();
//b.show();
for(int i=pipes.size()-1;i>=0;i--)
{
  Pipe p =pipes.get(i);
  //if pipe has gone very far to left
  if(p.x < -p.w)//if its minus the width same s=as very left to frames
  {
    pipes.remove(i);
  }
  else{
  p.update();
  
  p.show(p.hits(b));//boolean funtion hit p.hits
  safe= !p.hits(b); //always tue unless pipe hits  
}
}

if(safe){
  score++;
}
else{
  score-=50;
}
fill(0,0,0);
textSize(20);
score = constrain(score,0,score); //score from 0  to score value
text(score,width/2,50);
}
