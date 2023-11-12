float x = 0;
float speed = 1;
void setup() {
  size(200,200);
  smooth();
}
void draw() {
  background(255);
  move(mouseX/10);     //円を移動
  bounce();    //円を端でバウンド
  display();    //円を表示  
}
void move(float speedFactor){
  x = x + (speed*speedFactor);
}
void bounce(){
  if ((x > width) || (x < 0)) {
    speed = speed * -1;
  }
}
void display(){
  float y=100;
  rectMode(CENTER);
  noFill();
  stroke(0);
  ellipse(x,y,32,32);
  fill(255);
  rect(x-4,y-4,4,4);
  rect(x+4,y-4,4,4);
}
