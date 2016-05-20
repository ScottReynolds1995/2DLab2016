
public void setup() {

fullScreen();
}

public void draw(){
        loadPixels();

        for (int y = 0;  y  <  height; y++){
                for(int x = 0; x < width; x++){
                        float r = random(255);
                        pixels[y * width + x] = color(r,0, r);
                }
        }
        updatePixels();
}
