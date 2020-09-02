PImage bird;
PImage bg; //declare an image object for the background

Bird b;  //create an object b of class Bird

int score=0; //initialize the score
PVector gravity = new PVector(0, 1);
ArrayList<Pipe> pipes=new ArrayList<Pipe>(); //declare an array object of type pipe (for the pipes being generated sequentially in the game)

void setup(){  
  size(700,600); //create a canvas
  b=new Bird(); //initialize the bird object
  pipes.add(new Pipe()); //add a pipe object to the list of pipes  
}


void draw(){
  bg=loadImage("bg.jpg"); //fetch the mountain image using the relative path    
  
  background(bg);//now we put our background image
  
  if(frameCount%100==0){
    pipes.add(new Pipe());
  }
  
  if(keyPressed){
    PVector up=new PVector(0, -5); //variable for displacement of bird object
    b.applyForce(up); //displace the bird object up by 5 pixels
  }
  
  b.update();
  b.show();
  
  boolean safe=true; //a true flag variable to indicate if our bird collided with the pipe
  for(int i=pipes.size()-1; i>=0; i--){
    Pipe p=pipes.get(i);
    p.update();
    
    if(p.hits(b)) //if the bird collides with the pipe
    {
      p.show(true);
      safe=false;
    }
    else {
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
      score-=25;//decrement the score with a penalty of 50 
  }
        
    fill(255); //color of the text displaying the score
    textSize(40); //size of the text 
    textAlign(CENTER);
    text(score, width-80, 50); //display the score
    score=constrain(score,0,score);
    
}
