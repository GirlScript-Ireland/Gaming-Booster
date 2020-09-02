let bg;//load in the background
let s;
let scl = 40;//scale 
let food;
let apple;


function setup() {
  createCanvas(windowWidth, windowHeight);
  bg = loadImage('snakeBackground.png');
  s = new snake(); //init snake
  frameRate(7);
  pickLocation();
  apple = loadImage('apple.png');
}

function pickLocation()
{
  let cols = floor(width/scl);
  let rows = floor(height/scl);

  food = createVector(floor(random(cols)), floor(random(rows)));
  food.mult(scl);
}

function draw() {
  background(bg);//show the background on the screen
  if (s.eat(food))
  {
    pickLocation();
  }
  s.death();
  s.update();
  s.show();

  image(apple,food.x,food.y, scl, scl);

}

function keyPressed()
{
  if (keyCode === UP_ARROW)
  {
    s.dir(0, -1);
  } else if (keyCode === DOWN_ARROW)
  {
    s.dir(0, 1);
  } else if (keyCode === RIGHT_ARROW)
  {
    s.dir(1, 0);
  } else if (keyCode === LEFT_ARROW)
  {
    s.dir(-1, 0);
  }
}
