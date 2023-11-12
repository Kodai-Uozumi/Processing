String txt="アミメニシキヘビオオアナコンダキングコブラアオダイショウ";
PFont myFont;
float tx;
void setup(){
  size(600,300);
  myFont = createFont("游明朝 Light",30);
  textFont(myFont,30);
  tx = width;
}
void draw(){
  background(255);
  fill(100);
  textAlign(LEFT);
  drawText(txt,tx,height/2);
  tx -= 1;
  if(tx < -textWidth(txt)){
    tx = width;
  }
}
void drawText(String t, float mx, float my){
  float x=0,y=0;
  float amplitude=100;
  float waveLength1=20;
  float waveLength2=900;
  for(int i=0;i<t.length();i++){
    char c=t.charAt(i);
    y = (amplitude-i) * cos(2*PI*i/waveLength1) * 
                                     sin(2*PI*millis()/waveLength2);
    text(c, mx+x, my+y);
    x = x + textWidth(c);
  }
}
