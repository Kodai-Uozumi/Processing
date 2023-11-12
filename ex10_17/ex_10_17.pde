PImage original;
PImage img;
PImage backupImg;
int radius=10;
void setup() {
  original = loadImage("WIN_20201207_00_17_31_Pro.jpg");
  img = createImage(original.width, original.height, ARGB);
  backupImg = createImage(original.width, original.height, ARGB);
  surface.setResizable(true);
  surface.setSize(img.width, img.height);
  original.loadPixels();
  img.loadPixels();
  for (int y=0; y<original.height; y++) {
    for (int x=0; x<original.width; x++) {
      int loc = x + width * y;
      float r = red(original.pixels[loc]);
      float g = green(original.pixels[loc]);
      float b = blue(original.pixels[loc]);
      img.pixels[loc]=color(r, g, b, 255);  //アルファは255(不透明)
    }
  }
  img.updatePixels();
}
void draw() {
  bgPattern();
  if (mousePressed) {
    img.loadPixels();
    for (int y=0; y<img.height; y++) {
      for (int x=0; x<img.width; x++) {
        int loc = x + width * y;
        float distance = dist(x, y, mouseX, mouseY);
        float r = red(img.pixels[loc]);
        float g = green(img.pixels[loc]);
        float b = blue(img.pixels[loc]);
        float alpha = alpha(img.pixels[loc]);
        if (distance < radius) { alpha = 0; }    //円の中はアルファを0にする
        img.pixels[loc]=color(r, g, b, alpha);
      }
    }
    img.updatePixels();
  }
  image(img, 0, 0, width, height);
  noFill();
  stroke(255, 0, 0);
  ellipse(mouseX, mouseY, radius*2, radius*2);
}
void bgPattern() {
  background(100);
  int ptWidth=20;
  noStroke();
  fill(150);
  for (int y=0; y<height/ptWidth; y++) {
    for (int x=0; x<width/ptWidth; x++) {
      if ((x+y)%2==0) {
        rect(x*ptWidth, y*ptWidth, ptWidth, ptWidth);
      }
    }
  }
}
void mousePressed() {
  backupImg = img.copy();  //変更前の画像を保持
}
void keyPressed() {
  if (key=='b') {
    img = backupImg.copy();  //一度だけは元に戻せる
  }
  if (key=='s') {
    backupImg = img.copy();
    backupImg.save("clipedImage.png");
    println("saved");
  }
  if (key==CODED) {
    if (keyCode == UP) {
      radius ++;
    } else if (keyCode == DOWN) {
      radius --;
    }
  }
}
