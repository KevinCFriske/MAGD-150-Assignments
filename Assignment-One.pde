//Main Tab

//turkey_wide_eyed_T.png
//indian-boy-and-pilgrim-boy.png
//wheat-field-wallpaper-24058-24720-hd-wallpapers.jpg

PImage background;
int red;
int s;
int v;
String[] wut;


Turkey newTurkey;
Pilgrim myPilgrim;
Timer myTimer;

void setup() {
  size(800, 600);
  background = loadImage("https://cloud.githubusercontent.com/assets/14241981/11695382/717a9f8e-9e74-11e5-8aed-ac3e0fe76044.jpg");
  newTurkey = new Turkey();
  myPilgrim = new Pilgrim();
  myTimer = new Timer(100);
  wut = new String[5];
  wut[0] = "Really...?";
  wut[1] = "I have to stand next to him?";
  wut[2] = "I can't stand him";
  wut[3] = "Help me...";
  wut[4] = "Please.....";
}

void draw() { 
  myTimer.timerStart();
  image(background, 0, 0, 800, 600);
  noStroke();
  fill(200, 0, 0, red);

  for (int x = 0; x < 10; x++) {
    newTurkey.drawTurkey();
  }
  myPilgrim.drawPilgrim();
  if (myTimer.isFinished()) {
    if (millis() >= 3000) {
      s = 0;
    }
    if (millis() >= 4000) {
      s = 1;
    }
    if (millis() >= 6000) {
      s = 2;
    }
    if (millis() >= 8000) {
      s = 3;
    }
    if (millis() >= 10000) {
      s = 4;
    }
    if (red <= 180) {
      red = red + 5;
    }
    x = round(random(-5, 5));
    y = round(random(-5, 5));
    if (z <= 600) {
      z = z + 20;
    }
  }
  rect(0, 0, width, height);
  textSize(50);
  fill(255);
  text("" +wut[s]+ "", 20, 100);
}

//Pilgrim Tab

PImage pilgrim;
int x, y, z;

class Pilgrim {


  Pilgrim() {
    pilgrim = loadImage("https://cloud.githubusercontent.com/assets/14241981/11695309/196dc28a-9e74-11e5-9f97-1d809c1b4e13.png");
  }

  void drawPilgrim() {
 
    image(pilgrim, 200 - x, 100 - y, 400 + z,400 + z);
  }
}

//Timer Tab

class Timer{
  float startTime, stopTime; // two variables to keep track of the time that the timer starts and length of time for the timer.
   boolean started = false;  // keep track of the timer, where it's been started on not. 
  
  //constructor. This sets the amount of the time to lapse before it sets the boolean below to true. 
  // an example use would be 
  // Timer myTimer = new Timer(2000);    <---- that sets the timer to 2 seconds.
  Timer(float _stopTime){
    stopTime = _stopTime;
  }
  
  // you can call this anyway (inside the Setup which would start almost immediately or inside the draw loop, which would make 
  // it restart ever cycle.
  void timerStart(){
    startTime = millis();
    started = true;
  }
  
  void stopTimer(){
    started = false;
    println("time stopped");
  }
  
  // place this in your draw() loop to cheen the time has lapse.
  // an example block of code might be:
  //   if (myTimer.isFinished(){
  //      text("EXPLOSION!", 100, 100);
  //    }
  boolean isFinished(){
    float passedTime = millis() - startTime;
    if((passedTime > stopTime) && (started)) {
      return true;
    } else {
      return false;
    }
  }
}

//Turkey Tab

PImage turkey;
int a, b;

class Turkey {

  Turkey() {
    turkey = loadImage("https://cloud.githubusercontent.com/assets/14241981/11695355/54e1bfc4-9e74-11e5-9967-2391b138bff0.png");
  }

  void drawTurkey() {
    image(turkey, round(random(width)), round(random(height)), 100, 100);
  }
}
