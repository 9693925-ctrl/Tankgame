class PowerUp {
  // Member variable
  float x, y, w, h, speed;
  //PImage O1;
  char type;

  // Constructor
  PowerUp(float w, float h) {

    w = 100;
    h = 100;
    speed = 5;

    if (int(random(4))==2) {
      type = 'h';
      x=random(width);
      y=-100;
    } else if (int(random(3))==1) {
      type = 't';
      x=random(width);
      y=-100;
    } else {
      type = 'a';
      x=random(width);
      y=-100;
    }
    //O1 = loadImage ("obstacle1.png");
    type='w';
  }


  void display() {
    if (type == 'h') {
      fill(0, 200, 0);
      ellipse(x, y, w, h);
      fill(255);
      textAlign(CENTER,CENTER);
      text("Health", x, y);
    } else  if (type == 't') {
      fill(0, 0, 200);
      ellipse(x, y, w, h);
      fill(255);
      textAlign(CENTER,CENTER);
      text("Turret", x, y);
    } else  if (type == 'a') {
      fill(200, 0, 0);
      ellipse(x, y, w, h);
      fill(255);
      textAlign(CENTER,CENTER);
      text("Ammo", x, y);
    }
    //image(O1, x, y);
    imageMode(CENTER);
  }

  void move() {
    y =y+speed;
  }

  boolean reachedEdge() {
    if (x < 0-w/2 || x > width+w/2 || y < 0-w/2 || y> height+w/2) {
      return true;
    } else {
      return false;
    }
  }
  
  boolean intersect(Tank t) {
    float distance = dist(x,y,t.x,t.y);
    if (distance<100) {
      return true;
    } else {
      return false;
    }
  }

  void fire() {
  }
}
