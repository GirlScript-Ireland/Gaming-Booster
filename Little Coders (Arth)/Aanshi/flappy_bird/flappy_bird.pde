//Declaring the variables
PImage background, kirby, bottomPipe, topPipe;
int backgroundX,backgroundY;
int kirbyX,kirbyY;
int[] pipeX,pipeY;
int gravity,velocity;
int gameState;

//the setup function for setting the game
void setup(){
  //the size of the output screen
  size(800,620);//800 ->620
  
  //loading the images
  background = loadImage("D:/Aanshi/AANSHI PATWARI-2020/girlscript ireland gaming booster/Flappy Bird Game Project/Assets/bg.png");
  kirby = loadImage("D:/Aanshi/AANSHI PATWARI-2020/girlscript ireland gaming booster/Flappy Bird Game Project/Assets/flappy.png");
  bottomPipe = loadImage("D:/Aanshi/AANSHI PATWARI-2020/girlscript ireland gaming booster/Flappy Bird Game Project/Assets/botPipe.png");
  topPipe = loadImage("D:/Aanshi/AANSHI PATWARI-2020/girlscript ireland gaming booster/Flappy Bird Game Project/Assets/topPipe.png");
  
  //assigning the values
  kirbyX=100;
  kirbyY=50;
  gravity=1;
  pipeX=new int[5];
  pipeY=new int[5];
  
  for(int i=0;i<5;i++){
    pipeX[i] = 800 + (200*i); 
    pipeY[i] = (int)random(-250,0);
  }
  
  gameState=-1;
}

//draw function for calling the other functions
void draw(){
  if(gameState==-1){
    startScreen();
  }else if(gameState==0){
    setBackground();
    setPipes();
    setKirby();
  }else{
    endScreen();
    restart();
  }
}

//the function called at the starting of the game
void startScreen(){
  image(background,0,0);
  textSize(40);
  text("Welcome to the Flappy Bird Game !! ",40,100);
  text("Click anywhere to begin ",40,200);
  if(mousePressed){
    kirbyY=height/2;
    gameState=0;
  }
}

//the function called when the game gets over
void endScreen(){
  fill(150,150,250,100);
  if(mouseX>90 && mouseX<595 && mouseY>150 && mouseY<290){
    fill(150,250,150,100);
  }
  rect(90, 150, 505, 140, 5);
  fill(0);
  textSize(40);
  text("Kirby died :-(",200,200);
  text("Click HERE to play again." , 100, 270);  

}

//the function for setting the background of the game
void setBackground(){
  image(background,backgroundX,backgroundY);
  image(background,backgroundX + background.width,backgroundY);
  
  backgroundX--;
  if(backgroundX < background.width){
    backgroundX = 0;
  }
}

//the function for displaying the top and the bottom pipes in the game
void setPipes(){
  for(int i=0;i<5;i++){
    image(topPipe,pipeX[i],pipeY[i]);
    image(bottomPipe,pipeX[i],pipeY[i]+680);
    
    pipeX[i]-=2;
    if(pipeX[i]<-200){
      pipeX[i]=width;
    }
    if(kirbyX>(pipeX[i]-35) && kirbyX<pipeX[i]+92){
      if(kirbyY<pipeY[i]+250 || kirbyY>(pipeY[i]+680)){
        fill(255,0,0,200);
        textSize(24);
        rect(20,height-223,455,32);
        fill(0);
        text("hit",20,height-200);
        gameState=1;
      }
    }
  }
}

//the function for displaying the kirby
void setKirby(){
  image(kirby,kirbyX,kirbyY);
  kirbyY=kirbyY+velocity;
  velocity=velocity+gravity;
  if(kirbyY>height || kirbyY<0){
    fill(255,0,0,140);
    textSize(24);
    text("Kirby fell down",20,44);
    gameState=1;
  }
}

//the function called when the game restarts
void restart(){
  if(mouseX>90 && mouseX<595 && mouseY>150 && mouseY<290){
    if(mousePressed){
      kirbyY=height/2;
      for(int i=0;i<5;i++){
        pipeX[i]=width+ (200*i);
        pipeY[i]=(int)random(-250,0);
      }
      gameState=0;
    }
  }
}

//the function for moving the kirby with the help of mouse
void mousePressed(){  
  velocity=-15;       //making the velocity negative ensures kirby go up
}
