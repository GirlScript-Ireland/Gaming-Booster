let snake;
let rez = 20;
let food; 
let w;
let h;

function setup() {
  createCanvas(400, 400);
  snake = new Snake();
  frameRate(5);
  // The usage of let varibale
  // var x = 2; 
  // {
  //   let x = 10; 
  // }
  // print(x);
  w = floor(width/ rez); 
  h = floor(height/rez);
  foodLocation()
  
}

function foodLocation(){
  let x = floor(random(w));
  let y = floor(random(h));
  food = createVector(x, y);
}



function keyPressed(){
  if (keyCode == LEFT_ARROW){
    snake.setDir(-1, 0);
  }
  else if (keyCode == RIGHT_ARROW){
    snake.setDir(1, 0);
  }
  else if (keyCode == DOWN_ARROW){
    snake.setDir(0, 1);
  }
  else if (keyCode == UP_ARROW){
    snake.setDir(0, -1);
  }
}


function draw() {
  background(220);
  if (snake.eat(food)){
    foodLocation();
  }
  scale(rez);
  snake.update();
  snake.show();
  
  fill(0, 0, 255);
  rect(food.x, food.y, 1, 1);
}