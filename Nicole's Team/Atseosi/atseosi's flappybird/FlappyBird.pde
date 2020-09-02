PImage background;//this is to load in the background image
PImage bird;//load in the bird image
Bird obj;//load in the bird and all of itd characteristics
ArrayList<Pipe> pipes = new ArrayList<Pipe>();//load in the pipes
int score = 0;//initialise the score at 0

void setup()//function to set up the screen size 
{
  size(200, 475);//size of the screen
  obj = new Bird();
  background = loadImage("background.jpg");//background image
}

void draw()//draw things to the screen
{
  image(background, 0, 0);
  obj.update();
  obj.show();
  boolean safe = true;

  if (frameCount % 75 == 0)
  {
    pipes.add(new Pipe());
  }

  if (keyPressed)
  {
    PVector up = new PVector(0, -5);
    obj.Force(up);
  }

  for (int i = pipes.size() - 1; i >= 0; i--)
  {
    Pipe p = pipes.get(i);
    p.update();
    if (p.hits(obj))
    {
      p.show(true);
      safe = false;
    } else
    {
      p.show(false);
    }

    if (p.x < -p.wid)
      pipes.remove(i);

    if (safe)
    {
      score++;
    } else
    {
      score = 1;
    }
    fill(127,120,75);
    textSize(64);
    text(score, width/3, 50);
    score = constrain(score, 0, score);
  }
}
