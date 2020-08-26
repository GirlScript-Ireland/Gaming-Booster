function Snake() {
    this.x = 0; //sets the position of the snakes x
    this.y = 0; //sets the position of the snakes y
    this.xspeed = 1; //sets the speed of the snake
    this.yspeed = 0;
    this.total = 0; //total of food eaten
    this.tail = []; //array of the tail for the snake
    
    this.dir = function (x, y){ //function that changes the direction of the snake
        this.xspeed = x;
        this.yspeed = y;
    };
    
    this.death = function() { //checks to see if the snake eats itself
        for(let i = 0; i < this.tail.length; i++){
            let pos = this.tail[i]; //sets pos to the value of the snakes tail
            let d = dist(this.x, this.y, pos.x, pos.y); // sets d to the distance to between the snake and it's tail
            if(d < 1){ //if the distance is lower than 1
                this.total = 0; //set the total to 0
                this.tail = []; //set snakes tail array to empty array.
                console.log("im hit!!! oops its me"); //just a console log to check
            }
        }
    }
    
    this.eat = function(food){ //function that checks if the food is eaten
        let d = dist(this.x, this.y, food.x, food.y); //sets d to the distance between snake and food
        if(d < 1){ //if distance is less than 1
            this.total++; //increment the total by 1
            return true; //return true
        }
        return false; //else false
    }
    
    this.wall = function() {
        for(let i = 0; i <= 800; i+=20){
            let dtop = dist(this.x, this.y, i, 0);
            let dbottom = dist(this.x, this.y, i, 780);
            let dleft = dist(this.x, this.y, 0, i);
            let dright = dist(this.x, this.y, 780, i);
            if(dtop < 1 || dbottom < 1 || dleft < 1 || dright < 1){
                console.log("hit the wall");
            }
        }
    }
    
    this.update = function() { //update function
        for(let i = 0; i < this.tail.length - 1; i++){
            this.tail[i] = this.tail[i + 1]; //updates the tail value 
        }
        if(this.total >= 1){
            this.tail[this.total - 1] = createVector(this.x, this.y); //allows the tail to follow the snakes head
        }
        
        this.x = this.x + this.xspeed * scl; //sets the speed of the snake on the x axis
        this.y = this.y + this.yspeed * scl; //sets the speed of the snake on the y axis
        
        this.x = constrain(this.x, 0 , width - scl); //sets the snakes x value to the constrain of the arguments
        this.y = constrain(this.y, 0, height - scl); //sets the snakes y value to the constrain of the arguments
    };
    
    this.show = function() {
        fill(27, 33, 3); //colour of the snake
        for(let i = 0; i < this.tail.length; i++){
            rect(this.tail[i].x, this.tail[i].y, scl, scl);//displays the snake on the canvas
        }
        rect(this.x, this.y, scl, scl); //displays the snake on the canvas if the snake has only a head.
    };
}