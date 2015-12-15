int rectX, rectY;
int rectWidth = 200;
int rectHeight = 80;
color rectColor;
color bestColor;
int goAway = 255;
int cantSeeMe = 2000;
float x;
/*
String a = "Click Here";
String b = "  ▲▲ ▲";
*/
boolean rectOver = false;
/*
//if you have the minim library, you can un-grey this and the other sound related lines (lines 32-36 and line 149)
//minim can be installed under sketch -> import library -> add library -> search minim
//allows the easiest way I could find in a short time to add sound
import ddf.minim.*;
Minim minim;
AudioPlayer player;
*/
PImage img;
PImage img2;

void setup(){
  size(1280,800);
  rectX = 1000;
  rectY = 700;
  rectColor = color(130,130,255);
  bestColor = color(0);
  //Loads the images
  img = loadImage("original.png");
  img2 = loadImage("https://cloud.githubusercontent.com/assets/14241981/11817682/a5889c6c-a31b-11e5-9cff-893e562d52ae.jpg");
  /*
  //Loads sound file
  minim = new Minim(this);
  player = minim.loadFile("AND HIS NAME IS JOHN CENA [MLG EDITION].mp3");
 */
}

void draw(){
  update(mouseX, mouseY);
  background(rectColor);
  textSize(40);
  fill(255,goAway);
  
  //White shape in the sketch
  noStroke();
  fill(255,goAway);
  rect(0, height/2-150, width/4, height/2);
  triangle(width/4, height/2-150, width/4, height-150, width*.7, height-150);
  rect(0, height-150, width*.7, 150);
  
  //Slippery Slope text
  pushMatrix();
  translate(width/2, height/2);
  rotate(radians(34.7));
  textSize(60);
  text("SLIPPERY SLOPE", -220, 50);
  popMatrix();
  
  //Sunday date box and fill
  fill(230, 230, 230,goAway);
  stroke(255, 255, 255,goAway);
  strokeWeight(6);
  rect(60, 30, 160, 40);
  fill(#080617,goAway);
  rect(60, 70, 160, 160);
  fill(0,goAway);
  textSize(28);
  text("Sunday", 87, 60);
  
  //Background image in the Sunday date box
  //Stars
  stroke(255,goAway);
  strokeWeight(5);
  point(70, 100);
  point(97, 87);
  point(86, 117);
  point(124, 83);
  point(137, 109);
  point(173, 82);
  point(170, 130);
  point(207, 140);
  point(195, 160);
  point(151, 151);
  point(163, 160);
  point(198, 177);
  point(198, 177);
  point(152, 188);
  point(78, 181);
  noStroke();
  //Ground
  rect(63, 195, 152, 30);
  //Building
  rect(85, 195, 60, -50);
  triangle(79, 145, 151, 145, 115, 115);
  //Moon
  ellipseMode(CENTER);
  fill(#CBCBCB,goAway);
  ellipse(190, 110, 40, 40);
  fill(#080617,goAway);
  ellipse(175, 110, 40, 40);
  
  //Button and text inside of the button
  fill(0,goAway);
  stroke(255,goAway);
  strokeWeight(3);
  rect(rectX,rectY,rectWidth,rectHeight);
  if (rectOver) {
    fill(255,goAway);
    text("▲",1083, 735);
    text("▲ ▲",1065, 765);
    cursor(HAND);
  }else{
    fill(255,goAway);
    text("Click Here",1030,750);
    cursor(ARROW);
    
  }
  //Pushes the 2 images off screen
  pushMatrix();
  translate(cantSeeMe,cantSeeMe);
  image(img2,0,0);
  image(img,0,0);
  popMatrix();
  
  //Subliminal messaging
  String s = "YVAN EHT NIOJ YVAN EHT NIOJ YVAN EHT NIOJ";
  fill(0, 0, 0, 10);
  textSize(170);
  text(s, 20, 20, width-20, height-20);
}

//Tells if the mouse is over the button or not
void update(int x,int y){
  if (overRect(rectX,rectY,rectWidth,rectHeight)){
    rectOver = true;
  }else{
    rectOver = false;
  }
}

//What happens when the button is pressed
void mousePressed(){
  if (rectOver) {
    rectColor = bestColor;
    goAway = 0;
    cantSeeMe = 0;
    /*
    player.play();  
    */
  }
}

//Designates where the button "barriers" are
boolean overRect(int x, int y, int width, int height){
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
        return true;
      }else {
        return false;
      }
}
