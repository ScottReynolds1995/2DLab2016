class Grid implements ICell {
    final int CELLS_WIDTH = 4;
    final int CELLS_HEIGHT = 4;

    // Build a grid from an array of cells.
    // How would we lay out 16 cells in a 4x4 matrix?
    // (Four rows of 4.)
    // What if there are fewer, or more, than 16?
    // (We could fill with a BlankCell type.)
    Grid(ICell[] cells) {
    }

    int getHeight() {
        return 0;
    }

    int getWidth() {
        return 0;
    }

    void drawItem(int posX, int posY) {
    }
}
