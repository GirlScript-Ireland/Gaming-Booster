let snake;
let rez=10;//for scaling canvas to 40X40
let food;
let w;//width
let h;//height

//Snake position as an array 
function setup() {
  createCanvas(400, 400);
  frameRate(10);//for controlling speed
  snake = new Snake();
  
  food = createVector();
  w = floor(width/rez);//scaling width
  h = floor(height/rez);//scaling height
  foodLocation();
  
}

//whenever a key is pressed
function keyPressed(){
  if(keyCode === LEFT_ARROW){
    snake.setDir(-1,0);
  }else if(keyCode === RIGHT_ARROW){
    snake.setDir(1,0);
  }else if(keyCode === DOWN_ARROW){
    snake.setDir(0,1);
  }else if(keyCode === UP_ARROW){
    snake.setDir(0,-1);
  }
}

function foodLocation(){
  let x = floor(random(w));
  let y = floor(random(h));
  food = createVector(x,y);
}

function draw() {
  scale(rez);//scale down the whole game
  background(220);
  if(snake.eat(food)){
    foodLocation();
  }
  snake.update();
  snake.show();
  
  if(snake.endGame()){
    print("End game");
    background(255,0,0);
    noLoop();
  }
  
  fill(255,0,0);
  noStroke();
  rect(food.x,food.y,1,1);
}