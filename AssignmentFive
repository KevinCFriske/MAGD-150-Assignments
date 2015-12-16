int u;
int d;

void setup() {
  size(1280, 800);
  background(255);
  cursor(HAND);
  //House and chimney shapes in the background
  fill(255);
  strokeWeight(3);
  beginShape();
  vertex(330, 200);
  vertex(330, 50);
  vertex(310, 50);
  vertex(310, 20);
  vertex(400, 20);
  vertex(400, 50);
  vertex(380, 50);
  vertex(380, 200);
  endShape();
  stroke(0);
  strokeWeight(3);

  beginShape();
  vertex(610, 50);
  vertex(150, 250);
  vertex(250, 750);
  vertex(970, 750);
  vertex(1070, 250);
  vertex(610, 50);
  endShape();

  // Legs
  stroke(0);
  strokeWeight(3);
  noFill();
  // Top legs
  arc(570, 365, 70, 50, -PI, 0);
  arc(650, 365, 70, 50, -PI, 0);
  // Middle legs
  arc(570, 400, 70, 50, -PI, 0);
  arc(650, 400, 70, 50, -PI, 0);
  // Bottom legs
  arc(570, 435, 70, 50, -PI, 0);
  arc(650, 435, 70, 50, -PI, 0);


  // Body
  fill(255);
  stroke(0);
  ellipseMode(CENTER);
  ellipse(610, 400, 50, 250);

  // Antennae
  noFill();
  arc(554, 279, 100, 100, radians(260), TAU); //Left antennae
  arc(666, 279, 100, 100, -PI, radians(-80)); //Right antenae
  strokeWeight(10);
  point(543, 230);
  point(674, 230);

  // Eyes
  strokeWeight(3);
  ellipseMode(CENTER);
  fill(255);
  ellipse(600, 300, 20, 20);
  ellipse(620, 300, 20, 20);

  //Wings
  stroke(0);
  beginShape(); //Left wing
  vertex(587, 345);
  vertex(440, 230);
  vertex(340, 200);
  vertex(300, 250);
  vertex(340, 300);
  vertex(360, 400);
  vertex(585, 390);
  vertex(586, 368);
  vertex(587, 345); 
  endShape();
  triangle(585, 390, 350, 435, 430, 640);

  beginShape(); //Right wing
  vertex(633, 345);
  vertex(780, 230);
  vertex(880, 200);
  vertex(920, 250);
  vertex(880, 300);
  vertex(860, 400);
  vertex(635, 390);
  vertex(634, 368);
  vertex(633, 345); 
  endShape();
  triangle(635, 390, 870, 435, 790, 640);

  pushMatrix(); //Squares and lines in the wings
  translate(360, 400);
  rotate(radians(-3));
  rect(0, 0, 80, -80);
  popMatrix();

  pushMatrix();
  translate(860, 400);
  rotate(radians(3));
  rect(0, 0, -80, -80);
  popMatrix();

  line(410, 425, 460, 590);
  line(810, 425, 760, 590);
  
  textSize(15);
  fill(0);
  text("Left click to draw.", 10,20);
  text("Press '1' for Black.", 10,40);
  text("Press '2' for White.", 10,60);
  text("Press '3' for Red.", 10,80);
  text("Press '4' for Green.", 10,100);
  text("Press '5' for Blue.", 10,120);
  text("Press '6' for Yellow.", 10,140);
  text("Press '7' for Magenta.", 10,160);
  text("Press '8' for Cyan.", 10,180);
  text("Press '9' for Orange.", 10,200);
  text("Press 'r' to refresh.", 10,220);
  text("Press 'F' to color", 10,240);
}

