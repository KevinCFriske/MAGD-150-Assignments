// Initializes my classes
Platforms myPlatforms;
Player newPlayer;
IO io;
TitleScreen myTitleScreen;
LevelOne myLevelOne;
LevelTwo myLevelTwo;
Enemy myEnemies;
Gun newGun;
Boss newBoss;
Timer myTimer;

// global
int level, playerTotal, numberOfEnemies, playerHealth;
float velocityX, velocityY, speed, gravity, jumpSize, s;
boolean collisionTop;
boolean collisionBottom;
boolean collisionLeft;
boolean collisionRight;
boolean gunFired;
int [] total;

//ArrayList <Bullet> bullets = new ArrayList <Bullet> ();
//PVector player, playerSpeed;
//float maxSpeed = 3;


void setup() {
  // set global variables
  gravity = 10;
  jumpSize = -15;
  speed = 3;
  velocityX = speed;
  velocityY = gravity;
  s = 0;
  level = 0;
  playerTotal = 0;
  playerHealth = 5;
  total = new int[58];
  numberOfEnemies = 10;

  // set screen size
  size(1080, 720);

  // instantiate classes
  io = new IO();
  newPlayer = new Player();
  myTitleScreen = new TitleScreen();
  myLevelOne = new LevelOne();
  myLevelTwo = new LevelTwo();
  myEnemies = new Enemy();
  newGun = new Gun();
  newBoss = new Boss();
  myTimer = new Timer(3000);
}

