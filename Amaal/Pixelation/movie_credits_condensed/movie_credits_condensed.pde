String[] actors = new String[] {
  "Peter Hooten   .......................",
  "Clyde Kusatsu  ........................................",
  "Jessica Walter  ..........................",
  "Anne-Marie Martin   ..........................",
  "Phillip Sterling   ....................."
};

String[] characters = new String[] {
  "DOCTOR STRANGE",
  "WONG",
  "MORGAN LEFAY",
  "CLEA LAKE",
  "DR. FRANK TAYLOR"};


PVector location;
PVector rectSize;

void setup() {
  size(600, 600);
  background(#faf3e6);


  location = new PVector(width/8, 80);
  rectSize = new PVector(455, 5);
  fill(0);
  noStroke();
  rect(location.x, location.y, rectSize.x, rectSize.y);
  rect(location.x, 525, rectSize.x, rectSize.y);


  PFont actorsFont;
  PFont charactersFont;
  PFont titleFont;
  String wordText = "DR. STRANGE";

  //loading fonts
  actorsFont = loadFont("Times-Italic-22.vlw");
  charactersFont = loadFont("AdobeHeitiStd-Regular-18.vlw");
  titleFont = loadFont("Times-Roman-40.vlw");

  //displays text
  textFont(actorsFont);

  for (int i = 0; i < actors.length; i++) {
    text(actors[i], width/8, (i*60) + 190);
  }

  textFont(charactersFont);
  textAlign(RIGHT, CENTER);

  charactersFont = loadFont("Helvetica-Bold-20.vlw");
  for (int i = 0; i < actors.length; i++) {
    text(characters[i], 525, (i*60) + 183);
  }

  textFont(titleFont);
  textAlign(CENTER);
  text(wordText, width/2, 60);




}
