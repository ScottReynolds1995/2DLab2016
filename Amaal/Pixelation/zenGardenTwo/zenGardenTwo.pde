size(1067, 563);
background(#c879b2);
fill(#0d2c40);
noStroke();
rect(width* 0.25, 0, 200, height);
fill(#f15b31);

//x and y pos of rect
rect(width * 0.25 + 200,
  height * 0.6,
  //width and height of rect
  200, height *0.75);

  fill(#3ac2d8);
  rect(width * 0.25 + 400,
    height *0.6,
    200, height *0.75);

    fill(#f15b31);
    rect(width * 0.25 + 600,
      height *0.6,
      200, height *0.75);

      fill(255);
      PFont title;
      PFont subheading;

      String titleText = "The Beauty\n" +
      "of CSS\n"+
      "Design";

      String subheadingText = "A demonstration of what can be accomplished\n" +
      "through CSS based design. Select any style\n" +
      "sheet from the list to load it into this page.\n\n" +
      "Download the example html file and css file";

      //setting font
      title = loadFont("HelveticaNeue-CondensedBold-30.vlw");
      textFont(title);

      //displaying font
      textAlign(LEFT);
      text(titleText, width/4 + 25, 200);

      subheading = loadFont("HelveticaNeue-Medium-15.vlw");
      textFont(subheading);
      text(subheadingText, width/4 + 250, 200);

      //large ellipse
      ellipse(366, 450, 150, 150);
      fill(#f15b31);

      //star design
      noStroke();
      ellipse(366, 450, 7, 7);
      strokeWeight(2);
      stroke(#f15b31);
      line(366, 447, 366, 410); //top vertical line
      line(366, 447, 366, 484); //bottom vertical line

      line(366, 450, 329, 450); //left horizontal line
      line(366, 450, 403, 450); //right horizontal line

      line(335, 420, 376, 460); //diagonal top left

      line(366, 447, 397, 415);


      line(366, 450, 393, 477); //diagonal bottom right
      line(366, 450, 336, 477); //diagonal bottom left





      fill(255);
      noStroke();
      ellipse(566, 450, 150, 150);

      noFill();
      stroke(#2abdd5);
      triangle(596, 500,
        536, 500,
        566, 450);

        triangle(596, 400,
          536, 400,
          566, 450);

          noStroke();
          fill(#0b2c40);

          ellipse(766, 450, 150, 150);
          //cirlce design inside ellipse
          noFill();
          stroke(255);
          strokeWeight(2);
          ellipse(766, 422, 20, 20);  //top
          ellipse(766, 450, 20, 20);  //middle
          ellipse(766, 480, 20, 20); //bottom
          ellipse(741, 440, 20, 20); //top left
          ellipse(791, 440, 20, 20); //top right
          ellipse(741, 467, 20, 20); //
          ellipse(791, 467, 20, 20); //bottom right


          fill(255);
          ellipse(966, 450, 150, 150);
          noFill();
          stroke(#2abdd5);
          ellipse(966, 450, 75, 75);
          ellipse(966, 450, 85, 85);
          ellipse(966, 450, 95, 95);
          ellipse(966, 450, 105, 105);
