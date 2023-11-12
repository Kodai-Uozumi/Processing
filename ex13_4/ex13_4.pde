Drop[] drops = new Drop[1000];
int totalDrops = 0;
Catcher catcher;
Timer timer;
void setup() {
  size(400,400);
  catcher = new Catcher(32);
  timer = new Timer(1000);
  timer.start();
  smooth();
}
void draw() {
  background(255);
  catcher.setLocation(mouseX,mouseY);
  catcher.display();
  if (timer.isFinished()) {
    background(random(255));
    timer.start();
  }
  drops[totalDrops] = new Drop();
  totalDrops++;
  if (totalDrops >= drops.length) {
    totalDrops = 0;
  }
  for (int i = 0; i < totalDrops; i++ ) { 
    drops[i].move();
    drops[i].display();
  }
}
