let s; //snake
let scl = 40; //scale of objects - snake and food
let food; // food for the snake

function setup() {
  bg = loadImage('snake.jpg');
  createCanvas(1365, 615);
  s = new Snake();
  frameRate(7);
  pickLocation();
}

function pickLocation() {
  let cols = floor(width/scl);
  let rows = floor(height/scl);
  food = createVector(floor(random(cols)), floor(random(rows)));
  food.mult(scl);
}

function draw() {
  
  background(bg);
  
  if(s.eat(food)) {
    pickLocation();
  }
  
  s.death();
  s.update();
  s.show();
  
    stroke(0,0,0);
    stroke(2);
    fill(255, 0, 100);
    //rect(food.x, food.y, scl, scl);
    ellipse(food.x+scl/2, food.y+scl/2, scl, scl);
}

function keyPressed() {
  if(keyCode === UP_ARROW){
    s.dir(0, -1);
  }
  else if(keyCode === DOWN_ARROW){
    s.dir(0, 1);
  }
  else if(keyCode === RIGHT_ARROW){
    s.dir(1, 0);
  }
  else if(keyCode === LEFT_ARROW){
    s.dir(-1, 0);
  }
}
