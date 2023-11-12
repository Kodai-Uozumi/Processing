import processing.sound.*;
SoundFile files[] = new SoundFile[5];
int fileNo=0;
float rate[] = new float[16];
int bgColor[] = {255, 255, 255};
void setup() {
  size(640, 360);
  files[0] = new SoundFile(this,"do.wav");
  files[1] = new SoundFile(this,"re.wav");
  files[2] = new SoundFile(this,"mi.wav");
  files[3] = new SoundFile(this,"fa.wav");
  files[4] = new SoundFile(this,"so.wav");
  for(int i=0;i<16;i++){
    rate[i]=pow(2,i/12.0);
  }
}
void draw() {
  background(bgColor[0], bgColor[1], bgColor[2]);
}
void keyPressed() {
  boolean validKey = true;
  files[fileNo].stop();
  switch(key) {
  case 'z':
    files[fileNo].play(rate[0], 1.0);
    break;
  case 's':
    files[fileNo].play(rate[1], 1.0);
    break;
  case 'x':
    files[fileNo].play(rate[2], 1.0);
    break;
  case 'c':
    files[fileNo].play(rate[3], 1.0);
    break;
  case 'f':
    files[fileNo].play(rate[4], 1.0);
    break;
  case 'v':
    files[fileNo].play(rate[5], 1.0);
    break;
  case 'g':
    files[fileNo].play(rate[6], 1.0);
    break;
  case 'b':
    files[fileNo].play(rate[7], 1.0);
    break;
  case 'n':
    files[fileNo].play(rate[8], 1.0);
    break;
  case 'j':
    files[fileNo].play(rate[9], 1.0);
    break;
  case 'm':
    files[fileNo].play(rate[10], 1.0);
    break;
  case 'k':
    files[fileNo].play(rate[11], 1.0);
    break;
  case ',':
    files[fileNo].play(rate[12], 1.0);
    break;    
  case 'l':
    files[fileNo].play(rate[13], 1.0);
    break;    
  case '.':
    files[fileNo].play(rate[14], 1.0);
    break;    
  case '/':
    files[fileNo].play(rate[15], 1.0);
    break;    
  default:  // 対応していないキー
    validKey = false; 
  } // switchはここまで
  if (validKey) {
    for (int i = 0; i < 3; i++) {
      bgColor[i] = int(random(255));
    }
  }
}
void mousePressed(){
  fileNo = (fileNo+1)%files.length;
}
