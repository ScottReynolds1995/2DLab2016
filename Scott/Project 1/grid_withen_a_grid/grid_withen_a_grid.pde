//import ImageGrid;
ICell mainGrid;

void setup() {
    size(1024, 512);
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
    mainGrid = new PlainColourCell(300, 200, color(255, 0, 0));
}

void draw() {
    clear();
    mainGrid.drawItem(width / 2 - mainGrid.getWidth() / 2,
                      height / 2 - mainGrid.getHeight() / 2);
}