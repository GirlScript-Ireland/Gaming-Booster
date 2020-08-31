PImage cityscape; //declare image object called mountain as bg

PVector gravity = new PVector( 0, 1 );
int score = 0; //initialize the score
bird b;
//pipe p;
ArrayList<pipe> pipes=new ArrayList<pipe>();//declare an array object of type pipe (for the pipes being generated sequentially in the game)

void setup(){
  
  size(400, 612);
  b = new bird();
  pipes.add(new pipe());//add a pipe object to the list of pipes
  
}

void draw(){
  
  cityscape = loadImage("cityscape.jpg"); //load dthe image
  background(cityscape);
  
  if( frameCount % 75 == 0 ){
    pipes.add(new pipe());
  }
  
  if( keyPressed ){
  
    PVector up = new PVector( 0, -5 );  //variable for displacement of bird object
    b.applyForce(up); //displace object pup by 5 px
  
  }
  
  b.show();
  b.update();
  
  boolean safe = true; //a true flag variable to indicate if our bird collided with the pipe
  
  for( int i = pipes.size()-1; i>=0; i-- ){
    pipe p = pipes.get(i);
    p.update();
    
    if( p.hits(b) )//if the bird collides with the pipe
    {
      p.show(true);
      safe=false;
      
    }else {
      
      p.show(false);
      
    }
    
    if( p.x < -p.w ){ //if the next x overlaps with the next pipe remove it
      pipes.remove(i);
    }
    
  }
  
    if( safe ) // no collision
    {
      score++; //increment the score
    }
    else{
      score -= 50;//decrement the score with a penalty of 50 
      }
      
    
    fill(0,0,0); //color of the text displaying the score
    textSize(30); //size of the text 
    textAlign(CENTER);
    text(score, width-80, 50); //display the score
    score = constrain( score,0,score );
    

  
}
