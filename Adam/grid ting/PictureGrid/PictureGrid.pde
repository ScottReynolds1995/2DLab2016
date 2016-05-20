/*
 * Demonstrates how to create a grid rawing function
 */



// 
// SETUP ----------------------------------------------------------
//
void setup()
{
  size(1000,1000);

  setupGridPositions(gridObjects, COLS);


  // loading images into document and an array
  PImage[] ThamesPictures = new PImage[20];

  for (int Im = 1; Im < ThamesPictures.length; Im++) 
  {
    ThamesPictures[Im] = loadImage(Im + ".jpg");
    
  }
  
  image(ThamesPictures[0],10,10,2,h);

}

// 
// SETUP ----------------------------------------------------------
//



//
//  Basic something to draw, by default a rectangle
//
class DrawableObject {

  float x, y;
  float w=10, h=10; //arbitrary values so we see something when this is drawn

  public void draw()
  {
    rectMode(CORNER);
    rect(x, y, w, h);
    
    imageMode(CORNER);
    //image(ThamesPictures[1],x,y,w,h);
  }
}



// number of cells/objects to store in our array and draw
int OBJECTS_TO_DRAW = 16;

// grid properties
int COLS = 4;
// NOTE: rows will be calculated based on number of cols


// list of objects in our grid to draw
DrawableObject[] gridObjects = new DrawableObject[OBJECTS_TO_DRAW];


color f = 0;



void draw()
{

  // draw our cells
  for (int cell=0; cell < gridObjects.length; cell++)
  {  

    gridObjects[cell].draw();
  }


  //fill(f);
  //drawGridAt(mouseX, mouseY, gridObjects);
}


//----------------------------------------------------------------------
// update an array of grid cells based on the number of columns provided
//
void setupGridPositions( DrawableObject[] gridObjects, final int columns ) 
{
  int COL_WIDTH = (width - (width/5))/columns; // setup width of columns
  final int NUM_ROWS = gridObjects.length/columns;
  int ROW_HEIGHT = (height - (height/5))/NUM_ROWS;

  // position our cells in a 4x3 (4 col x 3 row) grid
  for (int cell=0; cell < gridObjects.length; cell++)
  {
    // figure out column & row for this cell 

    // wrap around the number of elements per column
    int col = cell % COLS;

    // we want the smallest whole number that this index divides into to
    // get the row
    int row = cell/COLS;

    // create new cell object and put in array
    DrawableObject cellObject = new DrawableObject();
    // set the cell's position based on row/col
    cellObject.x = COL_WIDTH*col;
    cellObject.y = ROW_HEIGHT*row;

    cellObject.w = COL_WIDTH;
    cellObject.h = ROW_HEIGHT;

    gridObjects[cell] = cellObject; // put it in the array
    //    println("x="+gridObjects[cell].x);
  }
}


//----------------------------------------------------------------------
// draw the grid at a specific position
// quite useless, but fun
////

void drawGridAt(int x, int y, DrawableObject[] gridObjects)
{
 pushMatrix();
 translate(x + (width/5), y + (height/5));
 // draw our cells
 for (int cell=0; cell < gridObjects.length; cell++)
 {  
   gridObjects[cell].draw();
 }
 popMatrix();
}