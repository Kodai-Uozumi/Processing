int shift = 1;
void setup(){
  println("shift:"+shift);
}
void draw(){
}
void keyPressed(){
 if (key==CODED) {
    if (keyCode == LEFT) {
      shift--;
    } else if (keyCode == RIGHT) {
      shift++;
    }
    shift = constrain(shift,-25,25);
    println("[shift:"+shift+"]");
  }else if(key==ENTER){
    println();
  } else if(key==' '){
    print(' ');
  }else if(key >= 'a' && key <= 'z'){
    int moji = key + shift;
    if (moji > 'z') {
      moji = '`' + moji - 'z';
    } else if (moji < 'a') {
      moji = '{' + moji - 'a';
    }
    print(char(moji));
  }
}
