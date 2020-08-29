let s; // snake
let scl = 40; // scale of the objects snake and food
let food; // food for the snake

function setup() {
  bg = loadImage('Background.png'); //Load the background
  mouse = loadImage('mouse.png');
  createCanvas(1700, 810); // Create canvas according to the window
  s = new Snake();
  frameRate(7);
  pickLocation();
}

function pickLocation() {
  let cols = floor(width / scl);
  let rows = floor(height / scl);
  food = createVector(floor(random(cols)), floor(random(rows)));
  food.mult(scl);
}

function draw() {
  background(bg); //add the background
  if (s.eat(food)) {
    pickLocation();
  }
  s.death();
  s.update(); //update the length of the snake if food is got
  s.show(); //show the snake
  stroke(0,0,0); //add border
  strokeWeight(2); // weight of border
  fill(255, 0, 100); //red color for food
  //ellipseMode(CORNER)
  
  rect(food.x, food.y, scl, scl); //shape of food
}

//Movement of the snake according to the key pressed
function keyPressed() {
  if ( keyCode === UP_ARROW) {
    s.dir(0, -1);
  } else if (keyCode === DOWN_ARROW) {
    s.dir(0, 1);
  } else if (keyCode === RIGHT_ARROW) {
    s.dir(1,0);
  } else if (keyCode == LEFT_ARROW) {
    s.dir(-1, 0);
  }
}
