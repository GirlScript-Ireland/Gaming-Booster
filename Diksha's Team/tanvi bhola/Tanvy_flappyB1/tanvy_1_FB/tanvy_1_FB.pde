PImage bg;
int birdy_coor= 40;
int birdx_coor= 50;
int gravity_val= 5;
int jumpforce_val=20;
void setup()
{
  size(800,620);
  bg=loadImage("./image/flappingbirdback.png"); 
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
  ellipse(birdx_coor,birdy_coor,55,55);
  birdy_coor=birdy_coor+gravity_val;
  if(keyPressed)
  {
    birdy_coor=birdy_coor-jumpforce_val;
  }
  
}
