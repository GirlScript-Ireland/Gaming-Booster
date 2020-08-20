//Delcare Global Variables
var s;                  // Snake Variable
var scl = 20;           // Size of the square (scale)
var food;               // Food Variable
playfield = 600;
var frate = 10;         // Frame rate

// p5js Setup function - required

function setup() {
  createCanvas(playfield, 640);   // Create a canvas
  background(51);                 // Background -> function provided by p5.js
  s = new Snake();
  frameRate(frate);               // Set Frame Rate -> p5.js                  
  pickLocation();                 // Function to randomly place food on the canvas
}

// p5js Draw function - required

function draw() {
  background(51);
  scoreboard();             // Scoreboard Constructor called
  if (s.eat(food)) {
    pickLocation();         // When snake eats the food, place food randomly again on the canvas
  }
  s.death();
  s.update();
  s.show();
  fill(255, 0, 100);
  rect(food.x, food.y, scl, scl);
}

// Pick a location for food to appear

function pickLocation() {
  var cols = floor(playfield / scl);
  var rows = floor(playfield / scl);
  food = createVector(floor(random(cols)), floor(random(rows)));
  food.mult(scl);

  // Check the food isn't appearing inside the tail
  for (var i = 0; i < s.tail.length; i++) {
    var pos = s.tail[i];
    var d = dist(food.x, food.y, pos.x, pos.y);
    if (d < 1) {
      pickLocation();
    }
  }
}


// scoreboard

function scoreboard() {
  fill(0);
  rect(0, 600, 600, 40);
  fill(255);
  textFont("Georgia");
  textSize(18);
  text("Score: ", 10, 625);
  text("Highscore: ", 450, 625)
  text(s.score, 70, 625);
  text(s.highscore, 540, 625)
}

// CONTROLS function

function keyPressed() {
  if (keyCode === UP_ARROW) {
    s.dir(0, -1);
  } else if (keyCode === DOWN_ARROW) {
    s.dir(0, 1);
  } else if (keyCode === RIGHT_ARROW) {
    s.dir(1, 0);
  } else if (keyCode === LEFT_ARROW) {
    s.dir(-1, 0);
  }
}

// SNAKE OBJECT

function Snake() {
  this.x = 0;             // Displacement X
  this.y = 0;             // Displacement Y
  this.xspeed = 0.001;    // Speed in X direction
  this.yspeed = 0;        // If moving in x, wont move in y and vice versa
  this.total = 0;         // Total Score
  this.tail = [];         // Length of the tail
  this.score = 1;         // Score of the snake
  this.highscore = 1;     // Highest score which is stored in memory

  this.dir = function (x, y) {
    this.xspeed = x;
    this.yspeed = y;
  }

  this.eat = function (pos) {
    var d = dist(this.x, this.y, pos.x, pos.y);   // Distance Function - Given to us by p5.js (https://p5js.org/reference/#/p5/dist)
    if (d < 1) {
      this.total++;
      this.score++;
      text(this.score, 70, 625);                  // Display score to the canvas
      if (this.score > this.highscore) {          // Update highscore if score > highscore
        this.highscore = this.score;
      }
      text(this.highscore, 540, 625);             // Display score to the canvas
      return true;
    } else {
      return false;
    }
  }

  this.death = function () {
    for (var i = 0; i < this.tail.length; i++) {
      var pos = this.tail[i];
      var d = dist(this.x, this.y, pos.x, pos.y);
      if (d < 1) {
        this.total = 0;
        this.score = 0;
        this.tail = [];
      }
    }
  }

  this.update = function () {
    if (this.total === this.tail.length) {
      for (var i = 0; i < this.tail.length - 1; i++) {
        this.tail[i] = this.tail[i + 1];
      }

    }
    this.tail[this.total - 1] = createVector(this.x, this.y);

    this.x = this.x + this.xspeed * scl;
    this.y = this.y + this.yspeed * scl;

    this.x = constrain(this.x, 0, playfield - scl);
    this.y = constrain(this.y, 0, playfield - scl);


  }
  this.show = function () {
    fill(255);
    for (var i = 0; i < this.tail.length; i++) {
      rect(this.tail[i].x, this.tail[i].y, scl, scl);
    }

    rect(this.x, this.y, scl, scl);
  }
}
