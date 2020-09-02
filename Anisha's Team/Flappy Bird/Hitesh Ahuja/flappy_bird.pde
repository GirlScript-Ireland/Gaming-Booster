PImage mountain;

Bird b;


int score = 0;
PVector gravity = new PVector(0,1);
ArrayList<Pipe> pipes = new ArrayList<Pipe>();

void setup(){
  
  size(881,629);
  b = new Bird();
  pipes.add(new Pipe());
}

void draw(){
  mountain = loadImage("mount.jpg");
  background(mountain);
  
  if(frameCount % 100 == 0){
    pipes.add(new Pipe());
  }
  
  if(keyPressed){
    
    PVector up = new PVector(0 , -5);
    b.applyForce(up);
  }
  
  b.update();
  b.show();
  
  boolean safe = true;
  for(int i = pipes.size()-1 ; i>= 0 ; i--){
    Pipe p = pipes.get(i);
    p.update();
    
    if(p.hits(b)){
      p.show(true);
      safe = false;
    }
    else {
      p.show(false);
    }
    
    if(p.x < -p.w){
      pipes.remove(i);
    }
  }
  
  if(safe)
  {
    score++;
  }
  else{
    score -= 50;
  }
  
  fill(255,255,255);
  textSize(30);
  textAlign(CENTER);
  text(score , width-80,50);
  score = constrain(score , 0 , score);
  
}   
