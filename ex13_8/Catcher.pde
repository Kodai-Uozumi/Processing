class Catcher {
  float r;       //半径
  float x, y;     //位置 

  Catcher(float tempR) {
    r = tempR;    //半径は引数で指定
    x = 0;
    y = 0;
  }

  void setLocation(float tempX, float tempY) {
    x = tempX;
    y = tempY;
  }
  void display() {
    stroke(0);
    fill(175);
    ellipse(x, y, r*2, r*2);
  }
  boolean intersect(Drop d) {
    float distance = dist(x, y, d.x, d.y);
    if (distance < r + d.r) {
      return true;
    } else {
      return false;
    }
  }
}
