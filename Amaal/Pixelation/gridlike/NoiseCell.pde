class NoiseCell implements ICell {
    int itsW, itsH;

    NoiseCell(int w, int h) {
        itsW = w;
        itsH = h;
    }

    int getHeight() {
        return itsH;
    }

    int getWidth() {
        return itsW;
    }

    void drawItem(int posX, int posY) {
        loadPixels();

        for (int y = 0; y < itsH; y++) {
            for (int x = 0; x < itsW; x++) {
                float r = random(255);
                pixels[(posY + y) * width + (posX + x)] = color(random(255), random(255), random(255));
            }
        }

        updatePixels();
    }
}
