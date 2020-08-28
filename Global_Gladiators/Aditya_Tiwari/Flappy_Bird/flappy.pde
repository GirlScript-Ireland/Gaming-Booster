Bird b; // Create an object b of the class Bird
int wid = 400;
int rez = 20;
int score = 0; // Intialize our score to zero
boolean jumping = false;
PVector gravity = new PVector(0, 0.5);
ArrayList<Pipe> pipes = new ArrayList<Pipe>(); // Declare an array object of the type pipes (Typically for the pipes being generated sequentially in the game)
PImage mountain; // Declare an image object for the background

void setup()
{
  size(400,800);
  mountain= loadImage("background.jpg");
  b= new Bird();
  pipes.add(new Pipe());
}

void draw()
{
  background(0,0,0);
  image(mountain,0,0);
  if(frameCount % 75 == 0)
  {
    pipes.add(new Pipe());
  }
  
  if(keyPressed)
  {
    PVector up= new PVector(0,-50); //
    b.applyForce(up);
  }
  
  b.update();
  b.show();
  boolean safe =true; // A flag variable to indicate if our bird object collided with a pipe object
  
    for(int i = pipes.size()-1; i>=0; i--)
    {
      Pipe p = pipes.get(i);
      p.update();
      if(p.hits(b)) // If the bird collides with a pipe
      {
        p.show(true);
        safe = false;
      }
      else
      {
       p.show(false);   
      }
      
      if(p.x<-p.w)
      {
        pipes.remove(i);
      }
    
     }
   
    if (safe) // If there is no collision
    {
      score++;
    }
    else // Otherwise in case of a collision
    {
     score = score - 50; 
    }
    
    fill(100,100,100);
    textSize(64);
    text(score,width/2,50); 
    score = constrain(score, 0, score);
}
