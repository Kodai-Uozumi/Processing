Drop[] drops = new Drop[1000];
int totalDrops = 0;
Catcher catcher;
Timer timer;
Gauge hpGauge;
void setup() {
  size(400, 400);
  catcher = new Catcher(32);
  timer = new Timer(1000);
  timer.start();
  hpGauge = new Gauge(10);
  smooth();
}
void draw() {
  background(255);
  hpGauge.display();
  catcher.setLocation(mouseX, mouseY);
  catcher.display();
  if (timer.isFinished()) {
    drops[totalDrops] = new Drop();
    totalDrops++;
    if (totalDrops >= drops.length) {
      totalDrops = 0;
    }
    timer.start();
  }
  for (int i = 0; i < totalDrops; i++ ) { 
    drops[i].move();
    drops[i].display();
    if (catcher.intersect(drops[i])) {
      drops[i].caught();
    }
  }
}
