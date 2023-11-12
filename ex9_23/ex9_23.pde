import processing.sound.*;
SoundFile files[] = new SoundFile[9];
color[] panelColor = {
  color(255, 0, 0), color(255, 128, 0), color(255, 255, 0), 
  color(0, 255, 0), color(0, 128, 0), color(0, 255, 255), 
  color(0, 0, 255), color(128, 0, 255), color(255, 0, 128)};
float[] brightness = {100, 100, 100, 100, 100, 100, 100, 100, 100}; 
PFont myFont;
int gameState=0;
int[] memory = new int[255];
int strageNo;      //いくつ覚えたか
int reproductionNo;  
int pastTime;      //タイマー用
int setTime=500;    //提示する時間間隔

void setup(){
  size(600,600);
  myFont = createFont("MS Gothic", 32);
  textFont(myFont);
  for(int i=0;i<9;i++){
    files[i] = new SoundFile(this,"rec"+i+".wav");
  }
}
void draw(){
  background(0);
  drawPanels();
  switch(gameState){
  case 0:
    drawTitle();
    break;
  case 1:
    drawStrageScene();
    break;
  case 2:
    break;
  case 3:
    drawWaitingTransScene();
    break;
  }
}
void drawPanels(){
  rectMode(CORNER);
  for(int i=0;i<9;i++){
    fill(panelColor[i],brightness[i]);
    brightness[i]-=4;
    if (brightness[i]<100) brightness[i]=100;
    rect((i%3)*width/3,2*height/3-(int)(i/3)*height/3,width/3,height/3);
  }
}
void drawTitle() {
  textSize(50);
  textAlign(CENTER);
  fill(255);
  text("Press the mouse button", width/2, height/2);
  if (strageNo>0)
    text("Score:"+(strageNo-1), width/2, height/2+50);
}
void mousePressed() {
  if (gameState==0) {
    gameState=1;
    pastTime=millis();
    strageNo=0;
    reproductionNo=0;
    addNumber();
  }
  if (gameState==2) {
    int x=(int)(mouseX/(width/3));
    int y=2-(int)(mouseY/(height/3));
    int inputPanel = y*3+x;      //押したパネルの番号
    brightness[inputPanel]=255;   //押したパネルを点灯
    judgeAnswer(inputPanel);    //答えの判定
    files[inputPanel].play();
  }
}
void drawStrageScene(){
  if (timer()) {
    if (reproductionNo>=strageNo) {
      gameState=2;
      reproductionNo=0;
    } else {
      brightness[memory[reproductionNo]]=255;
      files[memory[reproductionNo]].play();
      reproductionNo++;
    }
  }
}
void drawWaitingTransScene() {
  if (timer()) {
    gameState=1;     
    pastTime=millis();
    addNumber();
    reproductionNo=0;
  }
}
boolean timer() {
  if (millis()-pastTime>setTime) {
    pastTime=millis();
    return(true);
  }
  return(false);
}
void addNumber(){
  memory[strageNo]=int(random(0, 9));
  strageNo++;
}
void judgeAnswer(int inputPanel) {
  if (memory[reproductionNo]==inputPanel) {
    print("[good]");
    reproductionNo++;
    if (reproductionNo>=strageNo) {
      gameState=3;
      pastTime=millis();
      println();
    }
  } else {
    gameState=0;
  }
}
