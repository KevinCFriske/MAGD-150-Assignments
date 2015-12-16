void setup() {

  size(600, 600);   // Greater than 400x400
  background(0, 102, 204);
  
  rectMode(CORNER);   //Sky
  fill(0, 128, 255);
  noStroke();
  rect(0, 600, 600, -500);
  fill(51, 153, 255);
  rect(0, 600, 600, -400);
  fill(102, 178, 255);
  rect(0, 600, 600, -300);
  fill(153, 204, 255);
  rect(0, 600, 600, -200);
  fill(204, 229, 255);
  rect(0, 600, 600, -100);

  noStroke();   //Grass
  fill(0, 128, 0);
  rectMode(CENTER);   //First mode
  rect(0, 550, 1200, 100);   //First rectangle

  noStroke();   //Sun
  fill(247, 247, 107);
  ellipseMode(CORNER);   //Second mode
  ellipse(30, 30, 80, 80);   //First ellipse

  stroke(0);   //Black part of the sun's eyes  
  strokeWeight(20);
  point(50, 60);   //Two points
  point(90, 60);

  stroke(255);   //Whites of the sun's eyes
  strokeWeight(5);
  ellipse(55, 56, 3, 8);   //Second ellipse
  ellipse(95, 56, 3, 8);
  point(45, 65);
  point(85, 65);

  stroke(0);   //Smile of the sun
  strokeWeight(2);
  line(45, 77, 95, 77);
  fill(255);
  arc(45, 58, 50, 40, 0, PI, 0);
  stroke(0);
  line(48, 87, 92, 87);   // Horizontal line in smile
  line(50, 77, 50, 90);   // Verticle lines in smile
  line(60, 77, 60, 96);
  line(70, 77, 70, 98);
  line(80, 77, 80, 96);
  line(90, 77, 90, 90);

  //strokeWeight(9);   //Frame guidelines
  //stroke(174);
  //line(150, 550, 300, 100);
  //line(300, 100, 450, 550);

  noStroke();   //Bottom left side inner polygon
  fill(154, 133, 99);
  beginShape();
  vertex(160, 550);
  vertex(210, 550);
  vertex(246, 465);
  vertex(209, 465);
  endShape();

  beginShape();   //Bottom right side inner polygon
  vertex(390, 550); 
  vertex(440, 550);
  vertex(398, 465);
  vertex(357, 465);
  endShape();

  beginShape();   //Bottom center inner polygon
  vertex(226, 509);
  vertex(264, 478);
  vertex(300, 465);
  vertex(338, 479);
  vertex(376, 509);
  vertex(368, 468);
  vertex(233, 468);
  endShape();

  stroke(204, 183, 149);   //Support lines above the arc on the right side
  strokeWeight(3);
  line(255, 455, 268, 472);
  line(250, 460, 261, 475);
  line(245, 465, 256, 480);
  line(240, 470, 251, 485);
  line(238, 479, 246, 490);
  line(236, 489, 241, 495);

  line(363, 488, 358, 495);   //Support lines above the arc on the left side
  line(361, 480, 353, 490);
  line(358, 473, 350, 483);
  line(356, 465, 344, 480);
  line(348, 464, 337, 478);
  line(338, 465, 330, 475);

  strokeWeight(5);   //Bottom part of the tower
  stroke(204, 183, 149);
  line(160, 550, 213, 450);
  line(387, 450, 440, 550);

  line(160, 550, 210, 550);   //Bottom most lines on the tower
  line(390, 550, 440, 550);

  line(210, 550, 263, 420);   //Inner lines on the bottom
  line(390, 550, 337, 420);

  strokeWeight(3);   //Cross supports in the bottom left part of the tower
  line(160, 550, 226, 507.5);
  line(226, 507.5, 209, 465);
  line(210, 550, 186, 507.5);
  line(186, 507.5, 246, 465);

  line(185, 550, 226.5, 465);   //Middle and horizontal supports in the bottom left of the tower
  line(197, 486.25, 237, 486.25);
  line(183, 507.5, 230, 507.5);
  line(173, 528.75, 220, 528.75);

  line(390, 550, 415, 507.5);   //Cross supports in the bottom right part of the tower
  line(415, 507.5, 355, 465);
  line(440, 550, 375, 507.5);
  line(375, 507.5, 395, 465);

  line(415, 550, 375, 465);   //Middle and horizontal supports in the bottom right of the tower
  line(365, 486.25, 405, 486.25);
  line(370, 507.5, 413, 507.5);
  line(380, 528.75, 427, 528.75);

  noFill();
  strokeWeight(5);
  curve(210, 740, 210, 550, 300, 465, 440, 540);
  curve(300, 550, 300, 465, 390, 550, 440, 890);

  fill(204, 183, 149);   //Bottom polygon
  stroke(204, 183, 149);
  beginShape();
  vertex(213, 450);
  vertex(387, 450);
  vertex(395, 465);
  vertex(205, 465);
  vertex(213, 450);
  endShape();

  rectMode(CORNER);
  rect(213, 450, 173, -30);   //Second rectangle

  fill(154, 133, 99);   //Left middle dark polygon
  beginShape();
  vertex(223, 420);
  vertex(263, 420);
  vertex(300, 300);
  vertex(266, 300);
  endShape();

  beginShape();   //Right middle dark polygon
  vertex(380, 420);
  vertex(337, 420);
  vertex(300, 300);
  vertex(334, 300);
  endShape();

  line(263, 420, 300, 300);   //Inner middle lines of the tower
  line(337, 420, 300, 300);

  noStroke();   //Middle polygon
  fill(154, 133, 99);
  beginShape();
  vertex(266, 300);
  vertex(334, 300);
  vertex(342, 330);
  vertex(258, 330);
  endShape();

  stroke(204, 183, 149);   //Middle outer lines of the tower
  line(213, 450, 266, 300);
  line(387, 450, 334, 300);

  strokeWeight(3);   //Middle and horizontal supports in the middle left of the tower
  line(233, 450, 273, 330);
  line(233, 405, 267, 405);
  line(236, 390, 270, 390);
  line(239, 375, 273, 375);
  line(245, 360, 276, 360);
  line(250, 345, 282, 345);

  line(223, 420, 273, 390);   //Cross supports in the middle left of the tower
  line(273, 390, 247, 360);
  line(247, 360, 290, 330);
  line(263, 420, 233, 390);
  line(233, 390, 280, 360);
  line(280, 360, 257, 330);

  line(367, 450, 327, 330);   //Middle and horizontal supports in the middle right of the tower
  line(333, 405, 367, 405);
  line(327, 390, 362, 390);
  line(323, 375, 357, 375);
  line(317, 360, 352, 360);
  line(313, 345, 347, 345);

  line(266, 300, 282, 330);   //Cross lines in the upper middle of the tower
  line(334, 300, 318, 330);
  line(282, 330, 300, 300);
  line(300, 300, 318, 330);
  line(258, 330, 282, 300);
  line(282, 300, 300, 330);
  line(300, 330, 318, 300);
  line(318, 300, 342, 330);

  line(377, 420, 327, 390);   //Cross supports in the middle left part of the tower
  line(327, 390, 354, 360);
  line(354, 360, 309, 330);
  line(333, 420, 367, 390);
  line(367, 390, 320, 360);
  line(320, 360, 343, 330);

  line(263, 315, 337, 315);   //Verticle and horizontal lines in the upper middle of the tower
  line(282, 300, 282, 330);
  line(300, 300, 300, 330);
  line(318, 300, 318, 330);

  strokeWeight(5);
  line(258, 300, 342, 300);   //Lighter top and bottom lines on the upper middle polygon
  line(258, 330, 342, 330);

  stroke(154, 133, 99);   //Darker horrizontal lines in the lower middle of the tower
  strokeWeight(10);
  line(215, 430, 384, 430);
  strokeWeight(4);
  line(213, 445, 386, 445);

  stroke(204, 183, 149);   //Verticle lines in the lower middle of the tower
  strokeWeight(2);
  line(212, 425, 212, 436);
  line(219, 425, 219, 436);
  line(226, 425, 226, 436);
  line(233, 425, 233, 436);
  line(240, 425, 240, 436);
  line(247, 425, 247, 436);
  line(254, 425, 254, 436);
  line(261, 425, 261, 436);
  line(268, 425, 268, 436);
  line(275, 425, 275, 436);
  line(282, 425, 282, 436);
  line(289, 425, 289, 436);
  line(296, 425, 296, 436);
  line(303, 425, 303, 436);
  line(310, 425, 310, 436);
  line(317, 425, 317, 436); 
  line(324, 425, 324, 436);
  line(331, 425, 331, 436);
  line(338, 425, 338, 436);
  line(345, 425, 345, 436);
  line(352, 425, 352, 436);
  line(359, 425, 359, 436);
  line(366, 425, 366, 436);
  line(374, 425, 374, 436);
  line(381, 425, 381, 436);
  line(388, 425, 388, 436);

  stroke(154, 133, 99);   //Lower verticle lines in the lower middle of the tower
  strokeWeight(2);
  line(212, 445, 212, 450);
  line(219, 445, 219, 450);
  line(226, 445, 226, 450);
  line(233, 445, 233, 450);
  line(240, 445, 240, 450);
  line(247, 445, 247, 450);
  line(254, 445, 254, 450);
  line(261, 445, 261, 450);
  line(268, 445, 268, 450);
  line(275, 445, 275, 450);
  line(282, 445, 282, 450);
  line(289, 445, 289, 450);
  line(296, 445, 296, 450);
  line(303, 445, 303, 450);
  line(310, 445, 310, 450);
  line(317, 445, 317, 450); 
  line(324, 445, 324, 450);
  line(331, 445, 331, 450);
  line(338, 445, 338, 450);
  line(345, 445, 345, 450);
  line(352, 445, 352, 450);
  line(359, 445, 359, 450);
  line(366, 445, 366, 450);
  line(374, 445, 374, 450);
  line(381, 445, 381, 450);
  line(388, 445, 388, 450);

  stroke(204, 183, 149);   //Top inner triangle of the tower
  strokeWeight(5);
  triangle(266, 300, 334, 300, 300, 100);

  strokeWeight(3);   //Top middle lines of the tower
  line(287, 300, 300, 220);
  line(313, 300, 300, 220);
  line(300, 220, 300, 100);

  line(272, 283, 292, 268);   //Cross supports on the top right of the tower
  line(292, 268, 275, 253);
  line(275, 253, 296, 238);
  line(296, 238, 281, 223);
  line(281, 223, 300, 208);
  line(300, 208, 285, 193);
  line(285, 193, 300, 178);
  line(300, 178, 290, 163);
  line(290, 163, 300, 148);
  line(300, 148, 295, 133);
  line(290, 283, 274, 268);
  line(274, 268, 294, 253);
  line(294, 253, 278, 238);
  line(278, 238, 298, 223);
  line(298, 223, 282, 208);
  line(282, 208, 300, 193);
  line(300, 193, 286, 178);
  line(286, 178, 300, 163);
  line(300, 163, 291, 148);
  line(291, 148, 300, 133);
  
  line(313, 283, 328, 268);   //Cross supports on the top left of the tower
  line(328, 268, 306, 253);
  line(306, 253, 322, 238);
  line(322, 238, 300, 223);
  line(300, 223, 316, 208);
  line(316, 208, 300, 193);
  line(300, 193, 313, 178);
  line(313, 178, 300, 163);
  line(300, 163, 308, 148);
  line(308, 148, 300, 133);
  line(330, 283, 309, 268);
  line(309, 268, 326, 253);
  line(326, 253, 304, 238);
  line(304, 238, 322, 223);
  line(322, 223, 300, 208);
  line(300, 208, 316, 193);
  line(316, 193, 300, 178);
  line(300, 178, 312, 163);
  line(312, 163, 300, 148);
  line(300, 148, 306, 133);
  
  line(313, 283, 292, 268);   //Cross supports on the top middle of the tower
  line(292, 268, 306, 253);
  line(306, 253, 298, 238);
  line(290, 283, 309, 268);
  line(309, 268, 296, 253);
  line(296, 253, 302, 238);
  
  line(328, 268, 274, 268);   //Horizontal lines on the top part of the tower
  line(324, 253, 278, 253);
  line(320, 238, 282, 238);
  line(318, 223, 284, 223);
  line(314, 208, 286, 208);
  line(312, 193, 288, 193);
  line(310, 178, 290, 178);
  line(308, 163, 292, 163);

  strokeWeight(5);
  line(266, 300, 300, 100);   //Top outer lines of the tower
  line(334, 300, 300, 100);

  rectMode(CORNER);   //Upper middle rectangle of the tower
  rect(258, 300, 342 - 258, -15);

  strokeWeight(2);   //Verticle lines on the upper middle rectangle of the tower
  line(300 + 35, 300, 300 + 35, 285);
  line(300 + 28, 300, 300 + 28, 285);
  line(300 + 21, 300, 300 + 21, 285);
  line(300 + 14, 300, 300 + 14, 285);
  line(300 + 7, 300, 300 + 7, 285);
  line(300, 300, 300, 285);
  line(300 - 7, 300, 300 - 7, 285);
  line(300 - 14, 300, 300 - 14, 285);
  line(300 - 21, 300, 300 - 21, 285);
  line(300 - 28, 300, 300 - 28, 285);
  line(300 - 35, 300, 300 - 35, 285);

  fill(204, 183, 149);   //Top viewing platform bit
  noStroke();  
  rectMode(CORNER);
  rect(285, 115, 31, 7);
  fill(154, 133, 99);
  rect(285, 115, 31, -10);
  stroke(204, 183, 149);
  line(285, 105, 314, 105);
  line(285, 105, 285, 115);
  line(290, 105, 290, 115);
  line(295, 105, 295, 115);
  line(300, 105, 300, 115);
  line(305, 105, 305, 115);
  line(310, 105, 310, 115);
  line(315, 105, 315, 115);
  line(286, 122, 294, 128);
  line(314, 122, 306, 128);
  line(286, 105, 300, 100);
  line(314, 105, 300, 100);
  
  noStroke();   //Very top bit of the tower
  fill(154, 138, 99);
  rect(297, 102, 6, -25);
  rect(297, 53, 6, -3);
  fill(204, 188, 149);
  rect(297, 77, 6, -25);
  
  fill(0, 51, 0);  //First two trees
  translate(0, 15);
  rect(430, 520, 40, -40, 10);
  rect(170, 520, -40, -40, 10);
  fill(104, 75, 18);
  rect(447, 521, 6, 17);
  rect(170 - 23, 521, 6, 17);
  
  translate(-30, 10);   //Left side trees
  fill(0, 51, 0);
  rect(170, 520, -40, -40, 10);
  fill(104, 75, 18);
  rect(170 - 23, 521, 6, 17);
  
  translate(-30, 10);
  fill(0, 51, 0);
  rect(170, 520, -40, -40, 10);
  fill(104, 75, 18);
  rect(170 - 23, 521, 6, 17);
  
  translate(-30, 10);
  fill(0, 51, 0);
  rect(170, 520, -40, -40, 10);
  fill(104, 75, 18);
  rect(170 - 23, 521, 6, 17);
  
  translate(-30, 10);
  fill(0, 51, 0);
  rect(170, 520, -40, -40, 10);
  fill(104, 75, 18);
  rect(170 - 23, 521, 6, 17);
  
  translate(-30, 10);
  fill(0, 51, 0);
  rect(170, 520, -40, -40, 10);
  fill(104, 75, 18);
  rect(170 - 23, 521, 6, 17);
  
  translate(180, -40);   //Right side trees
  fill(0, 51, 0);
  rect(430, 520, 40, -40, 10);
  fill(104, 75, 18);
  rect(447, 521, 6, 17);
  
  translate(30, 10);
  fill(0, 51, 0);
  rect(430, 520, 40, -40, 10);
  fill(104, 75, 18);
  rect(447, 521, 6, 17);
  
  translate(30, 10);
  fill(0, 51, 0);
  rect(430, 520, 40, -40, 10);
  fill(104, 75, 18);
  rect(447, 521, 6, 17);
  
  translate(30, 10);
  fill(0, 51, 0);
  rect(430, 520, 40, -40, 10);
  fill(104, 75, 18);
  rect(447, 521, 6, 17);
  
  translate(30, 10);
  fill(0, 51, 0);
  rect(430, 520, 40, -40, 10);
  fill(104, 75, 18);
  rect(447, 521, 6, 17);
  
}
