let scl=25;
let s;
let food;
let bg;

function setup() {
  bg = loadImage('back.png');
createCanvas(800,500);

s=new Snake();
frameRate(6);
pickLocation();
}
function pickLocation(){
let cols=floor(width/scl);
let rows=floor(height/scl);
food=createVector(floor(random(cols)),floor(random(rows)));
food.mult(scl);

}

function draw() {
// background(19,225,76);
background(bg);
 if(s.eat(food)){
 pickLocation();
 }
  s.death(); 
  s.update();
  s.show();
  stroke(0,0,0);
  strokeWeight(1);
  fill(255,9,7);
  ellipseMode(CORNER);
  ellipse(food.x,food.y,scl,scl);
}
function keyPressed(){
  if(keyCode===UP_ARROW){
    s.dir(0,-1);    
  }
  else if(keyCode===DOWN_ARROW){
    s.dir(0,1);}
    else if(keyCode===RIGHT_ARROW){
    s.dir(1,0);}
    else if(keyCode===LEFT_ARROW){
    s.dir(-1,0);}
}
