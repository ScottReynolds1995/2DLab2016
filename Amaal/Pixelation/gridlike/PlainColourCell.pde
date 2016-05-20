class PlainColourCell implements ICell {
    int itsW, itsH;
    color itsC;

    PlainColourCell(int w, int h, color c) {
        itsW = w;
        itsH = h;
        itsC = c;
    }

    int getHeight() {
        return itsH;
    }

    int getWidth() {
        return itsW;
    }

    void drawItem(int posX, int posY) {
        fill(itsC);
        noStroke();
        rect(posX, posY, itsW, itsH);
    }
}
