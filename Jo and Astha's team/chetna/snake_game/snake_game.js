let snake;
let food;

function setup() {
createCanvas(windowWidth,windowHeight);
snake=new Snake();
food=new Food();
}


function draw() {
background(50);
snake.show();
food.show();
snake.update();
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
