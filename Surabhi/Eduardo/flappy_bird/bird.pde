class Bird
{
  // --------------Data members of our Bird Class -----------
 PVector pos;
 PVector vel;
 PVector acc;
 float r = 16;
 //-----------------Functions of our Bird Class -------------
 // Constructor to Initialize our Bird object
 Bird(){
   pos = new PVector(50, height/2); // Initial position on width 50 and height in the middle
   vel = new PVector(0,0); // Initial velocity of the bird of 0
   acc = new PVector(); // Initial acceleration of the bird
 }
 
 void applyForce(PVector force)
 {
   acc.add(force); // Increment the acceleration by the force
 }
 
 void update()
 {
   //For every frame
   applyForce(gravity); // The bird object is acted upon the gravity
   pos.add(vel); // The position of the bird is incremented
   vel.add(acc); // The velocity of the bird is incremented
   vel.limit(4); // The maximum speed of the bird is given
   acc.mult(0);
   
   if(pos.y > height) // If the bird tends to escape our canvas it stays 
   {
     pos.y = height; // Stop it at the edge
     vel.mult(0); // MAke the velocity zero
   }
 }
 
 void show(){
   stroke(0,0,0); // Color of the outline of our bird object
   strokeWeight(2); // Thickness of the outline
   fill(224,218,34); // Color of the interior of our bird object
   ellipse(pos.x, pos.y, r*2, r*2); // Shape of our bird object
 }
 
 
 
}
