Bird b; // Create an object b of the class Bird
int wid = 400;
int rez = 20;
int score = 0; // Intialize our score to zero
boolean jumping = false;
PVector gravity = new PVector(0, 0.5);
ArrayList<Pipe> pipes = new ArrayList<Pipe>(); // Declare an array object of the type pipes (Typically for the pipes being generated sequentially in the game)
PImage mountain; // Declare an image object for the background

// This function runs only once
void setup() {
  size(400, 800); // Create a canvas of width 400 pixels and height 800 pixels 
  b = new Bird(); // Intializing our bird object
  pipes.add(new Pipe()); // Add a Pipe object to the list of pipes
  mountain = loadImage("/assets/background.jpg"); // Fetch the mountain image using the relative path
}

// This function runs multiple times
void draw() {
  background(0, 0, 0); // Setting the default background color to black
  image(mountain,0,0); // Now we put our background image
  if (frameCount % 75 == 0) 
  {
    pipes.add(new Pipe());
  }

  if (keyPressed) // Check for a keyboard input (Space bar is the defacto way) 
  {
    PVector up = new PVector(0, -5);  // The variable for displacement of bird object
    b.applyForce(up); // Displace the bird object up by 5 pixels
  }

  b.update();
  b.show();
  boolean safe = true; // A flag variable to indicate if our bird object collided with a pipe object

  for (int i = pipes.size() - 1; i >= 0; i--)
  {
    Pipe p = pipes.get(i);
    p.update();
    if (p.hits(b)) // If the bird collides with a pipe
    {
      p.show(true);
      safe = false;
    }
    else // Otherwise the bird passes safely
    {
      p.show(false);
    }

    if (p.x < -p.w)
    {
      pipes.remove(i);
    }
  }

  if(safe) // If there is no collision
  {
    score++; // Increment score by -1
  } 
  else // Otherwise in case of a collision
  {
    score -= 50; // Decrement score by a penalty of 50 (Note it is a good habit to declare the penalty has global variable)
  }

  fill(16, 53, 201); // Color of the text for displaying our score (Here:Bluishh)
  textSize(64); // Size of the text for displaying our score
  text(score, width/2, 50); // Display our score
  score = constrain(score, 0, score);
}
