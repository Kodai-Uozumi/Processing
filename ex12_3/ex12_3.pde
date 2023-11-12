Catcher catcher;
void setup(){
  size(400,400);
  catcher = new Catcher(32);
  smooth();    //スムースな線を引く関数
}
void draw() {
  background(255);
  catcher.setLocation(mouseX,mouseY);
  catcher.display();
}
