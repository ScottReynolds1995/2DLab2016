PImage img;
PImage[] imgs = new PImage[6];


void setup() {
  size(600, 300);

}

void draw() {
  background(255);

  stroke(0);

  //for (int i= 0; i<600; i = i+20) {
  //  line(0, i, 600, i);
  //  line(i, 0, i, 600);
  //}

  imgs[0] = loadImage("imgs0.jpg");
  imgs[1] = loadImage("imgs1.jpg");
  imgs[2] = loadImage("imgs2.jpg");
  imgs[3] = loadImage("imgs3.jpg");
  imgs[4] = loadImage("imgs4.jpg");
  imgs[5] = loadImage("imgs5.jpg");

  image(imgs[0], 0, 0, 200, 150);
  image(imgs[1], 200, 0, 200, 150);
  image(imgs[2], 400, 0, 200, 150);
  image(imgs[3], 0, 150, 200, 150);
  image(imgs[4], 200, 150, 200, 150);
  image(imgs[5], 400, 150, 200, 150);

}
