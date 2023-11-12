Car[] myCars = new Car[50];
void setup(){
  size(200,200);
  for(int i=0;i<myCars.length;i++){
    myCars[i] = 
   new Car(0,i*4,i,color(random(255),random(255),random(255)));
  }
}
void draw(){
  background(255);
  for(int i=0;i<myCars.length;i++){
    myCars[i].display();
    myCars[i].move();
    myCars[i].bounce();
  }
}
class Car{
  float x;
  float y;
  int thesize;
  color c;
  int offset;
  float speed;
  Car(float _x, float _y, int _thesize, color _c){
    x = _x;
    y = _y;
    thesize = _thesize;
    c=_c;
    offset = thesize/4;
    speed = random(0.2,4);
  }
  void display(){
    rectMode(CENTER);
    stroke(0);
    fill(c);
    rect(x,y,thesize,thesize/2);
    fill(0);
    rect(x-offset,y-offset,offset,offset/2);
    rect(x+offset,y-offset,offset,offset/2);
    rect(x-offset,y+offset,offset,offset/2);
    rect(x+offset,y+offset,offset,offset/2);
  }
  void move(){
    x = x + speed;
  }
  void bounce(){
    if ((x > width) || (x < 0)) {
      speed = speed * -1;
    }
  }
}
