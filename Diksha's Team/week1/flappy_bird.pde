PImage bg;
int birdy=46;
int birdx=56;
int gravity=5;
int jumpforce=20;

void setup()
{
  size(800,620);
  bg=loadImage("./image/bg.png"); 
}
void draw()
{
  background();
  bird();
}
void background()
{
  image(bg,0,0);
}
void bird()
{
  fill(255,200,200);
  ellipse(birdx,birdy,55,55);
  birdy=birdy+gravity;
  if(keyPressed)
  {
    birdy=birdy-jumpforce;
  }
  
}
