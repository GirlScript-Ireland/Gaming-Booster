function Bird(){
  
    this.x = 68;
    this.y = height/2;
    this.gravity = 0.6; 
    this.velocity = 0;
    this.lift = -15;
    
    this.show = function() {
      fill(255);
      ellipse(this.x, this.y, 16, 16);
    }
    
    this.update = function(){
      this.velocity += this.gravity; 
      this.velocity = this.velocity * 0.9; //This is air resistance
      this.y += this.velocity;
      
      if(this.y > height){
        this.velocity = 0; 
        this.y = height;
      }
      
      if(this.y < 0){
        this.velocity = 0; 
        this.y = 0;
      }
      
    }
    
      this.up = function(){
      this.velocity += this.lift;
      
    }
    
  }