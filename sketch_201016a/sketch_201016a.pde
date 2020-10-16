class Snake {
  int x,y;
  float sizeX,sizeY;
  int velX,velY;
  int angle;
  float xspeed = 1;
  float yspeed = 0;
  int total = 0;
  ArrayList<PVector> tail = new ArrayList<PVector>();

  void dir(float x, float y) {
    xspeed = x;
    yspeed = y;
  }
    
  Snake(int posX,int posY){
    x = posX;
    y =posY;
    angle =0;
    sizeX = posX*.5;
    sizeY = posY*.5;
    velX = posX*2;
    velY = posY*2;
  }
  
  void draw(){
    for (PVector v : tail) {
    strokeWeight((sizeX+sizeY)*0.2);
    stroke(255);
    if(abs(angle)==360){angle =0;}
    if(angle == 0){
      line(x+sizeX,y+sizeY,x-sizeX,y+sizeY);
      stroke(255,255,0);
      line(x-sizeX,y+sizeY,x,y-sizeY);
      line(x,y-sizeY,x+sizeX,y+sizeY);  
    }
    if(angle == 90 || angle ==-270){
      line(x+sizeX,y+sizeY,x+sizeX,y-sizeY);
      stroke(255,255,0);
      line(x+sizeX,y-sizeY,x-sizeX,y); 
      line(x-sizeX,y,x+sizeX,y+sizeY);
    }
    if(abs(angle) == 180){
      line(x-sizeX,y-sizeY,x+sizeX,y-sizeY);
      stroke(255,255,0);
       line(x,y+sizeY,x-sizeX,y-sizeY); 
       line(x+sizeX,y-sizeY,x,y+sizeY);
    }
    if(angle == 270 || angle==-90){
      line(x-sizeX,y-sizeY,x-sizeX,y+sizeY);
      stroke(255,255,0);
       line(x+sizeX,y,x-sizeX,y-sizeY); 
       line(x-sizeX,y+sizeY,x+sizeX,y);
    }
    }
  }

Snake s;
int scl = 20;


void setup() {
  size(600, 600);
  s = new Snake();
}


void draw() {
  background(51);
  s.draw();
}

void keyPressed() {
  if (keyCode == UP) {
    s.dir(0, -1);
  } else if (keyCode == DOWN) {
    s.dir(0, 1);
  } else if (keyCode == RIGHT) {
    s.dir(1, 0);
  } else if (keyCode == LEFT) {
    s.dir(-1, 0);
  }
}