void draw() {
  background(0);

  // displays the title screen
  if (level == 0) {
    background(0);
    myTitleScreen.displayTitleScreen();
    myTitleScreen.update(mouseX, mouseY);
  }

  // displays the first level
  if (level == 1) {
    myLevelOne.clouds();
    myLevelOne.layers();
    myLevelOne.foreground();

    // instantiate plateform class
    // needs to be in the draw section
    myPlatforms = new Platforms();

    // activate player
    newPlayer.display();
    newPlayer.keepFalling();
    newPlayer.movePlayer(io.keyCommands());

    // draw platforms
    for (int p = 0; p <= myPlatforms.platforms.length - 43; p++) {
      fill(#49AA45);
      myPlatforms.displayPlatform(p);
    }

    for (int e = 0; e < numberOfEnemies - 1; e++) {
      myEnemies.displayEnemy(e);
    }

    if (newPlayer.playerX >= 1040 && newPlayer.playerY <= 15) {
      level = level + 1;
      s = 0;
      newPlayer.playerX = 20;
      newPlayer.playerY = 20;
    }
     if (playerHealth <= 0) {
      fill(0);
      rect(0, 0, width, height);
      fill(255);
      text("You Lose", width/2 - 50, height/2);
    }
  }
  if (level == 2) {
    myTimer.startTimer();
    myLevelTwo.displayBackground(); 
    // instantiate plateform class
    // needs to be in the draw section
    myPlatforms = new Platforms();

    // activate player
    newPlayer.display();
    newPlayer.keepFalling();
    newPlayer.movePlayer(io.keyCommands());

    // draw platforms
    for (int p = 16; p <= myPlatforms.platforms.length - 1; p++) {
      fill(#3B3B3B);
      myPlatforms.displayPlatform(p);
    }

    newGun.drawGun();

    if (newPlayer.playerY >= height + 40) {
      newPlayer.playerX = 20;
      newPlayer.playerY = 20;
      s = 0;
    }

    newBoss.drawBoss();

    newBoss.bossMove();
    newBoss.bossShoot();

    if (newBoss.collision) {
      playerHealth -= 1;
    }

    if (newBoss.bossHealth <= 0) {
      fill(0);
      rect(0, 0, width, height);
      fill(255);
      text("You Win", width/2 - 50, height/2);
    }
   
  }
  fill(0);
  text("Jetpack: " +newPlayer.jumpBoost%101+ "%", 10, 680);
  text("Health " +playerHealth, 10, 700);
}


void keyPressed() {
  io.keyPressed();
}

void keyReleased() {
  io.keyReleased();
}

void mousePressed() {

  // checks to see if we are on the title screen 
  if (level == 0) {
    // if the mouse is over the button and is pressed changes to level 1 
    if (myTitleScreen.buttonOver) {
      level = level + 1;
    }
  }
}

//Boss tab

class Boss {
  float bossX, bossY, bossXOffset, bossYOffset, laserX, laserY, laserXOffset, laserYOffset, bossHealth;
  boolean canJump, laserFired, collision;

  Boss() {
    bossX = 2000;
    bossXOffset = 140;
    bossYOffset = 280;
    laserXOffset = 100;
    laserYOffset = 60;
    bossHealth = 200;
  }

  void drawBoss() {

    fill(255, 0, 0);
    rect(bossX + s, bossY, bossXOffset, bossYOffset);

    collisionDetected();
    
    text("Boss Health: " +bossHealth, 1900 + s, 550);
  }

  void bossMove() {
    if (myTimer.timeFinished()) {
      if (!laserFired) {
        laserFired = true;
      }
    }
    if (canJump) {
      bossY = bossY - 3;
    }
    if (bossY <= 50) {
      canJump = false;
    }
    if (!canJump) {
      bossY = bossY + 3;
    }
    if (bossY >= 125) {
      canJump = true;
    }
  }

  void bossShoot() {
    if (laserFired) {
      laserX = (bossX + s) - 100;
      laserY = bossY + 240;
      laserFired = false;
    } else {
      laserX = laserX - 10;
    }

    fill(255, 0, 0);
    rectMode(CENTER);
    rect(laserX, laserY, laserXOffset, laserYOffset);
    rectMode(CORNER);
    if (newBoss.collision) {
      println("true");
    } else {
      println("false");
    }
  }

  void collisionDetected() {
    if (newGun.bulletX + s >= -150) {
      if (newGun.bulletY <= bossY + bossYOffset) {
        collision = true;
        bossHealth -= 2;
      }
    } else {
      collision = false;
    }
  }
}

//Enemy tab

class Enemy {
  int[] platformPatrol, enemyVelocity;
  int xOffset, yOffset, enemyW, enemyH, enemySpeed;
  float[] enemyX, enemyY, platformW, locationX;
  float  eX, eXOffset, eY, eYOffset;
  boolean collisionDetected;
  boolean[] changeDirection;

  Enemy() {
    enemyX = new float[numberOfEnemies];
    enemyY = new float[numberOfEnemies];
    platformW = new float[numberOfEnemies];
    locationX = new float[numberOfEnemies];
    enemyVelocity = new int[numberOfEnemies];
    platformPatrol = new int[numberOfEnemies];
    changeDirection = new boolean[numberOfEnemies];

    enemyW = 20;
    enemyH = 60;
    enemySpeed = 1;

    for (int e = 0; e <= numberOfEnemies - 1; e++) {
      platformPatrol[e] = round(random(1, 16));

      locationX[e] = 0;
      enemyVelocity[e] = enemySpeed;
      changeDirection[e] = false;
    }


    collisionDetected = false;
  }

  void displayEnemy(int e) {
    noStroke();
    fill(255, 0, 0);

    enemyX[e] = myPlatforms.platforms[platformPatrol[e]][0];
    enemyY[e] = myPlatforms.platforms[platformPatrol[e]][1] - enemyH;
    platformW[e] = myPlatforms.platforms[platformPatrol[e]][2];

    rect(enemyX[e] + locationX[e] + s, enemyY[e], enemyW, enemyH);

    patrolPlatform(e);

    checkForCapture(e);
  }

  void patrolPlatform(int e) {
    if (!changeDirection[e]) {
      if (locationX[e] >= platformW[e] - enemyW) {
        changeDirection[e] = true;
      }
      locationX[e] += enemyVelocity[e];
    } else {
      if (locationX[e] <= 0) {
        changeDirection[e] = false;
      }
      locationX[e] += -enemyVelocity[e];
    }
  }

  void checkForCapture(int e) {

    // check to see if the player rect intersects the platform rect
    collisionDetected = rangeIntersect(newPlayer.playerX, newPlayer.playerX + newPlayer.playerXOffset, enemyX[e] + locationX[e] + s, enemyX[e] + locationX[e] + s + enemyW) &&
      rangeIntersect(newPlayer.playerY, newPlayer.playerY + newPlayer.playerYOffset, enemyY[e], enemyY[e] + enemyH);

    // if collision deduct 10 points and set player back to begining
    if (collisionDetected) {
      playerTotal -= 10;
      newPlayer.playerX = 20;      
      newPlayer.playerY = 0;
      s = 0;
      playerHealth -= 1;
    }
  }  

  // checks to see if two rectangles are intersecting
  boolean rangeIntersect(float min0, float max0, float min1, float max1) {
    return Math.max(min0, max0) >= Math.min(min1, max1) && 
      Math.min(min0, max0) <= Math.max(min1, max1);
  }
}

//Gun tab

class Gun {
  float bulletX, bulletY, bulletOffset;
  boolean gunFired;

  Gun() {
    bulletOffset = 5;
    bulletY = 730;
  }


  void drawGun() {
    if (gunFired) {
      bulletX = newPlayer.playerX + newPlayer.playerXOffset;
      bulletY = newPlayer.playerY + 15;
      gunFired = false;
    } else {
      bulletX = bulletX + 10;
      if (bulletX >= 1080) {
       bulletX = -15; 
       bulletY = 780;
      }
    }

    fill(255, 255, 0);
    rect(bulletX, bulletY, bulletOffset, bulletOffset);
  }
}

 //IO tab
 
 class IO {
  boolean [] keys;

  IO() {
    keys = new boolean [4];
  };

  boolean [] keyCommands() {
    return keys;
  }

  void keyPressed() {
    if (key == 'w') {      
      keys[0] = true;
      newPlayer.jetPack = true;
    } 
    if (key == 's') {
      keys[1] = true;
    }
    if (key == 'a') {
      keys[2] = true;
      newPlayer.isPlayerLeft = true;
    }
    if (key == 'd') {
      keys[3] = true;
      newPlayer.isPlayerLeft = false;
    }
  }

  void keyReleased() { 
    if (key == 'w') {
      keys[0] = false;
      newPlayer.jetPack = false;
    } 
    if (key == 's') {
      keys[1] = false;
    }
    if (key == 'a') {
      keys[2] = false;
    }
    if (key == 'd') {
      keys[3] = false;
    }
  }
}

//Level one tab

class LevelOne {
  float b, m, f;
  float cloudX, cloudX1, cloudX2, cloudX3, cloudX4, cloudX5;
  PImage clouds1, clouds2, clouds3;

  LevelOne() {
    
    //clouds1 = loadImage("Clouds1.png");
    //clouds2 = loadImage("Clouds2.png");
    clouds3 = loadImage("Clouds3.png");
    
    //cloudX1 = 2160;
    //cloudX3 = 2160;
    cloudX5 = 2160;
  }

  void clouds() {
    background(#4AA9F5);
    
    // clouds that I'm not using because processing can't handle so many images
    //if (cloudX >= -2160) {
    //  cloudX = cloudX - .25;
    //} else {
    //  cloudX = 2160;
    //}
    //if (cloudX1 >= -2160) {
    //  cloudX1 = cloudX1 - .25;
    //} else {
    //  cloudX1 = 2160;
    //}
    //image(clouds1, cloudX, 0);
    //image(clouds1, cloudX1, 0);
    
    //if (cloudX2 >= -2160) {
    // cloudX2 = cloudX2 - .5;
    //} else {
    // cloudX2 = 2160;
    //}
    //if (cloudX3 >= -2160) {
    // cloudX3 = cloudX3 - .5;
    //} else {
    // cloudX3 = 2160;
    //}
    //image(clouds2, cloudX2, 0);
    //image(clouds2, cloudX3, 0);
    
    // clouds I am using
    if (cloudX4 >= -2160) {
      cloudX4 = cloudX4 - 1;
    } else {
      cloudX4 = 2160;
    }
    if (cloudX5 >= -2160) {
      cloudX5 = cloudX5 - 1;
    } else {
      cloudX5 = 2160;
    }
    image(clouds3, cloudX4, 0);
    image(clouds3, cloudX5, 0);
  }

  void layers() {
    b = s/8;
    m = s/4;
    f = s/2;

    // dark gray mountains
    fill(#7C7C7C);
    triangle(b, 620, b + 104, 384 - 100, b + 208, 620);
    triangle(b + 157, 620, b + 283, 195 - 100, b + 409, 620);
    triangle(b + 369, 620, b + 500, 347 - 100, b + 632, 620);
    triangle(b + 539, 620, b + 680, 293 - 100, b + 822, 620);
    triangle(b + 762, 620, b + 815, 356 - 100, b + 868, 620);
    triangle(b + 816, 620, b + 945, 239 - 100, b + 1075, 620);
    triangle(b + 343, 620, b + 415, 433 - 100, b + 491, 620);
    triangle(b + 903, 620, b + 1073, 275 - 100, b + 1243, 620);

    // gray mountains
    fill(#8A8A8B);
    triangle(b + 96, 620, b + 217, 327 - 100, b + 339, 620);
    triangle(b + 287, 620, b + 376, 460 - 100, b + 465, 620);
    triangle(b + 443, 620, b + 567, 299 - 100, b + 692, 620);
    triangle(b + 722, 620, b + 859, 420 - 100, b + 997, 620);
    triangle(b + 947, 620, b + 1042, 342 - 100, b + 1110, 620);
    triangle(b + 645, 620, b + 733, 403 - 100, b + 821, 620);
    triangle(b + -45, 620, b + 34, 406 - 100, b + 113, 620);
    triangle(b + 1020, 620, b + 1297, 201 - 100, b + 1313, 620);

    // light gray mountains
    fill(#959595);
    triangle(b + 40, 620, b + 136, 437 - 100, b + 232, 620);
    triangle(b + 206, 620, b + 312, 305 - 100, b + 419, 620);
    triangle(b + 560, 620, b + 659, 430 - 100, b + 758, 620);
    triangle(b + 729, 620, b + 792, 490 - 100, b + 855, 620);
    triangle(b + 909, 620, b + 982, 300 - 100, b + 1056, 620);
    triangle(b + 316, 620, b + 456, 481 - 100, b + 596, 620);
    triangle(b + -45, 620, b + 33, 546 - 100, b + 111, 620);

    // dark green hills
    fill(#649562);
    ellipse(b + 280, 590, 900, 200);
    ellipse(b + 1010, 650, 900, 300);

    // trees in the background
    for (int x = 0; x <= 250; x = x + 50) {
      fill(#436742);
      triangle((b + 10) + x, 510 - (x/10), (b + 25) + x, 440 - (x/10), (b + 40) + x, 510 - (x/10));
      fill(#6A5941);
      rect((b + 20) + x, 510 - (x/10), 10, 10);
    }

    for (int x = 0; x <= 250; x = x + 50) {
      fill(#436742);
      triangle((b + 310) + x, 485 + (x/10), (b + 325) + x, 415 + (x/10), (b + 340) + x, 485 + (x/10));
      fill(#6A5941);
      rect((b + 320) + x, 485 + (x/10), 10, 10);
    }

    for (int x = 0; x <= 400; x = x + 50) {
      fill(#436742);
      triangle((b + 660) + x, 520 - (x/15), (b + 675) + x, 450 - (x/15), (b + 690) + x, 520 - (x/15));
      fill(#6A5941);
      rect((b + 670) + x, 520 - (x/15), 10, 10);
    }

    // green hills
    fill(#68A266);
    ellipse(m + 270, 600, 600, 200);
    ellipse(m + 800, 640, 1000, 230);
    ellipse(m + 1000, 630, 800, 210);

    // trees in the background
    for (int x = 0; x <= 1500; x = x + 50) {
      fill(#528151);
      triangle((m + 30) + x, 530, (m + 45) + x, 460, (m + 60) + x, 530);
      fill(#6A5941);
      rect((m + 40) + x, 530, 10, 10);
    }

    // light green hills
    fill(#6FB26C);
    ellipse(f, 610, 1200, 140); 
    ellipse(f + 370, 660, 500, 300);
    ellipse(f + 930, 640, 1070, 200);  
    ellipse(f + 1500, 640, 10800, 200);

    // trees in the background
    for (int x = 0; x <= 1500; x = x + 50) {
      fill(#5B9859);
      triangle((f + 5) + x, 570, (f + 30) + x, 480, (f + 55) + x, 570);
      fill(#6A5941);
      rect((f + 22.5) + x, 570, 15, 15);
    }

    println(+b);
  }
  
  void foreground() {
    fill(#5D4525);
    rect(165 + s, 450, 530, 200);
    rect(325 + s, 300, 370, 350);
    rect(645 + s, 105, 90, 550);
    rect(495 + s, 260, 100, 200);
    rect(595 + s, 180, 100, 300);
    rect(730 + s, 330, 85, 400);
    rect(1045 + s, 360, 405, 500);
    rect(1125 + s, 240, 380, 500);
    rect(1425 + s, 400, 290, 500);
    rect(1325 + s, 80, 110, 500);
    rect(1425 + s, 55, 90, 500);
    rect(2065 + s, 50, 100, 800);
    rect(1965 + s, 300, 110, 800);
    rect(1865 + s, 500, 110, 800);
    
    for (int x = 0; x <= 60; x = x + 10) {
     fill(30 + (x*2), 200 + (x*2), 200 + (x*2));
     rect((2115 + x/2) + s, 5 + x/2, 45 - x, 45 - x);
    }
    
  }
}

//Level two tab

class LevelTwo {
  PImage skyline;
  float scrape;

  LevelTwo() {
    skyline = loadImage("Skyline.png");
  }

  void displayBackground() {
    scrape = s/3;

    for (int x = 0; x <= 100; x = x + 10) {
      fill(6 + (x/2), 4 + (x/2), 10 + (x/2));
      rect(0, 520 + (x*2), width*2, 100);
    }

    image(skyline, 0, 0);

    fill(#757575);
    rect(0 + s, 232, 277, 618);
    rect(368 + s, 0, 430, 720);
    rect(933 + s, 0, 357, 720);
    rect(1416 + s, 405, 744, 315);
  }
}

//Platform tab

class Platforms {
  float x, y, locationX, locationY, pX, pXOffset, pY, pYOffset, scrape;
  int xOffset, yOffset, pOffset, top, bottom, left, right, pValue;
  int [][] platforms = { 
    {0, 600, 2160, 120, 0}, {160, 450, 160, 25, 20}, {320, 300, 200, 25, 20}, {520, 390, 140, 25, 20}, 
    {400, 530, 110, 25, 20}, {640, 105, 100, 25, 20}, {740, 330, 80, 25, 20}, {1040, 360, 80, 25, 20}, 
    {1120, 240, 390, 25, 20}, {1200, 500, 110, 25, 20}, {1390, 460, 130, 25, 20}, {1320, 80, 100, 25, 20}, 
    {1420, 55, 100, 25, 20}, {1520, 400, 200, 25, 20}, {2060, 50, 100, 25, 20}, {1960, 300, 200, 25, 20}, 
    {1860, 500, 100, 25, 20},

    {0, 232, 277, 25, 0}, {252, 257, 25, 353, 0}, {25, 695, 252, 25, 20}, {0, 257, 25, 463, 0}, 
    {65, 610, 212, 25, 20}, {25, 525, 177, 25, 0}, {177, 342, 25, 183, 0}, {65, 317, 137, 25, 20}, 
    {25, 402, 152, 25, 20}, {237, 450, 15, 25, 20}, {353, 695, 15, 25, 20}, {277, 565, 15, 25, 20}, 
    {353, 435, 15, 25, 20}, {277, 305, 15, 25, 20}, {368, 0, 430, 25, 0}, {368, 85, 25, 355, 20},
    {773, 25, 25, 230, 0}, {393, 170, 320, 25, 20}, {653, 255, 120, 25, 20}, {603, 280, 50, 25, 20},
    {553, 305, 50, 25, 20}, {503, 330, 50, 25, 20}, {453, 355, 200, 25, 20}, {773, 255, 25, 85, 0},
    {773, 1400, 30, 680, 20}, {368, 440, 430, 280, 20}, {393, 255, 95, 25, 20}, {453, 85, 260, 25, 20},
    {933, 0, 357, 25, 0}, {958, 695, 307, 25, 20}, {933, 610, 25, 110, 20}, {933, 25, 25, 525, 0},
    {1265, 85, 25, 635, 20}, {958, 525, 247, 25, 20}, {1018, 440, 247, 25, 20}, {958, 355, 247, 25, 20},
    {1018, 270, 247, 25, 20}, {958, 185, 247, 25, 20}, {1018, 100, 247, 25, 20}, {1018, 610, 187, 25, 20},
    {1416, 405, 744, 315, 20}, {653, 280, 25, 100, 0}

  };

  Platforms() {
    top = 0;
    bottom = 0;
    left = 0;
    right = 0;
    locationX = newPlayer.playerX;
    locationY = newPlayer.playerY;
    pOffset = 0;
    scrape = s;
  }

  void displayPlatform(int p) {
    noStroke();

    rect(platforms[p][0] + scrape, platforms[p][1], platforms[p][2], platforms[p][3]);

    checkForCollisions(p);
  }

  void checkForCollisions(int p) {
    x = newPlayer.playerX;
    y = newPlayer.playerY;
    xOffset = newPlayer.playerXOffset;
    yOffset = newPlayer.playerYOffset;
    pX = myPlatforms.platforms[p][0] + scrape;
    pXOffset = myPlatforms.platforms[p][2];
    pY = myPlatforms.platforms[p][1];
    pYOffset = myPlatforms.platforms[p][3];
    pValue = myPlatforms.platforms[p][4];

    // check to see if the player rect intersects the platform rect
    boolean collisionDetected = rangeIntersect(x, x + xOffset, pX, pX + pXOffset) && rangeIntersect(y, y + yOffset, pY, pY + pYOffset);

    // if a collision occured check to which side the collision occured
    if (collisionDetected) {
      // set color
      fill(0, 0, 0, 20);
      rect(platforms[p][0] + scrape, platforms[p][1], platforms[p][2], platforms[p][3]);

      // Check if the Player is within the x range
      if (x < pX + pXOffset - pOffset && x + xOffset > pX + pOffset) {

        // Collision Top
        if (y < pY && (y + yOffset) >= pY) {
          velocityY = 0; 
          // sets the players y position based on platform y position less the players y offset
          newPlayer.playerY = pY - yOffset;
          // player can only be on top; bottom set to 0
          top = 1;
          bottom = 0;

          if (p > 0) {
            if (total[p] == 0) {
              total[p] = pValue; 
              playerTotal += pValue;
            }
          }
        }
        // Collision Bottom
        if (!(collisionTop)) {
          if (y + yOffset > pY + pYOffset) {
            if (y < pY + pYOffset) {
              velocityY = 0;
              // allows collision with bottom but causes gravity to take over
              // set to newPlayer.playerY = pY + pYOffset if player is to hang on bottom;
              newPlayer.playerY += gravity;
              // player can only be on bottom; top set to 0
              top = 0;
              bottom = 1;
            }
          }
        }
      }

      // Check if the Player is within the y range
      if (y > (pY + pOffset) && y < (pY + pYOffset - pOffset)) {        
        // Collison Left
        if (x + xOffset >= pX && x < pX) {
          velocityX = 0;    
          // sets the players x position based on platform x position less the players x offset
          newPlayer.playerX = pX - xOffset;
          // player can only be on left; right set to 0
          left = 1;
          right = 0;
        }
        // Collison Right
        if (x <= pX + pXOffset && x + xOffset > pX + pXOffset) {
          velocityX = 0;  
          // sets the players x position based on platform x position plus the platforms x offset   
          newPlayer.playerX = pX + pXOffset;
          // player can only be on right; left set to 0
          left = 0;    
          right = 1;
        }
      }
    }

    // these if statements are important due to the fact 
    // of the looping occuring constantly resetting the values
    if (top == 1) {
      collisionTop = true;
    } else {
      collisionTop = false;
    }

    if (bottom == 1) {
      collisionBottom = true;
    } else {
      collisionBottom = false;
    }

    if (left == 1) {
      collisionLeft = true;
    } else {
      collisionLeft = false;
    }

    if (right == 1) {
      collisionRight = true;
    } else {
      collisionRight = false;
    }
  }

  // checks to see if two rectangles are intersecting
  boolean rangeIntersect(float min0, float max0, float min1, float max1) {
    return Math.max(min0, max0) >= Math.min(min1, max1) && 
      Math.min(min0, max0) <= Math.max(min1, max1);
  }
}

//Player tab

class Player {
  int playerXOffset, playerYOffset, jumpBoost;
  float playerX, playerY;
  PImage player;
  PImage playerLeft;
  PImage playerJetPack;
  PImage playerJetPackLeft;
  boolean jetPack;
  boolean isPlayerLeft;

  Player() {
    playerX = 20;
    playerY = 20;
    playerXOffset = 20;
    playerYOffset = 40;
    jumpBoost = 100;
    player = loadImage("Player.png");
    playerJetPack = loadImage("PlayerJetPack.png");
    playerLeft = loadImage("PlayerLeft.png");
    playerJetPackLeft = loadImage("PlayerJetPackLeft.png");
  }

  void display() {
    if (!isPlayerLeft) {
      if (!jetPack) {
        image(player, playerX, playerY, playerXOffset, playerYOffset);
      }

      if (jetPack) {
        image(playerJetPack, playerX, playerY, playerXOffset, playerYOffset);
      }

      fill(0);
      rect(playerX + 1, playerY + 12, 2, 10);
      fill(#17FF28);
      rect(playerX + 1, playerY + 22, 2, -jumpBoost/10);
    }

    if (isPlayerLeft) {
      if (!jetPack) {
        image(playerLeft, playerX, playerY, playerXOffset, playerYOffset);
      }

      if (jetPack) {
        image(playerJetPackLeft, playerX, playerY, playerXOffset, playerYOffset);
      }

      fill(0);
      rect(playerX + 17, playerY + 12, 2, 10);
      fill(#17FF28);
      rect(playerX + 17, playerY + 22, 2, -jumpBoost/10);
    }
    //noStroke();
    //fill(#F7DFA2);
    //rect(playerX, playerY, playerXOffset, playerYOffset);

    //fill(#3E2F1C);
    //rect(playerX, playerY, playerXOffset, playerYOffset - 33);

    //fill(#594CB7);

    fill(255);
    textSize(20);
  }

  void movePlayer(boolean keys[]) {
    //println(collisionTop + " " + collisionBottom + " " + collisionLeft + " " + collisionRight);

    if (collisionTop) {
      if (newPlayer.jumpBoost < 100) {
        newPlayer.jumpBoost = newPlayer.jumpBoost + 1;
      }
    }

    // jump
    if (keys[0]) {
      if (!(collisionBottom)) {
        if (jumpBoost > 0) {
          velocityY = jumpSize;
          jumpBoost = jumpBoost - 2;
        }
      }
    }

    // Down / Fire
    if (keys[1]) {
      if (!(collisionTop)) {
        velocityY = gravity;
      }
      newGun.gunFired = true;
    }
    //
    // Left
    if (keys[2]) {

      if (collisionRight) {
        velocityX = 0;
      } else {
        // keeps player in center of screen
        // until s = 0
        if (s < 0) {

          if (playerX <= width/2) {
            velocityX = 0;
            s += speed;
          } else {
            if (s < -540) {
              velocityX = -speed;
              s = -1060;
            }
          }
        } else {
          // allows player to move beyond center of screen
          s = 0;

          if (playerX <= 20 + speed) {
            velocityX = 0;
          } else {
            velocityX = -speed;
          }
        }
      }
    }

    // Right
    if (keys[3]) {    

      if (collisionLeft) {
        velocityX = 0;
      } else {
        // keeps player in center of screen
        if (playerX + playerXOffset/2 >= width/2) {

          if (playerX + playerXOffset >= width - playerXOffset) {
            velocityX = 0;
          } else {
            velocityX = 0;
            s += -speed;
          }
        } else {
          // allows player to move towards from center of screen
          velocityX = speed;
        }

        if (s <= -1080) {
          velocityX = speed;
          s = -1080;
          if (newPlayer.playerX >= 540) {
            s += speed;
          }
        }
      }
    }

    // if both Left and Right are released, horizontal velocity should be zero.
    if (!keys[2] && !keys[3]) { 
      velocityX = 0;
    }
    // if both Up and Down are released, vertical velocity should be zero.
    if (!keys[0] && !keys[1]) { 
      velocityY = 0;
    }

    playerX += velocityX;
    playerY += velocityY;

    // reset
    velocityY = gravity;
  }

  void keepFalling() {
    if (!(collisionTop)) {
      playerY += velocityY;
    }
  }
}

//Timer tab

class Timer {
  int time = millis();
  int passedTime;

  Timer(int e) {
    passedTime = e;
  }

  void startTimer() {
  }

  boolean timeFinished() {
    if (millis() >= time + passedTime) {
      time = millis();
      return true;
    } else {
      return false;
    }
  }
}

//Title screen tab

class TitleScreen {
  int buttonX, buttonY, buttonW, buttonH;
  boolean buttonOver;
  String start;

  TitleScreen() {
    buttonX = 340;
    buttonY = 420;
    buttonW = 400;
    buttonH = 200;
    start = ("Press Start");
  }

  void displayTitleScreen() {
    noStroke();
    fill(255);
    rect(buttonX, buttonY, buttonW, buttonH);
    textSize(77);
    fill(0);
    text(start, buttonX, buttonY + 40, buttonW, buttonH);
    if (buttonOver) {
     fill(0,0,0,100);
     rect(buttonX, buttonY, buttonW, buttonH);
    }
  }

  void update(int x, int y) {
    if (overButton(buttonX, buttonY, buttonW, buttonH)) {
      buttonOver = true;
    } else {
      buttonOver = false;
    }
  }

  boolean overButton(int x, int y, int w, int h) {
    if (mouseX >= x && mouseX <= x + w &&
      mouseY >= y && mouseY <= y + h) {
      return true;
    } else {
      return false;
    }
  }
}
