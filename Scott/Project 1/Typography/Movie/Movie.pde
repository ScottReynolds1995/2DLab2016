


void setup(){
  size(700,700);
  background(#faf3e6);
}

void draw(){

  rectMode(CENTER);
 rect( 350, 50, 400, 10);
 rect( 350, 100, 400, 10);
 rect( 350, 600, 400, 10);
 rect( 350, 650, 400, 10);
 textSize(25);
 textAlign(CENTER);
 text("Zombieland (2009)", 350, 85);
 text("NUT UP OR SHUT UP", 350, 635);
 
 fill(0);
 String[] actors = new String [7];
 actors[0] = "Jesse Eisenberg";
 actors[1] = "Woody Harrelson";
 actors[2] = "Emma Stone ";
 actors[3] = "Abigail Breslin";
 actors[4] = "Amber Heard";
 actors[5] = "Bill Murray";
 actors[6] = "Derek Graf";

for (int i = 0; i<7; i++) {
textAlign(LEFT);
textSize(18);
text(actors[i], 175,( i * 60) + 160);
}
  


String[] cast = new String [7];
cast [0] = "Columbus";
cast [1] = "Tallahassee";
cast [2] = "Wichita";
cast [3] = "Little Rock";
cast [4] = "406";
cast [5] = "Bill Murray";
cast [6] = "Clown Zombie";
for (int i = 0; i<7; i++) {
textAlign(RIGHT);
textSize(18);

text(cast[i], 525,( i * 60) + 160);
}
 
  for (int i = 0; i<7; i++) {
  fill(0);
  stroke(10);
  line(175 + textWidth(actors[i]),(i*60)+160, 525 - textWidth(cast[i]), ( i * 60) + 160);
  }
 
   
  for (int i = 0; i<7; i++) {
  fill(0);
  stroke(10);
  ellipse(175 + textWidth(actors[i]),(i*60)+160, 5, 5);
  
  }


 }
 