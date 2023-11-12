PFont myFont;
int gameState;
String invaderString="";
int timer=1000;
int savedTime;
int myStarship=0;
int myScore=0;
void setup(){
  size(500,100);
  myFont = createFont("MS Gothic",50);
  textFont(myFont,50);
  gameState = 0;
}
void draw(){
  background(0);
  switch(gameState){
  case 0:
    drawTitle();
    drawScore();
    break;
  case 1:
    addInvader();
    drawInvader();
    drawMyStarship();
    drawScore();
    judgeInvader();
    break;
  }
}
void drawTitle(){
  textAlign(CENTER);
  fill(255);
  text("NuInvader:Push ENTER",width/2,height/2);
}
void keyPressed(){
  switch(gameState){
  case 0:
    if(key==ENTER||key==RETURN){
      gameState = 1;
      myScore=0;
      resetTimer();
    }
    break;
  case 1:
    if(key==ENTER||key==RETURN){
      shootNumber();
    }else if(key==' '){
      changeMyStarship();
    }
    break;
  }
}
void drawInvader(){
  fill(255);
  textAlign(RIGHT);
  text(invaderString,width,50);
}
void addInvader() {
  if(timer()){
    invaderString+=char(int(random('0', '9'+1)));
  }
}
boolean timer(){
  if ((millis()-savedTime)>=timer) {
    resetTimer();
    return(true);
  } else {
    return(false);
  }
}
void resetTimer(){
  savedTime=millis();
}
void drawMyStarship() {
  fill(255);
  textAlign(LEFT);
  String str=myStarship+":";
  text(str, 0, 50);
}
void changeMyStarship() {
  myStarship = (myStarship+1)%10;
}
void shootNumber() {
  String str="";
  for (int i=0; i<invaderString.length(); i++) {
    char ci = invaderString.charAt(i);
    if (myStarship!=int(ci)-'0') {
      str+=ci;
    } else {
      myScore++;
    }
  }
  invaderString = str;
  myStarship=0;
}
void drawScore() {
  textAlign(LEFT);
  text("Score:"+myScore, 0, 100);
}
void judgeInvader() {
  if (invaderString.length()>18) {
    gameState=0;
    invaderString="";
  }
}
