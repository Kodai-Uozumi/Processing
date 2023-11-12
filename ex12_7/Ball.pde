class Ball {
  float r;   // 半径
  float x, y; // 位置
  float xspeed, yspeed; //スピード
  color c;

  Ball(float tempR) {
    r = tempR;
    x = random(width);
    y = random(height);
    xspeed = random( -5, 5);
    yspeed = random( -5, 5);
    c = color(100, 50);
  }
  void move() {
    x += xspeed; // xの増加
    y += yspeed; // yの増加
    if (x > width || x < 0) {
      xspeed *= - 1;
    }
    if (y > height || y < 0) {
      yspeed *= - 1;
    }
  } 
  void display() {
    stroke(0);
    fill(c);
    ellipse(x, y, r*2, r*2);
    c = color(100, 50); // 通常の色
  }
  boolean intersect(Ball b) {    //あたり判定メソッド
    float distance = dist(x, y, b.x, b.y);
    if (distance < r + b.r) {
      return true;  //あたったらtrueを返す
    } else {
      return false;
    }
  }
  void highlight() {      //強調色にするメソッド
    c = color(0, 150);
  }
}
