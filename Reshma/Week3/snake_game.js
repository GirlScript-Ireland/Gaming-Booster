// first canvas and a snake object. - checked
// give animation to the snake object and arrow functions 
// Food - random locations
// Eat the food and increase in size.  Give a different location for the food.
// Death of the snake  - It hits its own tail / hits the borders 
let bg;
let s;
let food;

function setup() {
s = new Snake();
bg = loadImage('Background.png');
createCanvas(1440,780);
frameRate(10);
pickLocation();
}

function pickLocation(){
  let cols = floor(width/20);
  let rows = floor(height/20);
  food = createVector(floor(random(cols)), floor(random(rows)));
  food.mult(20);
}



function keyPressed(){
  if(keyCode === UP_ARROW){
    s.dir(0,-1);
  }
    if(keyCode === DOWN_ARROW){
    s.dir(0,1);
  }
    if(keyCode === LEFT_ARROW){
    s.dir(-1,0);
  }
    if(keyCode === RIGHT_ARROW){
    s.dir(1,0);
  }
  
}

function draw() {
  background(bg);
  if(s.eats(food)){
    pickLocation();
  }
  s.death();
  s.update();
  s.show();
  
  fill(0,0,255);
  rect(food.x,food.y,20,20);
 // background(0);

}
