class Bird
{
  PVector vel;
  PVector acc;
  PVector pos;
  int r = 20;
 Bird(){
  pos = new PVector(50,height/2); 
  vel = new PVector(0,0);
  acc = new PVector(0,0.5);
 }
 void up(){
   vel.add(0,-5);
   vel.limit(4);
 }
 void update(){
   pos.add(vel);
   vel.add(acc);
   if (pos.y > height) // If the bird tends to escape our screen
    {
      pos.y = height; // Stop it at the edge
      vel.mult(0); // Make the velocity zero
    }
 }
 void show() {
    stroke(0,0,0); // Color of the outline of our bird object (Black)
    strokeWeight(2); // Thickness of the outline 
    fill(224, 218, 34); // Color of the interior of our bird object
    ellipse(pos.x, pos.y, 20, 20); //Shape of the bird object
  }
  
}
  
  
  
