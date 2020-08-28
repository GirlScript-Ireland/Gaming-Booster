PImage backImg =loadImage("http://i.imgur.com/cXaR0vS.png");
PImage birdImg =loadImage("http://i.imgur.com/mw0ai3K.png");
PImage wallImg =loadImage("http://i.imgur.com/4SUsUuc.png");
PImage startImg=loadImage("http://i.imgur.com/U6KEwxe.png"); //image of the start screen before we press 'start game'.
int gamestate = 1; //setting variables
int score = 0;
int highScore = 0;
float x = -200, y, vy = 0, lift = -15, gravity = 0.6;  //lift pushes the bird up, gravity pushes the bird down. vy is velocity In processing, 0 at top and height at bottom. Unconventional
float[] wx = new float[2]; //an array: storing multiple data sets under a single name, a list of items. in the array 'wx' we store the x positions of 2 walls 
float[] wy = new float[2]; //in array wy we store the y positions of 2 walls. on screen there are only 2 pipes at a single time.

void setup() { //any statements under setup are ran once
  size(600,800); //width = 600, height = 800. width and height of display window
  fill(0); //font colour is black
  textSize(40);  //font size is big
}

void draw() { //any statements under draw are ran continuously. here, 60 times a second. 
  if(gamestate == 0) {
    imageMode(CORNER);
    image(backImg, x, 0); //draw background image, its upper left corner is at (x, y=0)
    image(backImg, x+backImg.width, 0); //draw another background image to the left of the one above
    vy += gravity; 
    vy *= 0.9; //air resistance, pushes bird up because multiplying vy by a fraction, thus decreasing vy.
    y += vy; // adding vy to birds y position, making it go down
    if(x == -1800){ //moves screen back to beginning, so loop
      x = 0;
    }
    for(int i = 0 ; i < 2; i++) {
      imageMode(CENTER); //walls are centered around middle, not too long/tall
      image(wallImg, wx[i], wy[i] - (wallImg.height/2+100)); //draw pipe at two points. subtracts height 'h' from total height 'y'
      image(wallImg, wx[i], wy[i] + (wallImg.height/2+100)); //add height to lower one
     if(wx[i] < 0) { //if wall has moved past left, ie, offscreen
        wy[i] = (int)random(200,height-200); //give pipe new y position between +200 and -200 and
        wx[i] = width; //new x postiion on right of screen ie, the width of screen 
      }
      if(wx[i] == width/2) { //when the wall is in the middle of the screen (width/2), that means our bird has passed the pipe. Score increases.
        highScore = max(++score, highScore); //gets the current score and previous highscore. the higher value is the current highscore. ++ means increase score by 1
      }
      if(y>height||y<0||(abs(width/2-wx[i])<25 && abs(y-wy[i])>100)) { //if bird has gone off the screen in y directions or, distance between bird ( at position width/2) and pipe (wx) is tiny <>, 
        gamestate=1;                                                   // and vertical distance between bird and pipe is greater than 100, ie, not in vertical space between two pipes which is about 
      }                                                               //100. remember space between two pipes is 200. Then you lost - go to start screen
      wx[i] -= 6; //let's the wall move 
    }
    image(birdImg, width/2, y);
    text(""+score, width/2-15, 700); //displays a text of score
  }
  else {
    imageMode(CENTER);
    image(startImg, width/2,height/2);
    text("High Score: "+highScore, 50, width);
  } 
}
void mousePressed() {
  vy += lift; //lifts bird up
  if(gamestate==1) { //if we're on start screen put first wall at (600,height/2), then put second wall at (900,600)
    wx[0] = 600;
    wy[0] = y = height/2;
    wx[1] = 900;
    wy[1] = 600;
    x = gamestate = score = 0; //bird's position/background postition/score = 0. When gamestate is 0 the game begins. when gamestate is 1, we're on start screen
  }
}
