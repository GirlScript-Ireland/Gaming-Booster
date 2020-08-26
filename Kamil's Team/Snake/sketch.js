let s; //snake object
let scl = 20; //scale of snake and food
let food; //food for the snake
let width = 800; //width of the canvas
let height = 800; //height of the canvas

function setup() {
    createCanvas(width, height); //creates the canvas
    s = new Snake();    //create a new snake object called s
    frameRate(5);       //framerate of the draw function
    foodLocation();     //calls the foodLocation function
}

function foodLocation(){
    let cols = floor(width / scl); //rounds down the width / scale to an INT
    let rows = floor(height / scl); //rounds down the height / scale to an INT
    food = createVector(floor(random(cols)), floor(random(rows)));
    food.mult(scl);
}

function draw() { //draw function that draws the canvas at the framerate specified
    background(158, 199, 12); //sets the colour of the background
    if(s.eat(food)){ //check to see if the snake ate the food
        foodLocation(); //calls the foodLocation function to place another food on canvas
    }
    s.update(); //updates the snake length if it is changed through the above if statement
    s.wall();
    s.show(); //shows the snake object on the canvas
    s.death(); //check if the snake ate itself
    rect(food.x, food.y, scl, scl); //creates a rectange which is the food for the snake and puts it on the screen
}

function keyPressed() { //controls of the snake;
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