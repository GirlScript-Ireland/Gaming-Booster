Bird b;
PImage bird;
PImage bottomPipe;
PImage topPipe;
PImage bgImg;
int score=0;
boolean safe=true;
PVector gravity = new PVector(0, 0.5);
ArrayList<Barrier> barriers = new ArrayList<Barrier>();
int wid = 400;
void setup()
{
  size(360, 640);
  b=new Bird();
  bgImg = loadImage("bg.png");
  bird = loadImage("bird.png");
  bottomPipe = loadImage("pipe.png");
  topPipe = loadImage("flippipe.png");
}

void draw() {

  if (frameCount % 75 == 0)
  {
    barriers.add(new Barrier());
  }

  if (keyPressed)
  {
    PVector up = new PVector(0, -5);
    b.applyForce(up);
  }

  background(0, 0, 0);
  image(bgImg, 0, 0);
  b.update();
  b.show();

  for (int i=barriers.size()-1; i>=0; i--) {
    Barrier p = barriers.get(i);
    p.update();
    if (p.hits(b))
    {
      p.show(true);
      safe=false;
    } else
    {
      p.show(false);
      safe=true;
    }
    if (p.x < -p.w)
    {
      barriers.remove(i);
    }
  }

  if (safe)
  {
    score++;
    fill(16, 53, 201);
  } else
  {
    score-=2;
    fill(255, 0, 0);
  }
  //fill(16, 53, 201);
  textSize(64);
  text(score, width/2, 50);
  score=constrain(score, 0, score);
}
