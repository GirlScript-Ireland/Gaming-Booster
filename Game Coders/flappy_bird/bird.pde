class Bird {

  PVector pos;
  PVector acc;
  PVector vel;  

  float r=16;  

  Bird() 
  {
    pos = new PVector(50, height/2);
    vel = new PVector(0, 0);
    acc = new PVector();
  }

  void applyForce(PVector force) 
  {
    acc.add(force);
  }



  void update() 
  {
    applyForce(gravity);
    pos.add(vel); // in order to update  pos wrt velocity
    if (pos.y >=height)
    {
      pos.y=height;
      vel.mult(0);
    }
    vel.add(acc); //in order to update the vel as per acc
    vel.limit(4); // in order to cap the vel for a smooth run
    acc.mult(0);
  }
  void show()
  {
    //fill(255, 0, 34);
    //stroke(0, 0, 0);
    //strokeWeight(2);
    //ellipse(pos.x, pos.y, r*2, r*2);
    image(bird, pos.x, pos.y, r*2, r*2);
  }
}
