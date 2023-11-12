int x0 = 20;
int y0 = 20;
int tableX = 300;
int tableY = 200;
int r = 20;
int x = 0;
int y = 0;
int vx = 1;
int vy = 1;
int count = 0;
boolean pocketed = false;
void setup() {
  size(800, 800);
}
 
void draw() {
  background(255);
  drawTable();
  drawBall();
  if(pocketed == false){
    moveBall();
  }
}
void drawTable() {
  stroke(0);
  fill(255,0,0);
  rect(x0, y0, tableX, tableY);
  stroke(0, 255, 0);
  fill(0, 0, 255);
  ellipse(x0, y0, r, r);
  ellipse(x0, y0 + tableY, r, r);
  ellipse(x0 + tableX, y0, r, r);
  ellipse(x0 + tableX, y0 + tableY, r, r);
}
void drawBall() {
  stroke(255,255,0);
  fill(255,0,255);
  ellipse(x + x0, y + y0, r, r);
  stroke(0);
  fill(255);
  textSize(24);
  text("[" + count + "]", x0 + x, y0 + y);
}
void moveBall() {
  x = x + vx;
  y = y + vy;
  if ((x == 0 && y == 0) || 
      (x == 0 && y == tableY) ||
      (x == tableX && y == 0) ||
      (x == tableX && y == tableY)){
    pocketed = true;
    return;
  } 
  if (x == 0 || x == tableX) {
    vx = -vx;
    count = count + 1;
  }
  if (y == 0 || y == tableY) {
    vy = -vy;
    count = count + 1;
  }
}
