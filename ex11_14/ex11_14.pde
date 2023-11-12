PImage bgImg;
Sprite[] chars = new Sprite[50];
void setup() {
  bgImg= loadImage("WIN_20201207_00_19_25_Pro.jpg");
  surface.setResizable(true);
  surface.setSize(bgImg.width,bgImg.height);
  for(int i=0;i<chars.length;i++){
    chars[i] = new Sprite("clipedImage.png", random(width),random(height),100,100);
  }
}
void draw() {
  background(100);
  imageMode(CORNER);
  image(bgImg,0,0);
  for(int i=0;i<chars.length;i++){
    chars[i].display();
    chars[i].move();
    chars[i].bounce();
  }
}
class Sprite {
  PImage img;
  float x;
  float y;
  float speedX;
  float speedY;
  float sizeX;
  float sizeY;
  Sprite(String _fileName, float _x, float _y, float _sizeX, float _sizeY) {
    img = loadImage(_fileName);
    x = _x;
    y = _y;
    sizeX = _sizeX;
    sizeY = _sizeY;
    speedX = random(-4,4);
    speedY = random(-4,4);
  }
  void display() {
    imageMode(CENTER);
    image(img, x, y, sizeX, sizeY);
  }
  void move() {
    x += speedX;
    y += speedY;
  }
  void bounce(){
    if ((x > width) || (x < 0)) {
      speedX = speedX * -1;
    }
    if ((y > height) || (y < 0)) {
      speedY = speedY * -1;
    }
  }
}
