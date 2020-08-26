Bird b;
ArrayList<Pipe> pipes = new ArrayList<Pipe>();
PImage mountain;
void setup(){
  size(400,600);
  b = new Bird();
  mountain = loadImage("background.jpg"); // To add an image, add an image file in the same file location that these files are available.
  //add pipes
  pipes.add(new Pipe());
}

void draw(){
  background(0,0,0);
  image(mountain,0,0); // Uncomment this code if using the image as line 7
  if (frameCount % 75 == 0) 
  {
    pipes.add(new Pipe());
  }
  b.show();
  b.update();
  for (int i =0;i<pipes.size();i++){
    Pipe p = pipes.get(i);
    p.show(false);
    p.update();
    
  }
  if (keyPressed) // Check for a keyboard input (Space bar is the defacto way) 
  {
    b.up(); // Displace the bird object up by 5 pixels
  }
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


  fill(16, 53, 201); // Color of the text for displaying our score (Here:Bluishh)
  textSize(64); // Size of the text for displaying our score
  
  text(frameCount, width/2, 50); 
  // Display our score
 // score = constrain(score, 0, score);
  
}
