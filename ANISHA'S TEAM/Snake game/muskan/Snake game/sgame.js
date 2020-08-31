let bg;
let s; 
let scl = 30; 
let food;
let score=0;
//let img;

function setup() {
  bg = loadImage('background.png'); //Load the background
  //img=loadImage('bird.png');
  createCanvas(1200, 700); // Create canvas according to the window
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
  //add the background
  //image(bg,0,0);
 
  //background(117,187,28);
  background(bg);
  
  
  if (s.eat(food)) {
    pickLocation();
    //score=score+1;
  }
  else if (s.death()){
    score=0;
  }
  s.death();
  s.update(); //update the length of the snake if food is got
  s.show(); //show the snake
  stroke(0,0,0); //add border
  strokeWeight(2); // weight of border
  fill(227, 19, 9); //red color for food
  //ellipseMode(CORNER)
  //image(img,food.x,food.y,scl,scl);
  rect(food.x, food.y, scl, scl,5); //shape of food
  
  
   fill(255,255,255); //color of the text displaying the score
    textSize(60); //size of the text 
    textAlign(CENTER);
    text(score, 600, 50); //display the score
    
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
