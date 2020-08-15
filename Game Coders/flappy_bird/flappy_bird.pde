Bird b;

PVector gravity = new PVector(0, 0.5);
ArrayList<Barrier> barriers = new ArrayList<Barrier>();
int wid = 400;
void setup()
{
  size(400,800);
  b=new Bird();
  
}

void draw(){

  if(frameCount % 75 == 0)
  {
    barriers.add(new Barrier());

  }
  
  if(keyPressed)
  {
    PVector up = new PVector(0,-5);
    b.applyForce(up);
  }
 
  background(142, 232, 181);
  b.update();
  b.show();
  
  for(int i=barriers.size()-1; i>=0; i--){
    Barrier p = barriers.get(i);
    p.update();
    if (p.hits(b))
    {
      p.show(true);
    }
    else
    {
      p.show(false);
    }
    if(p.x < -p.w)
    {
      barriers.remove(i);
    }
  }
}


  
