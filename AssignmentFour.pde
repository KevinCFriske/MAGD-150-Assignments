int carX = 500;
int carY;
int carSpeed = 5;
int carStart;
int score = 0;
int scoreAdd = 1;
int numberOfDarkWindows = 200;
int middleNumberOfDarkWindows = 35;
int rightNumberOfDarkWindows = 150;
int ufoX = 500;
int time = millis();
int randomTime;
int laserX;
int laserY = 180;
int laserSpeed = 10;
float charSpeed = 10;
float charX = 100;
float charY = 640;
float charWidth = 30;
float charHeight = 60;
float gravity = 1.5;
float velocity = 1.0;
float charJumpSize = -15;
boolean lightsOff = false;
boolean onGround = true;
boolean dead = false;
boolean laserShot = false;
//boolean addPoint = false;
boolean rectOver = false;
boolean carMove = false;
boolean loadDumb = false;
DarkenWindow[] darkenWindows, darkenWindows1, darkenWindows2; //Array DarkenWindow

//Makes a new class DarkenWindow and lets it know int x, y
class DarkenWindow {
  int x, y;

  // Contructor
  DarkenWindow(int xPos, int yPos) {
    x = xPos;
    y = yPos;
  }

  // Custom method for drawing the windows
  void display() {
    fill(0);
    rect(x+10, y+10, 10, 20);
  }
  void display1() {
    rect(x-6, y+10, 10, 20);
  }
  void display2() {
    rect(x+8, y+10, 10, 20);
  }
}

void setup() {
  size(1000, 800);
  // Creates the array size
  darkenWindows = new DarkenWindow[numberOfDarkWindows]; //array for the left building
  darkenWindows1 = new DarkenWindow[middleNumberOfDarkWindows]; //array for the middle building
  darkenWindows2 = new DarkenWindow[rightNumberOfDarkWindows]; //array for the right building
}

