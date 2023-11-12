Timer timer;
void setup() {
  size(200,200);
  background(0);
  timer = new Timer(5000);
  timer.start();          //タイマーをスタート
}
void draw() {
  if (timer.isFinished()) {    //設定時間になったか？
    background(random(255));    //わかりやすく背景の色を変える
    timer.start();          //タイマーをリセットして再スタート
  }
}
