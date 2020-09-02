let bg;
let scl=20;
let fR = 8;
let food;
let highscore = 0;

function setup() {
  // replaced hard coded values with relative values
  // so that canvas fill fill whole window without overflowing
  createCanvas(windowWidth, windowHeight);
  scl = width/20;
  bg = loadImage("Background.png");
  buttons = loadImage("buttons.png");
  s = new Snake();
  frameRate(fR);
  pickLocation();
}

// to make canvas fill the window when window is resized

//function windowResized() {
 // resizeCanvas(windowHeight, windowHeight); 
//}

function highScore() {
  if(highscore<s.tail.length)
  {
    highscore=s.tail.length;
  }
  return highscore;
}

function pickLocation() {
  let rows = random(floor(width/scl));
  let cols = random(floor(width/scl));
  food = createVector(floor(rows), floor(cols));
  food.mult(scl);
}

function mousePressed(){
  if(mouseX>=((width/2)-50) && mouseX<=((width/2)+50))
  {
    if(mouseY>=(height-300) && mouseY<=(height-200))
    {
      s.dir(0,-1);
      s.head = [50, 50, 0, 0];
      if (navigator.vibrate) { 
        window.navigator.vibrate(35); 
      } 
    }
    else if (mouseY>=(height-100) && mouseY<=(height-0))
    {
      s.dir(0, 1);
      s.head = [0, 0, 50, 50];
      if (navigator.vibrate) { 
        window.navigator.vibrate(35); 
      }
    }
    else if (mouseY>=(height-200) && mouseY<=(height-100)) // pauses the game
    {
      s.dir(0, 0);
      s.head = [50, 50, 50, 50];
      if (navigator.vibrate) { 
        window.navigator.vibrate(50); 
      }
    }
  }
  else if(mouseY>=(height-200) && mouseY<=(height-100))
  {
    if(mouseX>=((width/2)-150) && mouseX<=((width/2)-50))
    {
      s.head = [50, 0, 0, 50];
      s.dir(-1,0);
      if (navigator.vibrate) { 
        window.navigator.vibrate(35); 
      }
    }
    else if(mouseX>=((width/2)+50) && mouseX<=((width/2)+150))
    {
      s.head = [0, 50, 50, 0];
      s.dir(1,0);
      if (navigator.vibrate) { 
        window.navigator.vibrate(35); 
      }
    }
  }
}

function pad(n, width, z) {
  z = z || '0';
  n = n + '';
  return n.length >= width ? n : new Array(width - n.length + 1).join(z) + n;
}

function draw() {
  background (0, 0, 0);
  image(bg, 0, 0, windowWidth, windowWidth);
  fill(255)
  // rect((width/2)-152, height-332, 304, 304);
  image(buttons, (width/2)-150, height-330, 300, 300);
  if(s.eat(food)){
    pickLocation();
    if (navigator.vibrate) { 
      window.navigator.vibrate(40); 
    }
  }
  s.death();
  s.update();
  s.show();
  stroke(255)
  line(0, width, width, width);
  line(0, width+45, width, width+45);
  // shows the score
  textSize(28);
  text("Score: "+pad(s.tail.length, 3), 10, width+32);
  text("High Score: "+pad(highScore(), 3), 200, width+32);
  fill(0, 102, 153);
  // food display properties
  stroke(0, 0, 0);
  strokeWeight(1.5);
  fill(244, 5, 40, 220);
  rect(food.x, food.y, scl, scl, 90, 90, 90, 90);
}