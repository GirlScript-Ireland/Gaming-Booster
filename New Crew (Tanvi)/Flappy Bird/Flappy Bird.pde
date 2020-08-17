Bird b; // Create an object b of the class Bird
float wid = 810;
int rez = 60;
int lim = 25;
int lives = 0;
int count = 0;
int score = 0; // Intialize our score to zero
int tempScore = 0;
int highScore = 0;
boolean jumping = false;
PVector gravity = new PVector(0, 1.5);
ArrayList<Pipe> pipes = new ArrayList<Pipe>(); // Declare an array object of the type pipes (Typically for the pipes being generated sequentially in the game)
PImage logo;
PImage mountain; // Declare an image object for the background
PImage bird; // Declare an image object for the bird
PImage gameover; // Declare an image object for Game Over

// This function runs only once
void setup()
{
  // size(1080, 2340); // Create a canvas of width 1080 pixels and height 2340 pixels 
  fullScreen();
  b = new Bird(); // Intializing our bird object
  pipes.add(new Pipe()); // Add a Pipe object to the list of pipes
  logo = loadImage("logo.png");
  mountain = loadImage("background.jpg"); // Fetch the mountain image using the relative path
  bird = loadImage("bird.png"); //Fetch the image of bird
  gameover = loadImage("gameover.png"); //Fetch the image for gameover
}

// This function runs multiple times
void draw()
{
  background(0, 0, 0); // Setting the default background color to black
  image(mountain, 0, 0); // Now we put our background image
  image(logo, (width-552)/2, height-170);
  if (lives==0)
  {
    image(gameover, 0, 669);
    if(highScore/75 < score/75)
    {
      highScore = score;
    }
    fill(25, 66, 61);
    textSize(80);
    text("High Score: "+highScore/75, (width-520)/2, 500);
    text("Your Score: "+score/75, (width-520)/2, 600);
    
    if(mousePressed)
    {
      delay(500);
      count = 0;
      score = 0;
      b.pos.y = 1170;
    }
  }
  if (frameCount % 75 == 0) 
  {
    pipes.add(new Pipe()); 
  }
  if (mousePressed) // Check for a mouse input for PC or touch input for mobile
  {
    PVector up = new PVector(0, -(height/468));  // The variable for displacement of bird object
    b.applyForce(up); // Displace the bird object up by 5 pixels
  }
  
  b.update();
  b.show();
  boolean safe = true; // A flag variable to indicate if our bird object collided with a pipe object
  lives=((lim-count)/5);
 
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
  
  if(lives>0)
  {
    if (safe) // If there is no collision
    {
      if(tempScore<=75)
      {
        score = 0;
        tempScore +=1;
      }
      else
      {
        score += 1; // Increment score by +1
      }
    } 
    else // Otherwise in case of a collision
    {
      //score -= 45; // Decrement score by a penalty of 50 (Note it is a good habit to declare the penalty has global variable)
      count += 1; 
    }
  }
  if(lives>0)
  {
    strokeWeight(4);
    line(0, 150, width, 150);
    strokeWeight(4);
    line(0, height - 200, width, height - 200);
    strokeWeight(2);
    line(width/2, 0, width/2, 150);
    fill(25, 66, 61); // Color of the text for displaying our score (Here:Dark-Greenish)
    textSize(80); // Size of the text for displaying our score
    text("Score: "+score/75, width/18, 105); // Display our score
    score = constrain(score, 0, score);
    text(lives+" ❤️ left", (width/1.5), 105); // Display the count of lives left
  }
}



class Bird
{
  //-----------------Data members of our Bird Class--------------
  PVector pos;
  PVector vel;
  PVector acc;
  float r = 41;
  //------------------Functions of our Bird Class-----------------
  // Constructor to Intialize our Bird object
  Bird() {
    pos = new PVector(width/18, height/2.13); // Initial position of the bird
    vel = new PVector(0, 0);  // Initial velocity of the bird
    acc = new PVector(); // Initial accleration of the bird
  }

  void applyForce(PVector force)
  {
    acc.add(force); // Increment the acceleration by the parameter force
  }

  void update() 
  {
    // For every frame
    applyForce(gravity); // The bird object is acted upon by a gravitational force that pulls it down 
    pos.add(vel); // The position of the bird is incremented by the distance travelled per unit time
    vel.add(acc); // The velocity of the bird is incremented by the change of speed per unit tiime
    vel.limit(height/234); // The maximum speed of the bird is given a threshold of 4 ( Note here it is related to the pixels)
    acc.mult(0);

    if (pos.y > height-245) // If the bird tends to escape our screen
    {
      pos.y = height-245; // Stop it at the edge
      vel.mult(0); // Make the velocity zero
    }
    else if (pos.y < 109) // If the bird tends to escape our screen
    {
      pos.y = 109; // Stop it at the edge
      vel.mult(0); // Make the velocity zero
    }
  }

  void show() {
    if(lives>0)
    {
      // stroke(0, 0, 0); // Color of the outline of our bird object (Black)
      // strokeWeight(2); // Thickness of the outline 
      // fill(224, 218, 34); // Color of the interior of our bird object
      // ellipse(pos.x, pos.y, r*2, r*2); // Shape of the bird object
      image(bird, pos.x, pos.y);
    }
  }
}



class Pipe
{
  //-----------------Data members of our Pipe Class--------------
  float x;
  float top; 
  float bottom;
  float w = 50;
  float pipe_speed = width/216;
  //------------------Functions of our Pipe Class-----------------
  // Constructor to Intialize our Pipe object
  Pipe() 
  {
    x = width/1.33;
    top = random(300, height - 1000); // height of the top pipe
    bottom = (height - (top + 360)); // height of the bottom pipe
    // ensures that the distance between the top and bottom pipes are the same
  }
  // Check if there is any collision between the bird and the pipes 
  boolean hits(Bird b) 
  {
    if ((b.pos.x > x) && (b.pos.x < (x + (w/2))) && (count<=lim)) // if the bird lies within the hth of the pipe
    {
      if ((b.pos.y < (top)) || (b.pos.y > (height - bottom - 2*(b.r)))) 
        // If the bird is either below the upper pipe or above the lower pipe
      {
        return true; // There is a collision
      }
    }
    return false; // There is no collision
  }
  // Progress the pipes
  void update()
  {
    x -= pipe_speed;
  }

  // Show the pipes
  void show(boolean hit)
  {
    if(lives>0)
    {
      stroke(0, 0, 0); // Color of the outline of our pipes (Black)
      strokeWeight(2); // thickness of the outline 
      if (hit) // If the Pipe hits the bird
      {      
        fill(255, 15, 15, 255); // Change color to reddish
      } 
      else // If the pipe does not hit the bird
      {
        fill(0, 170, 100, 175); // Change the color to greenish
      }
      // create the pipes
      rect(x, 150, w, top - 150, 0, 0, 10, 10);  // Upper Rectangular Pipe
      rect(x, height - bottom, w, bottom - 200, 10, 10, 0, 0); // Lower Rectangular Pipe
    }
  }
}
