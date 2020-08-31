let scl = 25; //scale works as body of snake
let s;
let food;
let bg;

function setup() {
  
  createCanvas(1350, 600);
  s = new Snake();
  frameRate(10); //snake animation rate
  pickLocation(); //location of food in each frame

}

function pickLocation(){ //pick ranodm position on canvas for food

  let cols = floor( width/scl );
  let rows = floor( height/scl );
  
  food = createVector( floor(random(cols)), floor(random(rows)) ); //location for the food
  food.mult(scl); //multiply each vector element by the scale

}


function draw() {
  
  background( 189, 183, 107 );
  
  if( s.eat(food) ){
    pickLocation();
   }
   
  s.death();
  
  s.update();
  s.show();
  
  stroke(0,0,0);
  strokeWeight(1);
  fill(255, 0, 100);
  ellipseMode(CORNER); //make snake overlap food upon eating
  ellipse(food.x, food.y, scl, scl); //food visual

}

function keyPressed(){

  if( keyCode === UP_ARROW ){
    s.dir( 0, -1);
  }
  else if( keyCode === DOWN_ARROW ){
    s.dir( 0, 1);
  }
  else if( keyCode === RIGHT_ARROW ){
    s.dir( 1, 0);
  }
  else if( keyCode === LEFT_ARROW ){
    s.dir( -1, 0);
  }
  

}
