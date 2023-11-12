Drop[] drops = new Drop[1000];
int totalDrops = 0;
void setup() {
  size(400,400);
}
void draw() {
  background(255);
  drops[totalDrops] = new Drop();  //一つずつインスタンスを追加
  totalDrops++;            //雨粒作成数
  if (totalDrops >= drops.length) {  //雨粒の数が配列数を超えたか？
    totalDrops = 0;          //雨粒数を0からリスタート
  }
  for (int i = 0; i < totalDrops; i++ ) { 
    drops[i].move();
    drops[i].display();
  }
}
