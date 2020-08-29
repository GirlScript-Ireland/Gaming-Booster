Bird b; // Create an object b of the class Bird
int score = 0; // Initialize our score to zero
int wid = 400;
PImage mountain; // declare an image object for the background
ArrayList<Pipe> pipes = new ArrayList<Pipe>(); // Declare the list of pipes
PVector gravity = new PVector(0,0.5);

// This function runs only once
void setup(){
  size(400,800); // Create a canvsa of width 400 pixels and height 800 pixels
  b = new Bird(); // Initializing our bird object
  pipes.add(new Pipe()); // Add a Pipe object to the list
  mountain = loadImage("mountainBG.jpg"); // Fetch the mountain image
}


// This function runs multiple times
void draw(){
  background(0, 0, 0); // Setting the default background in position
  image(mountain,0,0); // Now we put our background image
  
  if ( frameCount % 75 == 0)
  {
    pipes.add(new Pipe());
  }
  
  if (keyPressed) //Check for a keyboard input (Space bar)
  {
    PVector up = new PVector(0, -5); // The variable for the movement to go up
    b.applyForce(up); // Displace the bird object
  }
  
  b.update();
  b.show();
  boolean safe = true; // A flag variable to indicate if the bird object collides with another object
  for (int i = pipes.size() - 1; i>=0; i--)
  {
    Pipe p = pipes.get(i);
    p.update();
    
    if(p.hits(b)) // If the bird collides with a pipe
    {
      p.show(true);
      safe = false;
    }
    else // Otherwise the bird passes safely
    {
      p.show(false);
    }
    
    if(p.x < -p.w)
    {
      pipes.remove(i);
    }
    
  }
  
  if(safe) // If ther is no collision
  {
    score++; // Increment score by 1
  }
  else // Otherwise in case of a collision
  {
    if(score > 0)
    {
      score -= 50; // Decrement score by a penalty of 50
    }
  }
  
  fill(16,53,201); //Color of the text for displaying score
  textSize(64); // Text Size of the score
  text(score, width/2, 50); // Position of the score text
  
  score = constrain(score, 0, score); // Limit our score
  
  
}