void draw() { 
  //Drawing colours
  if (mouseButton == LEFT) {
    line(pmouseX, pmouseY, mouseX, mouseY);
  }
  if (keyCode == '1') {
    stroke(0);
  }
  if (keyCode == '2') { 
    stroke(255);
  }
  if (keyCode == '3') {
    stroke(255, 0, 0);
  }
  if (keyCode == '4') {
    stroke(0, 255, 0);
  }
  if (keyCode == '5') {
    stroke(0, 0, 255);
  }
  if (keyCode == '6') {
    stroke(255, 255, 0);
  }
  if (keyCode == '7') {
    stroke(255, 0, 255);
  }
  if (keyCode == '8') {
    stroke(0, 255, 255);
  }
  if (keyCode == '9') {
    stroke(255, 140, 0);
  }
  if (keyCode == 'F') { //This is to color in things because it didn't look that nice just straight black and white.
    //House and chimney shapes in the background
    background(0,200,0);
    fill(169,194,185);
    strokeWeight(3);
    beginShape();
    vertex(330, 200);
    vertex(330, 50);
    vertex(310, 50);
    vertex(310, 20);
    vertex(400, 20);
    vertex(400, 50);
    vertex(380, 50);
    vertex(380, 200);
    endShape();
    stroke(0);
    strokeWeight(3);
    fill(128,140,95);
    beginShape();
    vertex(610, 50);
    vertex(150, 250);
    vertex(250, 750);
    vertex(970, 750);
    vertex(1070, 250);
    vertex(610, 50);
    endShape();

    // Legs
    stroke(0);
    strokeWeight(3);
    noFill();
    // Top legs
    arc(570, 365, 70, 50, -PI, 0);
    arc(650, 365, 70, 50, -PI, 0);
    // Middle legs
    arc(570, 400, 70, 50, -PI, 0);
    arc(650, 400, 70, 50, -PI, 0);
    // Bottom legs
    arc(570, 435, 70, 50, -PI, 0);
    arc(650, 435, 70, 50, -PI, 0);


    // Body
    fill(125,114,179);
    stroke(0);
    ellipseMode(CENTER);
    ellipse(610, 400, 50, 250);

    // Antennae
    noFill();
    arc(554, 279, 100, 100, radians(260), TAU); //Left antennae
    arc(666, 279, 100, 100, -PI, radians(-80)); //Right antenae
    strokeWeight(10);
    point(543, 230);
    point(674, 230);

    // Eyes
    strokeWeight(3);
    ellipseMode(CENTER);
    fill(255);
    ellipse(600, 300, 20, 20);
    ellipse(620, 300, 20, 20);

    //Wings
    fill(132,74,15);
    stroke(0);
    beginShape(); //Left wing
    vertex(587, 345);
    vertex(440, 230);
    vertex(340, 200);
    vertex(300, 250);
    vertex(340, 300);
    vertex(360, 400);
    vertex(585, 390);
    vertex(586, 368);
    vertex(587, 345); 
    endShape();
    triangle(585, 390, 350, 435, 430, 640);

    beginShape(); //Right wing
    vertex(633, 345);
    vertex(780, 230);
    vertex(880, 200);
    vertex(920, 250);
    vertex(880, 300);
    vertex(860, 400);
    vertex(635, 390);
    vertex(634, 368);
    vertex(633, 345); 
    endShape();
    triangle(635, 390, 870, 435, 790, 640);
    
    fill(52,185,243);
    pushMatrix(); //Squares and lines in the wings
    translate(360, 400);
    rotate(radians(-3));
    rect(0, 0, 80, -80);
    popMatrix();

    pushMatrix();
    translate(860, 400);
    rotate(radians(3));
    rect(0, 0, -80, -80);
    popMatrix();

    line(410, 425, 460, 590);
    line(810, 425, 760, 590);
    textSize(25);
    fill(0);
    text("I'm not good at coloring. Maybe you should do it yourself", mouseX, mouseY);
  }
}

void keyPressed() { //Change strokeWeight
  if (keyCode == UP) {
    u = u+5;
    strokeWeight(u);
  }
  if (keyCode == DOWN) {
    u = u-2;
    if (u < 2) {
      u=2;
    }
    strokeWeight(u);
  }
}

void keyReleased() { //Refresh the sketch
  if (key == 'r')setup();
}
