import processing.sound.*;
Env envelope;
float attackTime=0.05;
float sustainTime=0.05;
float sustainLevel=0.3;
float releaseTime=0.4;
float frequency=440;
String[] sequence = { "E4","D#4","E4","F4","E4","E4","D#4","E4","F4","E4","E4","D4","E4","F4","G#4","A4","F4","E4","G4","R"}; 
int[]    duration = {  100, 100, 100, 100, 400, 100, 100, 100, 100, 400, 100, 100, 100, 100, 200, 100, 200, 100, 400, 200}; 
int trigger = millis(); 
int note = 0; 
boolean autoPlay=false;
Oscillator oscs[] = new Oscillator[4];
int current = 0;
String oscName[] = {"Sine","Triangle","Sawtooth","Square"};
PFont font;
Waveform waveform;
int samples = 1000;
void setup() {
  size(1000, 360);
  oscs[0] = new SinOsc(this);
  oscs[1] = new TriOsc(this);
  oscs[2] = new SawOsc(this);
  oscs[3] = new SqrOsc(this);
  oscs[current].stop();
  waveform = new Waveform(this, samples);
  waveform.input(oscs[current]);
  envelope  = new Env(this); 
  font = createFont("MS Gothic",50);
  textFont(font);
}
void draw(){
  background(0);
  if(autoPlay){
    autoPlay();
  }
  stroke(255);
  waveform.analyze();
  for(int x=1;x<samples;x++){
    line(x-1,map(waveform.data[x-1],-1,1,0,height),
                x,map(waveform.data[x],-1,1,0,height));
  }
  fill(255);
  text("frequency:"+String.format("%05d",int(frequency))+"Hz",10,50);
  text("waveform :"+oscName[current],10,100);
}
void mousePressed(){
  current = (current+1)%4;
  oscs[current].stop();
  waveform.input(oscs[current]);  
}
void keyPressed(){
  if(key==' '){
    autoPlay=!autoPlay;
  }    
}
void autoPlay(){
  if (millis() > trigger) {
    frequency = pitchToFreq(sequence[note]);
    if(frequency>0){
      oscs[current].amp(0.8);
      oscs[current].freq(frequency);
      oscs[current].play();
      envelope.play(oscs[current], attackTime, sustainTime, sustainLevel, releaseTime);
    }
    trigger = millis() + duration[note];
    note++; 
    if (note == sequence.length) {
      note = 0;
    }
  }
}
float pitchToFreq(String pitch) {
  int[] pitchNo= {0,2,3,5,7,8,10};
  float freq; int octave=1;  int n=0;
  char c1=pitch.charAt(0);
  if(c1=='R'){
    return(0.0);    //休符
  }
  if(c1>='A'&& c1<='G'){
    n = pitchNo[int(c1-'A')];
    char c2=pitch.charAt(1);
    if(c2=='#'){
      n = n + 1;    //半音上がる
      char c3=pitch.charAt(2);
      octave = int(c3-'0');
    }else if(c2=='b'){
      n = n - 1;    //半音下がる
      char c3=pitch.charAt(2);
      octave = int(c3-'0');
    }else{
      octave = int(c2-'0');
    }
    octave = constrain(octave,2,8);
    if(c1!='A' && c1!='B'){
      octave--;
    }
    freq = 55.0*pow(2,octave);
    freq = freq*pow(2,n/12.0);
  }else{
    freq=0.0;
  }
  return(freq);
}
