Ball  b = new Ball(40, width/2, 50,50);
ArrayList<Pipes> p = new ArrayList<Pipes>();
PImage bird;
PImage img; 
int gameState;

int score;
void setup(){
  size(800,600);
  bird = loadImage("./image/bird.png");
  img = loadImage("./image/bg.png");
  
  p.add(new Pipes());
  gameState = 0;
}

void draw(){
  /*if(){
    //gameState = 1;
    textSize(32);
    text("Click to Play", 230, 100);
    
    
  } else{*/
  
  image(img,0, 0, width, height);
  b.drop();
  b.display(bird);
  
  if(frameCount % 75 == 0){
    p.add(new Pipes());
  }
  
   for(int i = 1; i <=  p.size()-1;i++){
    Pipes pipe = p.get(i-1);
    
    pipe.update();
    
    if(pipe.hits(b)){
      pipe.display(true);
      score = 0;
    } else{
     pipe.display(false); 
     score++;
     
     textSize(64);
     text(score, width/2, 50);
     
     score = constrain(score, 0, score);
    }
    
  if(pipe.xPos + 50 < 0){
     p.remove(pipe);
    }
 }
}


void keyPressed(){
  if(key == ' '){
    b.jump();
  }
  

}