void draw() {
  if (loadDumb == false) {
    randomTime = round(random(10, 500))*100;
    background1();

    fill(255);
    textSize(20);
    text("Score: "+score, 10, 30);


    building1();
    building2();
    building3();
    setWindows();
    setDarkWindows();
    // foreach loop
    for (DarkenWindow darkenWindow : darkenWindows) {
      darkenWindow.display(); //tells processing for darkenWindows display darkenWindow
    }
    for (DarkenWindow darkenWindow : darkenWindows1) {
      darkenWindow.display1(); //same as above except for darkenWindows1
    }
    for (DarkenWindow darkenWindow : darkenWindows2) {
      darkenWindow.display2();
    }

    car(); 
    foreground();
    character();
    lampLights();

    if (millis() >= time + randomTime) {
      laserShot = true;
      time = millis();
      laserX = ufoX;
      laserY = 180;
    }

    ufo();
    update();
    laserUpdate(charX, charY);

    if (rectOver == true) {
      charX = 500;
      score = 0;
    }

    //text("time: "+millis()/1000+":) "+randomTime, 10, 10);

    //Lets me hide things easier
    fill(#33342D);
    rect(0, 700, width, height);
  }
  if ( mousePressed && loadDumb == false) {
    loadDumb = true;
    newThing();
    textSize(80);
    fill(255);
    text("(﻿ ͡° ͜ʖ ͡°)", random(10, width-10), random(10, height-10));
    noCursor();
  }
  if (keyPressed && loadDumb == true) {
    loadDumb = false;
  }
}

void background1() {
  background(4, 4, 1); //Background color
  for (int p = 0; p < 110; p = p + 5) { //Draws the gradient of rectangles in the background
    noStroke();
    fill(109-p, 109-p, 106-p);
    rect(0, 700-(p*4), width, 100);
  }
}

void building1() { //Right building
  fill(0);
  rect(0, 210, 230, height);
}

void building2() { //Middle building
  fill(0);
  rect(484, 240, 110, height);
}

void building3() { //Right building
  rect(618, 240, 72, height);
  rect(690, 198, 238, height);
  rect(736, 120, 157, height);

  fill(255, 20); //Two gray rectangles in the right building
  rect(700, 208, 218, 10);
  rect(700, 228, 218, 10);
}

void car() {
  if (carX >= -30) {
    carX = carX - carSpeed;
  } else {
    carY = round(random(300, 500));
    carX = 1030;
  }
  fill(255, 150);
  ellipse(carX+15, carY+100, 20, 10);
  fill(255, 0, 0);
  rect(carX, carY+100, 30, 10, 5);
}

void setWindows() {
  for (int window = 0; window < 600; window = window +30) { //Creates the number of verticle windows
    fill(#F0EE5E);
    for (int q = 0; q < 220; q=q+20) { //Creates the number of horizontal windows
      rect(10+q, 220+window, 10, 20); //Window size and placement
    }
  }
  for (int middleWindowsVert = 0; middleWindowsVert < 560; middleWindowsVert = middleWindowsVert + 30) { //Creates the number of verticle windows
    for ( int middleWindowsHorz = 0; middleWindowsHorz < 100; middleWindowsHorz = middleWindowsHorz + 20) { //Creates the number of horizontal windows
      rect(494+middleWindowsHorz, 250+middleWindowsVert, 10, 20); //Window size and placement
    }
  }
  for (int rightWindowVert = 0; rightWindowVert < 590; rightWindowVert = rightWindowVert + 30) { //Creates the number of verticle windows
    for (int rightWindowHorz = 0; rightWindowHorz < 300; rightWindowHorz = rightWindowHorz + 20) { //Creates the number of horizontal windows
      rect(628+rightWindowHorz, 250+rightWindowVert, 10, 20); //Window size and placement
    }
  }
}

void setDarkWindows() {
  for (int v = 0; v < numberOfDarkWindows; v = v + 1) { //Creates the amount of DarkWindows for the left building
    if (lightsOff == false) { //Checks to see if lightsOff == false
      int windowX = round(random(1, 21))*10; //Creates a random number for the x position for the DarkWindows
      int windowY = round(random(7.333, 26.666))*30; //Creates a random number for the y position for the DarkWindows
      darkenWindows[v] = new DarkenWindow(windowX, windowY); //Tells the array darkenWindows how many numbers to pull and which numbers to use
    }
  }
  for (int a = 0; a < middleNumberOfDarkWindows; a = a + 1) {
    if (lightsOff == false) {
      int middleWindowX = round(random(24.7, 28.7))*20;
      int middleWindowY = round(random(8.3, 25.933))*30;
      darkenWindows1[a] = new DarkenWindow(middleWindowX, middleWindowY);
    }
  }
  for (int b = 0; b < rightNumberOfDarkWindows; b = b + 1) {
    if (lightsOff == false) {
      int rightWindowX = round(random(31.4, 45.4))*20;
      int rightWindowY = round(random(8.3, 25.933))*30;
      darkenWindows2[b] = new DarkenWindow(rightWindowX, rightWindowY);
    }
  }
  lightsOff = true; //Sets lightsOff to true
}

void foreground() { //Creates the ground and lampposts that is infront of the buildings
  fill(#484841);
  rect(0, 675, width, height);
  fill(#33342D);
  rect(0, 700, width, height);
  for (int numberOfLamps = 0; numberOfLamps < 800; numberOfLamps = numberOfLamps + 200) { //Used to create the four lamps
    fill(#62656C);
    rect(200+numberOfLamps, 700, 16, -250);
    rect(206+numberOfLamps, 450, 4, -10);
    rect(195+numberOfLamps, 440, 26, -10);
  }
}

void character() { //Creates the blue rectangle character that you can control
  fill(#2A47B7);
  rect(charX, charY, charWidth, charHeight);
  if (charX >= 970) { //Stops the character from moving off screen on the right
    charX = 970;
  } else if (charX <= 0) { //Stops the character from moving off screen on the left
    charX = 0;
  }
}

void lampLights() { //Creates the lights and the beams of light coming down from the lampposts
  for (int numberOfLamps = 0; numberOfLamps < 800; numberOfLamps = numberOfLamps + 200) { //Same as the lampposts  
    fill(#AF952C);
    arc(208+numberOfLamps, 440, 24, 8, 0, PI); //This is the lightbulbs on the lamps
    fill(#AF952C, 50);
    beginShape(); //This is the beam of light coming down
    vertex(196+numberOfLamps, 440);
    vertex(140+numberOfLamps, 700);
    vertex(276+numberOfLamps, 700);
    vertex(220+numberOfLamps, 440);
    endShape(CLOSE);
  }
}

void keyPressed() { 
  if (keyCode == RIGHT) { //Checks to see if RIGHT on the arrow keys has been pressed
    charX = charX + charSpeed; //If it has it moves the character to the right
  } else if (keyCode == LEFT) { //Checks to see if LEFT on the arrow keys has been pressed
    charX = charX - charSpeed; //If it has it moves the character to the left
  }
  if (onGround == true && keyCode == UP) { //Checks to see if onGround == true and if UP on the arrow keys has been pressed
    jump(); //If both of those are true then it runs jump()
  }
}

void ufo() {
  int ufoSpeed = round(random(-20, 20));
  ufoX = ufoX + ufoSpeed;
  shootLaser();
  fill(#DEE0E5);
  ellipse(ufoX, 200, 300, 40);
  fill(#DEE0E5, 70);
  ellipse(ufoX, 180, 100, 80);
  if (ufoX >= 850) {
    ufoX = 850;
  } else if (ufoX <= 150) {
    ufoX = 150;
  }
}

void update() { //This "pulls" the character down and makes sure the character doesn't fall through the ground
  velocity = gravity + velocity;
  charY = velocity + charY;
  if (charY >= 640) {
    charY = 640;
    onGround = true;
  } else {
    onGround = false; //Also tells processing that if the character isn't at a y value of 700 that onGround = false
  }
  // if (addPoint == true) { 
  //  score = score + 1;
  //  addPoint = false;
  // }
}

void jump() { //Jumps the character up according to the jump size
  velocity = charJumpSize;
}

void shootLaser() {
  if (laserShot == true) {
    laserY = laserY + laserSpeed;
  }
  fill(255, 0, 0);
  rect(laserX-10, laserY, 10, 40);
  if (laserY >=701) {
    laserShot = false;
  }
  if (laserY == 700) {
    score = score + scoreAdd;
  }
}

void laserUpdate(float x, float y) {
  if (overRect(charX, charY, charWidth, charHeight)) {
    rectOver = true;
  } else {
    rectOver = false;
  }
}

boolean overRect(float x, float y, float charWidth, float charHeight) {
  if (laserX >= charX && laserX <= charX+charWidth && 
    laserY >= charY && laserY <= charY+charHeight) {
    return true;
  } else {
    return false;
  }
}

void newThing() {
  fill(0);
  rect(0, 0, width, height);
  String lol = "Dank Memes";
  for (int y = 0; y < 900; y = y + 280) {
    for (int x = 0; x < 1200; x = x + 30) {
      fill(0, 255, 0);
      text(lol, 10+x, 10+y, 20, 300);
    }
  }
}
