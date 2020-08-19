class Pipes{
  float wid;
  float xPos;
  float topLen, bottomLen;
  
  Pipes(){
    xPos = width;
    topLen = random(height/2);
    bottomLen = random(height/2);
    
  }

  
  void update(){
    xPos -= 3;
  }
  
  void display(boolean hit){
    if(hit){
      fill(255,0,0);
    } else{
      fill(255);
    }
    rect(xPos, 0, 60, topLen);
    rect(xPos, height, 60, -bottomLen);
  }
  
  boolean hits(Ball b) {
    if ((b.xPos > xPos) && (b.xPos < (xPos + 50))) {
      if ((b.yPos < (topLen )) || (b.yPos > (height - bottomLen))) {
        return true;
      }
    }
    return false;
  }

}
