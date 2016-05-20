class NoiseCell implements ICell {
        int itsW, itsH;
        boolean itsGrey;

        NoiseCell(int w, int h, boolean g) {
                itsW = w;
                itsH = h;
                itsGrey = g;
        }

        int getHeight() {
                return itsH;
        }

        int getWidth() {
                return itsW;
        }

        void drawItem(int posX, int posY) {
                loadPixels();
                for (int y = posY;  y  <  posY + itsH; y++){
                        for(int x = posX; x < itsW + posX; x++){

                                float r = random(255);
                                if(itsGrey){
                                        pixels[y * width + x] = color(r,0,r);
                                }
                                else{
                                        pixels[y * width + x] = color(0,r,r);
                                }

                        }

                }
                updatePixels();

        }
}
