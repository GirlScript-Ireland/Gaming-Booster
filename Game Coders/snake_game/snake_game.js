let bg;
let scl=40;
let fR = 7;

function setup() {
  createCanvas(1420,772);
  bg = loadImage("Background.png");
  s=new Snake();
  frameRate(fR);
}

function keyPressed(){
  if(keyCode==UP_ARROW)
  {
    s.dir(0,-1);
  }
  else if(keyCode==DOWN_ARROW)
  {
    s.dir(0,1);
  }
  else if (keyCode===LEFT_ARROW)
  {
    s.dir(-1,0);
  }
  else if(keyCode===RIGHT_ARROW)
  {
    s.dir(1,0);
  }
}
    

function draw() {
  background(bg);
  s.update();
  s.show();
}
