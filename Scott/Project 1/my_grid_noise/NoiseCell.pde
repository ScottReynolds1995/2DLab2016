class NoiseCell implements ICell {
 
  int itsW, itsH;
 
  NoiseCell (int w, int h){
   itsW = w;
   itsH = h;
   
 }
  int getHeight(){
    return itsH;
 }
    int getWidth(){
      return itsW;
    }
    void drawItem(int posX, int posY){  
      
      loadPixels();

    for ( int y = posY; y < itsH + posY; y++) {
        for (int x = posX; x < itsW + posX; x++) {
            pixels[y * width + x] = color(random(255), random(255), random(255));
        }
    }

    updatePixels();
}
   
  
}
    