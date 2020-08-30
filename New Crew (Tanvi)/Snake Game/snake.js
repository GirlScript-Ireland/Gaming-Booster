// Daniel Shiffman
// http://codingtra.in
// http://patreon.com/codingtrain
// Code for: https://youtu.be/AaGK-fj-BAM

//this operator refers to the owner object, in our case it will be s i.e snake
function Snake() {
  this.x = width/2; //position along x
  this.y = width/2; //positon along y
  this.xspeed = 0; //speed 
  this.yspeed = 0;
  this.total = 0; //total length initally
  this.head = [50, 50, 50, 50]
  this.tail = []; //array of the tail

  //function to check if snake ate the food
  this.eat = function(pos) { //if eaten at that position
    let d = dist(this.x, this.y, pos.x, pos.y); //then find the distance between them
    if (d < 1) { //if the distance is less than 1
      this.total++; //increase the size of the snake by 1
      return true; //and return true that it has eaten the food
    } else {
      return false; //else return false
    }
  };

  //direction of the snake 
  this.dir = function(x, y) {
    this.xspeed = x;
    this.yspeed = y;
  };

  this.death = function() {
    for (let i = 0; i < this.tail.length; i++) {
      let pos = this.tail[i];
      let d = dist(this.x, this.y, pos.x, pos.y);
      if (d < 1) {
        console.log('starting over');
        this.total = 0;
        this.tail = [];
    
    if (navigator.vibrate) { 
      window.navigator.vibrate(200); 
    }
      }
    }
  };

  //updating the length and speed of the snake across the axes
  this.update = function() {
    for (let i = 0; i < this.tail.length - 1; i++) {
      this.tail[i] = this.tail[i + 1];
    }
    if (this.total >= 1) {
      this.tail[this.total - 1] = createVector(this.x, this.y);
    }

    this.x = this.x + this.xspeed * scl;
    this.y = this.y + this.yspeed * scl;

    this.x = constrain(this.x,0,width-scl);
    this.y = constrain(this.y,0,width-scl)
  };

  //showing the snake on the screen + filling with color etc
  this.show = function() {
    stroke(0, 0, 0);
    strokeWeight(1.5);
    fill(210);
    for (let i = 0; i < this.tail.length; i++) {
      rect(this.tail[i].x, this.tail[i].y, scl, scl, 2, 2, 2, 2);
    }
    fill(255);
    rect(this.x, this.y, scl, scl, this.head[0], this.head[1], this.head[2], this.head[3]);
    if(this.xspeed===1){ // RIGHT
      ellipse(this.x+(3*(scl/5)), this.y+(scl/3), 2, 2);
      line(this.x + scl/2, this.y + (6*(scl/10)), this.x + scl, this.y + (7*(scl/10)));
      // triangle(this.x-(this.tail.length*scl), this.y, this.x-(this.tail.length*scl), this.y+scl, this.x-((this.tail.length+1)*scl), this.y+(scl/2));
    }
    else if(this.xspeed===-1){ // LEFT
      ellipse(this.x+(2*(scl/5)), this.y+(scl/3), 2, 2);
      line(this.x, this.y + (7*(scl/10)), this.x + scl/2, this.y + (6*(scl/10)));
      // triangle(this.x+scl+(this.tail.length*scl), this.y, this.x+scl+(this.tail.length*scl), this.y+scl, this.x+((this.tail.length+2)*scl), this.y+(scl/2));
    }
    else if(this.yspeed===-1){ // UP
      ellipse(this.x+(scl/3), this.y+(2*(scl/5)), 2, 2);
      line(this.x + (7*(scl/10)), this.y, this.x + (6*(scl/10)), this.y + scl/2);
      // triangle(this.x, this.y+scl+(this.tail.length*scl), this.x+scl, this.y+scl+(this.tail.length*scl), this.x+(scl/2), this.y+((this.tail.length+2)*scl));
    }
    else if (this.yspeed === 1) { // DOWN
      ellipse(this.x+(scl/3), this.y+(3*(scl/5)), 2, 2);
      line(this.x + (6*(scl/10)), this.y + scl/2, this.x + (7*(scl/10)), this.y + scl);
      // triangle(this.x, this.y - (this.tail.length * scl), this.x+scl, this.y - (this.tail.length * scl), this.x + (scl / 2), this.y - ((this.tail.length + 1) * scl));
    }
  };
}