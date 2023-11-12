class Drop {
  float x, y;
  float speed;
  color c;
  float r;
  Drop() {
    r = 8;
    x = random(width);   
    y = -r*4;             
    speed = random(1, 5);  
    c = color(50, 100, 150);
  }
  void move() {  //移動メソッド
    y += speed;
  }
  void display() {    //表示メソッド
    fill(c);
    noStroke();
    for (int i = 2; i < 8; i++ ) {
      ellipse(x, y + i*4, i*2, i*2);
    }
  }
  void caught() {
    speed = 0; 
    y = -1000;
  }
  boolean reachedBottom() {
    if (y > height + r*4) { 
      y = -1000;
      speed = 0;
      return true;
    } else {
      return false;
    }
  }
}
