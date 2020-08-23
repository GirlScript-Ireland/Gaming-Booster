let s; //snake
let scl = 20; //scale of snake and food
let food; //food for the snake


function setup() {
    createCanvas(800, 800);
    s = new Snake();
    frameRate(5);
}

function draw() {
    background(158, 199, 12);
    
    s.update();
    s.show();
}

function keyPressed() {
    if(keyCode === UP_ARROW) {
        s.dir(0, -1);
    } else if(keyCode === DOWN_ARROW){
        s.dir(0, 1);
    } else if(keyCode === RIGHT_ARROW){
        s.dir(1, 0);
    } else if(keyCode === LEFT_ARROW){
        s.dir(-1, 0);
    }
}