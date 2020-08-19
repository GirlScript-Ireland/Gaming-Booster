class Ball{
float xPos;
float yPos = height/2;
float len, wid;
float speed = 0.1;
float force = 0.5;  //Gravity - positive direction
float jumpForce = -15;  //Negative direction


Ball(float x, float y, float len, float wid){
  xPos = x;
  yPos = y;
  this.len = len;
  this.wid = wid;

} 

void display(PImage img){
  image(img, xPos, yPos, len, wid);
  //ellipse(60, yPos, len, wid);
}

void drop(){
  speed += force;
  speed *= 0.9;
  yPos += speed;
  
    
  if(yPos > height){
     yPos = height;
     speed = 0;
  }
  
  if(yPos < 0){
    yPos = 0;
    speed= 0;
  }
}

void jump(){
  speed += jumpForce;
}
}
