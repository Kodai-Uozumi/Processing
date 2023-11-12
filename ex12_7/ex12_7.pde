Ball ball1;    //Ball#1
Ball ball2;    //Ball#2
void setup() {
  size(400,400);
  smooth();
  ball1 = new Ball(64);
  ball2 = new Ball(32);
}
void draw() {
  background(255);
  ball1.move();
  ball2.move();
  if (ball1.intersect(ball2)) {  //ball1とball2が交錯？
    ball1.highlight();    //ball1の色を強調する
    ball2.highlight();    //ball2の色を強調する
  }
  ball1.display();
  ball2.display();
}
