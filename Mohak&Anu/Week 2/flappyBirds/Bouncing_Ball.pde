void setup()
{
  size(640,360);
}

float xspeed=2;
float yspeed=2;
float x=width/2;
float y=height/2;

void draw()
{
  background(0);
  fill(255);
  ellipse(x,y,24,24);
  x=x+xspeed;
  y=y+yspeed;
  if((y<=0)||(y>=height)){yspeed=-1*yspeed;}
  if((x<=0)||(x>=width)){xspeed=-1*xspeed;}
}
