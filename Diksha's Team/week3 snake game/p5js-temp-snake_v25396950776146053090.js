let bg;
let s;
let scl=40;
function setup()
{ bg=loadImage('Background.png');
  createCanvas(1440,772);
   s=new Snake();
   frameRate(5);
  pickLocation();
}
function pickLocation()
{
  
}
function draw()
{
  background(bg);
  s.update();
  s.show();
}
function keyPressed() {
  if (keyCode === UP_ARROW) {
    s.dir(0, -1);
  } else if (keyCode === DOWN_ARROW) {
    s.dir(0, 1);
  } else if (keyCode === RIGHT_ARROW) {
    s.dir(1, 0);
  } else if (keyCode === LEFT_ARROW) {
    s.dir(-1, 0);
  }
}
