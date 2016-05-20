PFont champagne;
PFont fira;

void setup() {
  size(940, 800);
  background(250, 243, 230);

  champagne = loadFont("Champagne&Limousines-Bold-48.vlw");
  fira = loadFont("FiraSans-Medium-48.vlw");
}

void draw() {
  background(250, 243, 230);
  fill(0);
  rect(150,10, 640, 10);

  textFont(fira, 42);
  textAlign(CENTER, CENTER);
  text("Old Boy", 470, 45);
  rect(150,70, 640, 10);

  text(xNumberOfChar(90, "."), 470, 120);

}

String xNumberOfChar(int x, String charecter){
        String retChar = "";
        for(int i = 0; retChar.length() <= x ; i++){
                retChar = retChar + charecter;
        }

        return retChar;
}
