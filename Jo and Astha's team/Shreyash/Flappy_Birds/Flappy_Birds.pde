PImage bg,go;
drogo player;
ArrayList<Logs> log = new ArrayList<Logs>();
power pow_1;
boolean flag=true;

int bgx;
boolean ch=true,inv=true,power=false,t=false;
int score=0,total_s=0;
void setup(){
   size(720,405,P2D);
   bg = loadImage("./Image/bg.png");
   player = new drogo();
   log.add(new Logs());
   pow_1=new power();
   frameRate(60);
   
}

void draw(){
  
  //String menu = "Press Space To Start";
  //PFont z= createFont("impact",50);
  //textFont(z);
  //fill(#FF1212);
  //text(menu,150,150);
  //if(keyPressed&&key==' ')
  //{
  //  t=true;
  //}
  if(ch)
  {
    //if(t)
    //{
      back(); 
    player.display();
    player.canvas();
    player.gravity();
   
    String sc="Your Score- ";
     text(sc,850,50);
     
    for(int i=0;i<log.size();i++){
       log.get(i).display();
       
       if(inv)
       {
         if(!log.get(i).overlap(player)){
           log.clear();
           ch=false;
         }
         else if(log.get(i).check()&&flag)
         {
           flag=false;
           if(score<22)
               {
                 score++;
                 total_s++;
               }
         }
       }
       else
       {
         total_s++;
         if((frameCount/60)%15==1)
         {
           inv=true;
         }
         score=0;
       }
       
     }
     
    pow_1.display(score);
      PFont f = createFont("impact",20);
      String s = "Your Score- "+total_s;
      textFont(f);
      fill(0);
      text(s,600,20);
<<<<<<< HEAD
    if(score==22)
    {
      power=true;
    }
    if(power){
=======
      
    if(score>=22){
>>>>>>> b157c01fadaed6a42a026eaa2cf4a1a1268d2f57
      PFont end = createFont("impact",30);
      String ss = "Press B To Activate Invincibility for 15 secs";
      fill(0);
      textFont(end);
      text(ss,80,350);
      if(keyPressed&&key=='b')
      {
        inv=false;
        score=0;
        power=false;
      }
    }
  
  }
  else
  {
    go = loadImage("./image/go.jpg");
    go.resize(720,405);
    image(go,0,0);
      PFont end = createFont("impact",30);
      String ends = "Your Score was- "+total_s+". Press Space to Restart.";
      fill(0);
      textFont(end);
      text(ends,120,350);
    if(keyPressed&&key==' ')
    {
      ch=true;
      score=0;
      total_s=0;
    }
  }
  
  
  if(frameCount%100==0&&ch)
  {       
    log.add(new Logs());
    flag=true;
  }
  
  if(log.size()>6){
    log.remove(0);
  }
  if(keyPressed&&key==' ')
  {
      player.assend();
  }
  
    
 
}

void back(){
  
  image(bg,bgx,0); //Background
  image(bg,bgx+bg.width,0);
  bgx=bgx-1;
  if(bgx==-bg.width)
  {
    bgx=0;
  }
  
}