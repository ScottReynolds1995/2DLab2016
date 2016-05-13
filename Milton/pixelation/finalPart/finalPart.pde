// grid properties
int COLS = 8;   // NOTE: rows will be calculated based on number of cols

// number of cells/objects to store in our array and draw
int OBJECTS_TO_DRAW = COLS * 3;

int fontSize = 42;

// Font for the tittle
PFont champagne;

PImage images[] = new PImage[8];

// list of objects in our grid to draw
IDrawableObject[] gridObjects = new IDrawableObject[OBJECTS_TO_DRAW];

int[] colourPallet = new int[OBJECTS_TO_DRAW];

String[] instructionText = new String[3];

float paddingPercent = 0.02;

boolean instructions = true;

int resetRad,
    resetX,
    resetY;
float resetPad;

//x
// SETUP ----------------------------------------------------------
//
void setup()
{

    instructionText[0] = "Click on the coloured rectangle to change the tint";
    instructionText[1] = "Click on the R to reset the tint";
    instructionText[2] = "This message will disapear when you choose a tint";

    ellipseMode(RADIUS);
    // Setting the sketch to be full screen
    fullScreen();

    // LOADING THE ACTUAL FONT FROM SYSTEM
    champagne = loadFont("Champagne&Limousines-Bold-48.vlw");

    // Loading pictures
    for (int i = 0; i < 8; i++) {
        String filename = "contemp" + i + ".jpg";
        images[i] = loadImage(filename);
    }

    // setting up colour pallette

    for(int idx = 0; idx < 8; idx++){
        colourPallet[idx] = color(0);
    }
    for(int index = 8; index < 16; index++){
        colourPallet[index] = color(255);
    }

    colourPallet[16] = color(222, 201, 156);
    colourPallet[17] = color(245, 199, 14);
    colourPallet[18] = color(123, 32, 37);
    colourPallet[19] = color(189, 87, 63);
    colourPallet[20] = color(199, 203, 212);
    colourPallet[21] = color(167, 140, 78);
    colourPallet[22] = color(223, 98, 9);
    colourPallet[23] = color(254, 247, 218);
    // colourPallet[12] = color(24, 63, 118);
    // colourPallet[13] = color(189, 87, 63);

    setupGridPositions(gridObjects, COLS, paddingPercent/*padding*/, 1/*grid scale*/);

    noStroke();
}

//
// DRAW ----------------------------------------------------------
//
void draw()
{
    loadPixels();
    background(0);

    // if (frameCount % 60 == 0) fill = color(random(255), random(255), random(255));
    // fill = color(0x80);

    //translate(mouseX,mouseY);

    // draw our cells
    for (int cell=0; cell < gridObjects.length; cell++)
    {
        gridObjects[cell].setColor(colourPallet[cell]);
        gridObjects[cell].draw();
    }

    drawTitle();
    drawReset();
    mouseClicked();
    if(instructions){
        drawInstructions();
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
    int paddingW = round(paddingPercent*tableWidth );
    //println(tableWidth);
    int tableHeight = round(scalePercent*height);
    //println(tableHeight);
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
        if (cell >= 8 && cell < 16) {
            cellObject = new PicDrawableObject(images[cell % 8]);
        } else {
            cellObject = new DrawableObject();
        }

        // colour all the cells - we could also make an array containing a color pallette and randomly
        // or purposefully pick form that
        //
        // colorMode(HSB);

        // 3 color - red, green, blue
        // row # -> 0,1,2
        int rowIndex = (row % 3);

        // println("mod 3:" + rowIndex);


        cellObject.setColor( colourPallet[cell] );

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


// NOTE: NEXT STEP!!!
//       The next step is to add the feature of picking the colour to use for the tint

void mouseReleased(){
    applyTint();
    resetTint();
}

void drawTitle(){

    int x = int(width * paddingPercent),
        yText =  fontSize + int(height * paddingPercent),
        yUnderline = yText + 3,
        yText2 = yUnderline + fontSize + 3; //int( (yUnderline + height * paddingPercent) + fontSize);

    rect(x ,yUnderline, width / 4.75, 2);

    textFont(champagne, fontSize);
    textAlign(LEFT, BOTTOM);
    fill(255);
    text("Man Made Structures", x, yText);

    text("And Reminiscent Colours", x, yText2);
    // rect(x -  2, yText2 + 2, width / 5, 1, 20);

}

void drawReset(){
    resetRad = fontSize / 2 + 5;
    resetX = width - int( paddingPercent * width + resetRad );
    resetY = int(paddingPercent * height) + resetRad;
    resetPad = 2;

    fill(255);
    ellipse(resetX, resetY, resetRad + resetPad , resetRad + resetPad );
    fill(0);
    ellipse(resetX, resetY, resetRad, resetRad);
    fill(255);
    textAlign(CENTER, CENTER);
    text("R", resetX, resetY);
}

// NOTE: Must apply reset functionality

void drawInstructions(){
    int tableWidth = round(1*width),
        paddingW = round(paddingPercent*tableWidth ),
        fontSize = 22,
        colWidth = int( (tableWidth-paddingW*(COLS+1))/COLS ),
        instructionsX = int( width - colWidth * 2 - (paddingPercent * width) * 2 ),
        startingY = int(height / 3);

        println(colWidth);

    textFont(champagne, fontSize);
    textAlign(LEFT, BOTTOM);
    // text("TEST", instructionsX, startingY);

    for(int index = instructionText.length - 1, y = startingY; index >= 0; index--, y = y - fontSize - 2 ){
        text(instructionText[index], instructionsX, y);
    }

}

void applyTint(){
    color fill;
    float R = red(get().pixels[mouseX + mouseY * width]),
          G = green(get().pixels[mouseX + mouseY * width]),
          B = blue(get().pixels[mouseX + mouseY * width]);

    println("R:" + R + " G:" + G + " B:" + B);

    fill = color(R,G,B);

    if(fill != color(0) && mouseY > height - height / 3){
        // println(fill);
        for(int i = 8; i < 16; i++){
            colourPallet[i] = fill;
        }
        for(int i : colourPallet){
            // println(i);
        }
        // println("cols");
        instructions = false;
    }
}

void resetTint(){
    if( (mouseX <= resetX + resetRad && mouseX >=  resetX - resetRad) && (mouseY <= resetY + resetRad && mouseY >=  resetY - resetRad) ){
        for(int i = 8; i < 16; i++){
            colourPallet[i] = color(255);
        }
    }
}
