Bird b;
PVector gravity = new PVector(0, 0.5);
ArrayList<Barrier> barriers = new ArrayList<Barrier>();
int wid = 400;
void setup()
{
  size(400,800);
  b=new Bird();
}

void draw()
{
  
  if(frameCount % 75 == 0)
  {
    barriers.add(new Barrier());
  }
  background(142, 232, 181);
  b.update();
  b.show();
}
