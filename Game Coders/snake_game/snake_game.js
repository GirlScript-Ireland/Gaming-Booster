let bg;
let scl=40;
function setup() {
  createCanvas(1420,772);
  bg = loadImage("Background.png");
  s=new Snake();
}


function draw() {
  background(bg);
  s.show();

}
