/*
 * Demonstrates how to create a grid rawing function
 */


//
//  Basic something to draw, by default a rectangle
//

interface IDrawableObject {
  public void draw();
  public void setPosition(float xx, float yy);
  public void setSize(float ww, float hh);
  public void setColor(int cc);
}

class DrawableObject implements IDrawableObject {

  float x, y;
  float w=10, h=10; //arbitrary values so we see something when this is drawn
  int rectFill = color(255);

  public void setPosition(float xx, float yy) {
    x = xx;
    y = yy;
  }

  public void setSize(float ww, float hh) {
    w = ww;
    h = hh;
  }

  public void draw()
  {
    fill(rectFill);
    rectMode(CORNER);
    rect(x, y, w, h);
  }

  public void setColor(int cc)
  {
    rectFill = cc;
  }
}


class PicDrawableObject implements IDrawableObject {
  PImage img;
  float x, y;
  int imgTint = color(255);  // 0xFF FF FF FF

  PicDrawableObject(PImage myImage) {
    img = myImage;
    // println(img);
  }

  public void draw() {
    tint(imgTint);
    image(img, x, y);
  }

  public void setPosition(float xx, float yy) {
    x = xx;
    y = yy;
  }

  public void setSize(float ww, float hh) {
    img.resize((int) ww, (int) hh);
  }

  public void setColor(int cc)
  {
    imgTint = cc;
  }
}



// number of cells/objects to store in our array and draw
int OBJECTS_TO_DRAW = 36;

// grid properties
int COLS = 6;
// NOTE: rows will be calculated based on number of cols


// list of objects in our grid to draw
IDrawableObject[] gridObjects = new IDrawableObject[OBJECTS_TO_DRAW];

//
// SETUP ----------------------------------------------------------
//

PImage images[] = new PImage[30];

void setup()
{
  
  size(800,600);

  for (int i = 0; i < 30; i++) {
    String filename = i + ".jpg";
    images[i] = loadImage(filename);
  }

  setupGridPositions(gridObjects, COLS, 0.005/*padding*/, 1/*grid scale*/);

  noStroke();

}




//
// SETUP ----------------------------------------------------------
//

color f = 0;

void draw()
{
  background(0);
  
  // if (frameCount % 60 == 0) f = color(random(255), random(255), random(255));
  f = color(0x80);

  //translate(mouseX,mouseY);

  // draw our cells
  for (int cell=6; cell < gridObjects.length; cell++)
  {
    gridObjects[cell].draw();
  }
PFont font;
fill(255);
textAlign(CENTER);
 font = loadFont("Times-Italic-40.vlw");
textFont(font, 40);
text("The Shading Of Southbank", width/2, 75);
 
   
}


//----------------------------------------------------------------------
// update an array of grid cells based on the number of columns provided
// 
// Use percentage to scale grid width and height (0-100% or 0..1)
// 
void setupGridPositions( IDrawableObject[] gridObjects, final int columns, float paddingPercent, float scalePercent)
{
  int tableWidth = round(scalePercent*width);
  //println(tableWidth);
  int tableHeight = round(scalePercent*height);
  //println(tableHeight);
  int paddingW = round(paddingPercent*tableWidth );
  //println(paddingW);
  
  int paddingH = round(paddingPercent*tableHeight );
  
  int COL_WIDTH = (tableWidth-paddingW*(columns+1))/columns; // setup width of columns
  //println(COL_WIDTH);
  
  final int NUM_ROWS = gridObjects.length/columns;
  int ROW_HEIGHT = (tableHeight-paddingH*(NUM_ROWS+1))/NUM_ROWS;
  
 
  // position our cells in a 4x3 (4 col x 3 row) grid
  for (int cell=0; cell < gridObjects.length; cell++)
  {
    // figure out column & row for this cell

    // wrap around the number of elements per column
    int col = cell % COLS;

    // we want the smallest whole number that this index divides into to
    // get the row
    int row = cell/COLS;

    print("col=" + col);
    println(", row=" + row);

    // create new cell object and put in array
    IDrawableObject cellObject;
    // if (cell % 2 == 0) {
    //     cellObject = new PicDrawableObject(images[cell / 2]);
    //
    // }
    if (cell <30) {
      cellObject = new PicDrawableObject(images[cell]);
    } else {
      cellObject = new DrawableObject();
    }

    // colour all the cells - we could also make an array containing a color pallette and randomly 
    // or purposefully pick form that
    // 
    colorMode(HSB);

    // 3 color - red, green, blue
    // row # -> 0,1,2
    int rowIndex = (row % 5 );

    println("mod 5:" + rowIndex);

    switch(rowIndex)
    {
    case 0:
      {
        cellObject.setColor( color(255) );
        break;
      }      

    case 1:
      {
        cellObject.setColor( color(0) );
        break;
      }

  
   case 2:
      {
        cellObject.setColor( color(108, 235, 193) );
        break;
      }
   case 3:
      {
        cellObject.setColor( color(58,185,143) );
        break;
      }
 case 4:
      {
        cellObject.setColor( color(8, 135,93) );
        break;
      }

      }
    


    // set the cell's position based on row/col
    // cellObject.x = COL_WIDTH*col;
    // cellObject.y = ROW_HEIGHT*row;
    cellObject.setPosition((COL_WIDTH+paddingW)*col+paddingW /*x*/, 
                           (ROW_HEIGHT+paddingH)*row+paddingH /*y*/);

    // cellObject.w = COL_WIDTH;
    // cellObject.h = ROW_HEIGHT;
    cellObject.setSize(COL_WIDTH, ROW_HEIGHT);
    gridObjects[cell] = cellObject; // put it in the array
    //    println("x="+gridObjects[cell].x);
  }
}