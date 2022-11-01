Particle [] army = new Particle[150];
void setup() {
  size(400, 400);
  for(int i = 0; i < army.length; i++) {
    army[i] = new Particle();
  }
  army[0] = new OddballParticle();
}

void draw() {
  background(173, 96, 61);
  for(int x = 0; x < army.length; x++){
    army[x].show();
    army[x].move();
  }
}

class Particle {
  int myColor, mySize;
  double myX, myY, myAngle, mySpeed;
  Particle() {
    myColor = color(255, 255, 255);
    myX = myY = 200;
    myAngle = Math.random()*(2*Math.PI);
    mySpeed = (Math.random()*15)+1;
    mySize = (int)(Math.random()*15)+25;
  }
  void move() {
    myX = myX + Math.cos(myAngle) * mySpeed;
    myY = myY + Math.sin(myAngle) * mySpeed;
  }
  void show() {
    //seaweed
    fill(0);
    ellipse((float)myX, (float)myY, mySize, mySize);
    //rice
    noStroke();
    fill(myColor);
    ellipse((float)myX, (float)myY, mySize*30/40, mySize*30/40);
    //red
    fill(242, 71, 65);
    ellipse((float)myX, (float)myY-3, mySize*15/40, mySize*7/40);
    //yellow
    fill(245, 245, 71);
    ellipse((float)myX, (float)myY+2, mySize*15/40, mySize*7/40);
    //green
    fill(57, 163, 54);
    ellipse((float)myX-5, (float)myY, mySize*5/40, mySize*12/40);
  }
}

void mouseClicked() {
 for(int i = 0; i < army.length; i++) {
    army[i] = new Particle();
  }
  army[0] = new OddballParticle();
}

class OddballParticle extends Particle {
  OddballParticle() {
    myColor = color(120, 245, 128);
    myX = 200;
    myY = 200;
    mySpeed = 1;
    mySize = (int)(Math.random()*15)+45;
  }
  void show(){
    fill(myColor);
    ellipse((float)myX, (float)myY, mySize + (mySize*7/50), mySize);
    //left eye
    fill(0);
    ellipse((float)myX - (mySize*15/50), (float)myY- (mySize*5/50), mySize*5/50, mySize*5/50);
    //right eye
    ellipse((float)myX + (mySize*15/50), (float)myY-(mySize*5/50),(mySize*5/50), (mySize*5/50));
    //mouth
    ellipse((float)myX, (float)myY+(mySize*5/50), mySize*7/50, (mySize*15/50));
  }
  void move(){
    frameRate(25);
    myX = (int)(Math.random()*200)+100;
    myY = (int)(Math.random()*200)+100;
  }
}
