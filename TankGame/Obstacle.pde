class Obstacle {
  // Member variable
  float x, y, w, h, speed, health;
  PImage O1;
  char idir;

  // Constructor
  Obstacle(float w, float h, float speed, float health) {

    this.w = w;
    this.h = h;
    this.speed = speed;
    this.health = health;
    //if (int(random(4))==2) {
      idir = 'w';
      x=random(width);
      y=-100;
    //} else if (int(random(3))==1) {
    //  idir = 'd';
    //  x=-100;
    //  y=random(height);
    //} else if (int(random(2))==1) {
    //  idir = 'a';
    //  x=width+100;
    //  y=random(height);
    //} else {
    //  idir = 'd';
    //  x=-100;
    //  y=random(height);
    //}
    O1 = loadImage ("obstacle1.png");
    idir='w';
  }


  void display() {
    //fill(0);
    //rect(x,y,w,h);
    image(O1, x, y);
    imageMode(CENTER);
  }

  void move() {
    y=y+speed;
    //switch(idir) {
    //case 'w':
    //  y=y-speed;
    //case 'a':
    //  x=x-speed;
    //case 'd':
    //  x=x+speed;
    //case 's':
    //  y=y+speed;
    //}
  }

  boolean reachedEdge() {
    if (x < 0-w/2 || x > width+w/2 || y < 0-w/2 || y> height+w/2) {
      return true;
    } else {
      return false;
    }
  }

  void fire() {
  }
}
