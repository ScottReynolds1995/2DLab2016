PImage img;
PImage[] imgs = new PImage[8];
String[] captions = new String[]{
  "Bare\nTrees",
  "Cumulus\n Clouds",
  "Few people\n sighted",
  "Yellow",
  "Brickwork",
  "London Eye",
  "A view from\na bridge",
  "Red"
};


void setup() {
  size(800, 300);
}

void draw() {

  PFont text;
  text = loadFont("Times-Italic-40.vlw");
  textFont(text);
  textAlign(CENTER);

  for (int i= 0; i<800; i = i+20) {
    line(0, i, 800, i);
    line(i, 0, i, 400);
  }

  imgs[0] = loadImage("contemp0.jpg");
  imgs[1] = loadImage("contemp1.jpg");
  imgs[2] = loadImage("contemp2.jpg");
  imgs[3] = loadImage("contemp3.jpg");
  imgs[4] = loadImage("contemp4.jpg");
  imgs[5] = loadImage("contemp5.jpg");
  imgs[6] = loadImage("contemp6.jpg");
  imgs[7] = loadImage("contemp7.jpg");

  image(imgs[0], 0, 0, 200, 150);
  image(imgs[1], 200, 0, 200, 150);
  image(imgs[2], 400, 0, 200, 150);
  image(imgs[3], 600, 0, 200, 150);
  image(imgs[4], 0, 150, 200, 150);
  image(imgs[5], 200, 150, 200, 150);
  image(imgs[6], 400, 150, 200, 150);
  image(imgs[7], 600, 150, 200, 150);

  if (mouseX> 0 && mouseX<200) {
    if (mouseY> 0 && mouseY <200) {
      noStroke();
      fill(255, 130);
      rect(0, 0, 200, 150);

      fill(0);
      text(captions[0], 100, 75);
    }
  }

  if (mouseX> 200 && mouseX<400) {
    if (mouseY> 0 && mouseY <150) {
      noStroke();
      fill(255, 130);
      rect(200, 0, 200, 150);

      fill(0);
      text(captions[1], 300, 75);
    }
  }


  if (mouseX> 400 && mouseX<600) {
    if (mouseY> 0 && mouseY <150) {
      noStroke();
      fill(255, 130);
      rect(400, 0, 200, 150);

      fill(0);
      text(captions[2], 500, 75);
    }
  }


  if (mouseX> 600 && mouseX<800) {
    if (mouseY> 0 && mouseY <150) {
      noStroke();
      fill(255, 130);
      rect(600, 0, 200, 150);

      textAlign(CENTER);
      fill(0);
      text(captions[3], 700, 75);
    }
  }


  if (mouseX> 0 && mouseX<200) {
    if (mouseY> 150 && mouseY <300) {
      noStroke();
      fill(255, 130);
      rect(0, 150, 200, 150);

      textAlign(CENTER);
      fill(0);
      text(captions[4], 100, 225);
    }
  }


  if (mouseX> 200 && mouseX<400) {
    if (mouseY> 150 && mouseY <300) {
      noStroke();
      fill(255, 130);
      rect(200, 150, 200, 150);

      textAlign(CENTER);
      fill(0);
      text(captions[5], 300, 225);
    }
  }

  if (mouseX> 400 && mouseX<600) {
    if (mouseY> 150 && mouseY <300) {
      noStroke();
      fill(255, 130);
      rect(400, 150, 200, 150);

      textAlign(CENTER);
      fill(0);
      text(captions[6], 500, 225);
    }
  }


  if (mouseX> 600 && mouseX<800) {
    if (mouseY> 150 && mouseY <300) {
      noStroke();
      fill(255, 130);
      rect(600, 150, 200, 150);

      textAlign(CENTER);
      fill(0);
      text(captions[7], 700, 225);
    }
  }
}
