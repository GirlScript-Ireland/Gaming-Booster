let snake; //snake 
let food; //food
let scl=20;
let count=100;
function setup() {
createCanvas(windowWidth,windowHeight);
snake=new Snake(); //initialize snake object
food=new Food(); //initialize food
frameRate(7); //running eachsecond on screen i.e snake movement
}


function draw() {
background(100);
if(snake.eat(food))
{ 
  food.update();
}
if( snake.death() || count<100)
{
  textSize(40);
  fill(255,0,300);
  text('starting over!!',10,60);
  count++;

  
}
snake.show(); //show snake on screen
food.show();
snake.update(); //update snake on screen
}
function keyPressed(){
  if(keyCode === UP_ARROW)
  {
    snake.changeDirection(0,-1);
  }
  else if(keyCode === DOWN_ARROW)
{
      snake.changeDirection(0,1);

}

 else if(keyCode === RIGHT_ARROW)
{
      snake.changeDirection(1,0);

}
 else if(keyCode === LEFT_ARROW)
{
      snake.changeDirection(-1,0);

}


}