class SideBySide implements ICell {
    ICell itsCellA, itsCellB;

    SideBySide(ICell cellA, ICell cellB) {
        itsCellA = cellA;
        itsCellB = cellB;
    }

    int getHeight() {
        return max(itsCellA.getHeight(), itsCellB.getHeight());
    }

    int getWidth() {
        return itsCellA.getWidth() + itsCellB.getWidth();
    }

    void drawItem(int posX, int posY) {
        itsCellA.drawItem(posX, posY
                                - itsCellA.getHeight() / 2
                                + getHeight() / 2);
        itsCellB.drawItem(posX + itsCellA.getWidth(),
                          posY
                          - itsCellB.getHeight() / 2
                          + getHeight() / 2);
    }
}
