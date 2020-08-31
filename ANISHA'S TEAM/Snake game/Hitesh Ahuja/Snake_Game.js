let bg; //background
let s; //snake
let scl = 25; //scale of the objects - snake and food
let food; //food for the snake
let score = 0;
let fd;
function setup() {
  bg = loadImage('img.jpg'); //load the background, always remember to add it into the sketch first
  fd = loadImage("FOOD.png");
  createCanvas(1200 , 600); //create canvas according to the browser window size
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


function draw() {
  background(bg); //add the background
  if (s.eat(food)) { //if snake eats the food, food needs to relocate
  score = score + 10;
    pickLocation(); //call the pickLocation function to relocate the food
  }
  
  s.death(); 
  s.update(); //update the length of the snake if food is eaten
  s.show(); //show the snake
  stroke(0,0,0); //add border
  strokeWeight(2); //weight of border
  fill(255, 0, 100); //red color for food
  ellipseMode(CORNER); 
  image(fd,food.x, food.y);   //shape of food
  fill(255,255,255);
  textSize(40);
  textAlign(CENTER);
  text(score , width-80,50);
  score = constrain(score , 0 , score);
  
  fill(255,255,255);
  textSize(40);
  textAlign(CENTER);
  text("Score" , width - 160 ,50);
  
  
  fill(255,255,255);
  textSize(20);
  textAlign(CENTER);
  text("Made by Hitesh Ahuja" , 400 ,50);  
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
