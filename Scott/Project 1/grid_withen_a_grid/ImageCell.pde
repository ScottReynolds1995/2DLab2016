class ImageCell implements ICell {
    PImage itsImage;

    ImageCell(String filename) {
        itsImage = loadImage(filename);
    }

    int getHeight() { return itsImage.height; }
    int getWidth() { return itsImage.width; }

    void drawItem(int posX, int posY) {
        image(itsImage, posX, posY);
    }
}