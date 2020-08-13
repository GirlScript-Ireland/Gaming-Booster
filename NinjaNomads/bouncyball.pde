float xPos = 300;
float yPos = 250;

float xSpeed = 5;
float ySpeed = 5;

void setup(){
  size(800,600);
}


void draw(){
  ellipse(xPos,yPos,50,50);
  xPos += xSpeed;
  yPos += ySpeed;
  
  if(xPos > width || xPos < 0){
     xSpeed *= -1  ;
   }
   
   if(yPos > height || yPos < 0){
     ySpeed *= -1;
   }
   
   
}
