let bg;
let scl=40;
let fR = 7;
let food;

function setup() {
  // replaced hard coded values with relative values
  // so that canvas fill fill whole window without overflowing
  createCanvas(windowWidth, windowHeight);
  bg = loadImage("Background.png");
  s=new Snake();
  frameRate(fR);
  pickLocation();
}

// to make canvas fill the window when window is resized
function windowResized() {
  resizeCanvas(windowWidth, windowHeight);
}

function pickLocation() {
  let rows = random(floor(width / scl));
  let cols = random(floor(height / scl));
  food = createVector(floor(rows), floor(cols));
  food.mult(scl);
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

  if(s.eat(food)){
    pickLocation();
  }
  s.death();
  s.update();
  s.show();
  // food display properties
  stroke(0, 0, 0);
  strokeWeight(2);
  fill(250, 1, 100);
  rect(food.x, food.y, scl, scl);
}
