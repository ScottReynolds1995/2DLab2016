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
}

class DrawableObject implements IDrawableObject {

  float x, y;
  float w=10, h=10; //arbitrary values so we see something when this is drawn

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
    rectMode(CORNER);
    rect(x, y, w, h);
  }
}

class PicDrawableObject implements IDrawableObject {
  PImage img;
  float x, y;

  PicDrawableObject(PImage myImage) {
    img = myImage;
    // println(img);
  }

  public void draw() {
    image(img, x, y);
  }

  public void setPosition(float xx, float yy) {
    x = xx;
    y = yy;
  }

  public void setSize(float ww, float hh) {
    img.resize((int) ww, (int) hh);
  }
}



// number of cells/objects to store in our array and draw
int OBJECTS_TO_DRAW = 12;

// grid properties
int COLS = 4;
// NOTE: rows will be calculated based on number of cols


// list of objects in our grid to draw
IDrawableObject[] gridObjects = new IDrawableObject[OBJECTS_TO_DRAW];

//
// SETUP ----------------------------------------------------------
//

PImage images[] = new PImage[4];
void setup()
{
  size(600, 600);

  for (int i = 0; i < 4; i++) {
    String filename =  i + ".jpg";
    images[i] = loadImage(filename);
  }

  setupGridPositions(gridObjects, COLS);

  noStroke();
}



//
// SETUP ----------------------------------------------------------
//

color f = 0;

void draw()
{
  // if (frameCount % 60 == 0) f = color(random(255), random(255), random(255));
  f = color(0x80);

  // draw our cells
  for (int cell=0; cell < gridObjects.length; cell++)
  {
    // let's say that cell 6 (row 2 col 3) is always purple
    if ( cell == 0 ) {
      fill(200);
    } else
    {
      fill(200);
    }

    gridObjects[cell].draw();
  }

  //fill(f);
  //drawGridAt(mouseX, mouseY, gridObjects);
}


//----------------------------------------------------------------------
// update an array of grid cells based on the number of columns provided
//
void setupGridPositions( IDrawableObject[] gridObjects, final int columns )
{
  int COL_WIDTH = width/columns; // setup width of columns
  final int NUM_ROWS = gridObjects.length/columns;
  int ROW_HEIGHT = height/NUM_ROWS;

  // position our cells in a 4x3 (4 col x 3 row) grid
  for (int cell=0; cell < gridObjects.length; cell++)
  {
    // figure out column & row for this cell

    // wrap around the number of elements per column
    int col = cell % COLS;

    // we want the smallest whole number that this index divides into to
    // get the row
    int row = cell/COLS;

    //print("col=" + col);
    //println(", row=" + row);

    // create new cell object and put in array
    IDrawableObject cellObject;
    // if (cell % 2 == 0) {
    //     cellObject = new PicDrawableObject(images[cell / 2]);
    //
    // }
    if (cell == 0) {
      cellObject = new PicDrawableObject(images[0]);
    } else if (cell == 5) {
      cellObject = new PicDrawableObject(images[1]);
    } else if (cell == 6) {
      cellObject = new PicDrawableObject(images[2]);
    } else if (cell == 11) {
      cellObject = new PicDrawableObject(images[3]);
    } else {
      cellObject = new DrawableObject();
    }
    // set the cell's position based on row/col
    // cellObject.x = COL_WIDTH*col;
    // cellObject.y = ROW_HEIGHT*row;
    cellObject.setPosition(COL_WIDTH*col, ROW_HEIGHT*row);

    // cellObject.w = COL_WIDTH;
    // cellObject.h = ROW_HEIGHT;
    cellObject.setSize(COL_WIDTH, ROW_HEIGHT);
    gridObjects[cell] = cellObject; // put it in the array
    //    println("x="+gridObjects[cell].x);
  }
}