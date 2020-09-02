//This is a class for the bird
//thus all the data here if just for the bird
//this is to make code easier to read and stuff 

class Bird
{
  PVector gravity = new PVector(0, 0.5);
  PVector position;// a vector is sorta like an arrow. instead of using x and y
  PVector velocity;
  PVector acceleration;
  float rad = 16;//radius of the bird

  //           Constructor to init our bird object

  Bird()
  {
    position = new PVector(50, height/2);
    velocity = new PVector(0, 0);
    acceleration = new PVector();
  }

  // function to apply gravity
  void Force(PVector force)
  {
    acceleration.add(force);
  }

  void update()
  {
    //for every frame
    Force(gravity);//force is applied
    position.add(velocity);//velocity and acceleration is changed
    velocity.add(acceleration);
    velocity.limit(4);//the bird can only move 4 to the right
    acceleration.mult(0);//sets acc to 0

    if (position.y >height)
    {
      position.y = height;//stops the bird from leaving the top of the screen
      velocity.mult(0);//makes the velocity 0
    }
  }

  void show()
  {
    bird = loadImage("bird.png");//load in the bird
    image(bird,position.x,position.y,rad*2,rad*2);//shows the bird on the screen
   
  }
}
