class Gauge {
  int hp;
  int maxHp;
  float x, y;
  float gaugeWidth;
  float gaugeHeight;
  Gauge(int tempMaxHp) {
    maxHp = tempMaxHp;
    hp = maxHp;
    x = 0;
    y = 0;
    gaugeWidth = width;
    gaugeHeight = 20;
  }
  void display() {
    float bWidth = gaugeWidth/maxHp;
    rectMode(CORNER);
    noStroke();
    fill(255, 0, 0);
    for (int i=0; i<hp; i++) {
      rect(x+i*bWidth, y, bWidth, gaugeHeight);
    }
    noFill();
    stroke(100, 0, 0);
    rect(x, y, gaugeWidth, gaugeHeight);
  }
  void damage() {
    hp--;
  }
  boolean isEmpty() {
    if (hp<=0) {
      return true;
    } else {
      return false;
    }
  }
  void reset(int tempMaxHp) {
    maxHp= tempMaxHp;
    hp = maxHp;
  }
}
