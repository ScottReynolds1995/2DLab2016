//import ImageGrid;
ICell mainGrid;
ICell mainGrid1;
ICell mainGrid2;
void setup() {
    size(1024, 1024);
    // mainGrid = new Grid(new ICell[] {
    //     new ImageCell("clouds.jpg"),
    //     new ImageCell("crate200.jpg"),
    //     new ImageCell("170x150-alignleft-size-thumbnail.gif"),
    //     new ImageCell("cla170.jpg"),
    //     new ImageCell("cropped-IMG_0969.jpg"),
    //     new ImageCell("dfid-170-170x150.jpg"),
    //     new ImageCell("FieldScreenSnapz014.jpg")
    // });


    //mainGrid = new ImageCell("clouds.jpg");
    mainGrid = new PlainColourCell (300, 200, color (255, 0 ,0));
    mainGrid1 = new PlainColourCell (300, 200, color (255, 78 ,67));
    mainGrid2 = new PlainColourCell (300, 200, color (255, 178 ,167));
}


void draw() {
    clear();
    mainGrid.drawItem(0, 0);
    mainGrid1.drawItem(200, 200);
    mainGrid2.drawItem(400, 400);
}