import processing.sound.*;
SoundFile file;
int pitchNo=0;
int bgColor[] = {255, 255, 255};
void setup() {
  size(640, 360);
  file= new SoundFile(this,"a.wav");
}
void draw() {
  background(bgColor[0], bgColor[1], bgColor[2]);
}
void keyPressed() {
  float rate = pow(2,pitchNo/12.0);
  file.play(rate);
  pitchNo = (pitchNo+1) % 13;
  for (int i = 0; i < 3; i++) {
    bgColor[i] = int(random(255));
  }
}
