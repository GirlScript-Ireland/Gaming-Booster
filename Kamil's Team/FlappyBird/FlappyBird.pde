PImage backImg;
float imageMove = -200;
PVector gravity = new PVector(0, 0.5);
boolean gamestate = false;
int score = 0;
int highscore = 0;
int wid = 400;
int hei = 800;
int pipeSize;
ArrayList<Pipe> pipes = new ArrayList<Pipe>();
Bird bird;
void setup() {
    backImg = loadImage("grass.png");
    size(400, 800);
    textSize(32);
    bird = new Bird();
}

void draw() {
    if(gamestate == false) {
        imageMode(CORNER);
        image(backImg, imageMove, 0);
        image(backImg, imageMove+backImg.width, 0);
        imageMove -= 0.5;
        if(imageMove == -400) imageMove = 0;
        textSize(64);
        fill(255, 255, 255);
        text("Click to play", 200, 400);
        textAlign(CENTER);
        
        if(score != 0){
          fill(255, 255, 255);
          text(score, 200, 100);
          textAlign(CENTER);
          if(highscore != 0){
            textSize(32);
            fill(255, 255, 255);
            text("Highscore: " + highscore, 200, 600);
            textAlign(CENTER);
          }
          if (highscore <= score){
            highscore = score;
            textSize(32);
            fill(255, 255, 255);
            text("Highscore: " + highscore, 200, 600);
            textAlign(CENTER);
          }
        }
        
        if(mousePressed){
            bird = new Bird();
            gamestate = true;
            score = 0;
            textSize(64);
            pipes = new ArrayList<Pipe>();
        }
    }else{
        imageMode(CORNER);
        image(backImg, imageMove, 0);
        image(backImg, imageMove+backImg.width, 0);
        imageMove -= 0.5;
        if(imageMove == -400) imageMove = 0;
        bird.update();
        bird.show();
        fill(255, 255, 255);
        text(score, 200, 100);
        textAlign(CENTER);
        
        if(frameCount % 60 == 0) {
          pipes.add(new Pipe());
          score++;
        }
        if(mousePressed){
            PVector up = new PVector(0, -5);
            bird.applyforce(up);
        }
        for (int i = pipes.size() - 1; i>=0; i--) {
          Pipe p = pipes.get(i);
          p.update();         
          p.show();
          
          if(p.hits(bird)) { 
            gamestate = false;
          }
        }
    }
}
