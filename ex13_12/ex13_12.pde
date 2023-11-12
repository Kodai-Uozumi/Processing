import processing.sound.*;
SoundFile file;
PFont myFont;
int strageNo;
int gameState;
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
  file = new SoundFile(this, "rec0.wav");
  myFont = createFont("MS Gothic", 32);
  textFont(myFont);
}
void drawTitle() {
  textSize(50);
  textAlign(CENTER);
  fill(0);
  text("Space key", width/2, height/2);
  text("Score:"+(strageNo), width/2, height/2+50);
  if (key == ' ') {
    gameState++;
    strageNo = 0;
  }
}
void draw() {
  background(255);
  if (gameState == 0) {
    drawTitle();
  } else if (gameState == 1) {
    key = 0;
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
      if (hpGauge.isEmpty()) {
        hpGauge.reset(10);
        gameState = 0;
        drawTitle();
      }
      drops[i].move();
      drops[i].display();
      if (catcher.intersect(drops[i])) {
        drops[i].caught();
        file.play();
        strageNo++;
      }
      if (drops[i].reachedBottom()) {
        hpGauge.damage();
      }
    }
  }
}
