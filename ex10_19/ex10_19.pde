PImage bgImg;
PImage fgImg;
float scale=1;
int fgPositionX;
int fgPositionY;
void setup() {
  bgImg = loadImage("WIN_20201207_00_19_25_Pro.jpg");
  fgImg = loadImage("clipedImage.png");
  surface.setResizable(true);
  surface.setSize(bgImg.width,bgImg.height);
  imageMode(CENTER);
  fgPositionX = fgImg.width/2;
  fgPositionY = fgImg.height/2;
}
void draw() {
  background(0);
  tint(255);
  image(bgImg,width/2,height/2);
  float adjustBrightness = map(mouseX, 0, width, 0, 255);
  tint(adjustBrightness);
  image(fgImg,fgPositionX,fgPositionY,fgImg.width*scale,fgImg.height*scale);
}
void keyPressed() {
  if (key=='s') {
    save("margedImage.png");
    println("saved");
  }
  if (key=='z') {
    scale-=.1;
  }
  if (key=='x') {
    scale+=.1;
  }
  if (key==CODED) {
    if (keyCode == UP) {
      fgPositionY --;
    } else if (keyCode == DOWN) {
      fgPositionY ++;
    } else if (keyCode == LEFT) {
      fgPositionX --;
    } else if (keyCode == RIGHT) {
      fgPositionX ++;
    }
  }
}
