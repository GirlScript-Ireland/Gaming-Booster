PImage mountain; 

Bird b;
int score=0; 
PVector gravity = new PVector(0, 1);
ArrayList<Pipe> pipes=new ArrayList<Pipe>();


void setup(){
  
  
  size(1000,667);
  b=new Bird(); 
  pipes.add(new Pipe());
  
}


void draw(){
  mountain=loadImage("sample.jpg"); 
  
  background(mountain);
  
  if(frameCount%75==0){
    pipes.add(new Pipe());
  }
  
  
  if(keyPressed){
    PVector up=new PVector(0, -5); 
    b.applyForce(up); 
  }
  b.display();
  b.update();
  // void show(){
  
  boolean safe=true; 
  for(int i=pipes.size()-1;i>=0;i--){
    Pipe p=pipes.get(i);
    p.update();
    
    if(p.hits(b))//if the bird collides with the pipe
    {
      p.show(true);
      safe=false;
    }else {
      p.show(false);
    }
    
    if(p.x < -p.w){
      pipes.remove(i);
    }
    
  }
    if (safe) // no collision
    {
      score++; //increment the score
    }
    else{
      score-=50;//decrement the score with a penalty of 50 
      }
    
    
    fill(255,255,255); //color of the text displaying the score
    textSize(50); //size of the text 
    textAlign(CENTER);
    text(score, width-80, 50); //display the score
    score=constrain(score,0,score);



}
