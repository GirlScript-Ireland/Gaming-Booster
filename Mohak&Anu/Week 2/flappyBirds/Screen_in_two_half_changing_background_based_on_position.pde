void setup()
{
  size(640,360);
}

void draw()
{
  background(0);
  fill(255,255,0);
  ellipse(mouseX,mouseY,24,24);
  if(mouseX>width/2)
    {
      background(0,255,255);
      fill(0,0,255);
      ellipse(mouseX,mouseY,24,24);
    }
}
