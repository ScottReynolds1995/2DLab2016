class SideBySide implements ICell {
  ICell itsCellA, itsCellB;
  
  SideBySide(ICell cellA, ICell cellB){
    itsCellA = cellA;
    itsCellB = cellB;
  }
  
  int getHeight (){
    return itsCellA.getHeight() + itsCellB.getHeight ();
  }
  
  void drawItem (int posX, int posY) {
    