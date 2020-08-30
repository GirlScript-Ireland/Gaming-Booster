// Daniel Shiffman
// http://codingtra.in
// http://patreon.com/codingtrain
// Code for: https://youtu.be/AaGK-fj-BAM

let bg; //background
let s; //snake
let scl = 40; //scale of the objects - snake and food
let food; //food for the snake

function setup() {
  bg = loadImage('Background.png'); //load the background, always remember to add it into the sketch first
  createCanvas(1440, 772); //create canvas according to the browser window size
  s = new Snake();  //initialize the snake object
  frameRate(7); //choose a frame rate for the snake animation
  pickLocation(); //pick the location of the food in each frame
}

function pickLocation() {
  let cols = floor(width / scl); //calculates the floor of width/scale - floor calculates the closest int less than or equal to the passed param
  let rows = floor(height / scl);
  food = createVector(floor(random(cols)), floor(random(rows))); //create the location for the food
  food.mult(scl); //multiplying each element of the vector by the scale.
} 

//function mousePressed() {
//  s.total++; //increase the size of the snake each time mouse is pressed //idk why?
//}

function draw() {
  background(bg); //add the background
  if (s.eat(food)) { //if snake eats the food, food needs to relocate
    pickLocation(); //call the pickLocation function to relocate the food
  }
  s.death(); 
  s.update(); //update the length of the snake if food is eaten
  s.show(); //show the snake
  stroke(0,0,0); //add border
  strokeWeight(2); //weight of border
  fill(255, 0, 100); //red color for food
  //ellipseMode(CORNER); 
  rect(food.x, food.y, scl, scl);  //shape of food
  
}
//Movement of the snake according to the key pressed
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
