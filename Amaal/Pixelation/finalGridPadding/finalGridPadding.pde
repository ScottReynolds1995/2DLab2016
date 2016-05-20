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
  int rectFill = color(0);

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
int OBJECTS_TO_DRAW = 20;

// grid properties
int COLS = 5;
// NOTE: rows will be calculated based on number of cols


// list of objects in our grid to draw
IDrawableObject[] gridObjects = new IDrawableObject[OBJECTS_TO_DRAW];

//
// SETUP ----------------------------------------------------------
//

PImage images[] = new PImage[18];

void setup()
{
  // size(950, 700);
  fullScreen();
  for (int i = 0; i < 18; i++) {
    String filename = "nat" + i + ".jpg";
    images[i] = loadImage(filename);
  }

  setupGridPositions(gridObjects, COLS, 0.025/*padding*/, 1/*grid scale*/);

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
  for (int cell=0; cell < gridObjects.length; cell++)
  {
    gridObjects[cell].draw();
  }


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

    // print("col=" + col);
    // println(", row=" + row);

    // create new cell object and put in array
    IDrawableObject cellObject;
    // if (cell % 2 == 0) {
    //     cellObject = new PicDrawableObject(images[cell / 2]);
    //
    // }
    if (cell < 18 && cell != 2 && cell != 3
        && cell != 4 && cell != 8 && cell != 9
        && cell != 14) {
      cellObject = new PicDrawableObject(images[cell]);
    }


    else {
      cellObject = new DrawableObject();
    }

    if (cell== 0) {
      cellObject = new PicDrawableObject(images[6]);
    }
    if (cell== 5) {
      cellObject = new PicDrawableObject(images[5]);
    }

    if (cell== 6) {
      cellObject = new PicDrawableObject(images[4]);
    }


    if (cell== 7) {
      cellObject = new PicDrawableObject(images[3]);
    }

    if (cell== 10) {
      cellObject = new PicDrawableObject(images[8]);
    }

    if (cell== 11) {
      cellObject = new PicDrawableObject(images[9]);
    }


    if (cell== 12) {
      cellObject = new PicDrawableObject(images[16]);
    }

    if (cell== 13) {
      cellObject = new PicDrawableObject(images[7]);
    }

    if (cell== 15) {
      cellObject = new PicDrawableObject(images[17]);
    }

    if (cell== 16) {
      cellObject = new PicDrawableObject(images[12]);
    }

    if (cell== 17) {
      cellObject = new PicDrawableObject(images[15]);
    }

    if (cell== 18) {
      cellObject = new PicDrawableObject(images[14]);
    }


    if (cell== 19) {
      cellObject = new PicDrawableObject(images[11]);
    }



    // colour all the cells - we could also make an array containing a color pallette and randomly
    // or purposefully pick form that
    //
    // colorMode(HSB);

    // 3 color - red, green, blue
    // row # -> 0,1,2
    // int rowIndex = (row % 3);
    //
    // println("mod 3:" + rowIndex);
    //
    // switch(rowIndex)
    // {
    // case 0:
    //   {
    //     cellObject.setColor( color(120, 255, 255) );
    //     break;
    //   }
    //
    // case 1:
    //   {
    //     cellObject.setColor( color(0, 255, 220) );
    //     break;
    //   }
    //
    // case 2:
    //   {
    //     cellObject.setColor( color(240, 255, 255) );
    //     break;
    //   }
    // }


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
