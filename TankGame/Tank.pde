class Tank {
  // Member variable
  float x, y, w, h, speed, health;
  PImage iTankA, iTankW, iTankS, iTankD;
  char idir;
  int turretCount;
  
  // Constructor
  Tank() {
    x = 100.0;
    y = 100.0;
    w = 100.0;
    h = 100.0;
    speed = 10.0;
    health = 75.0;
    iTankA = loadImage ("Tank.png");
    iTankW = loadImage ("tankup.png");
    iTankS = loadImage ("tankdown.png");
    iTankD = loadImage ("tankflip.png");
    idir='w';
    turretCount=1;
  }

  void display() {
    imageMode(CENTER);
    if (idir == 'w') {
      image(iTankW, x, y);
    } else if (idir=='a') {
      image(iTankA, x, y);
    } else if (idir=='s') {
      image(iTankS, x, y);
    } else if (idir=='d') {
      image(iTankD, x, y);
    }
  }

  void move(char dir) {
    if (dir == 'w') {
      idir='w';
      y = y - speed;
    } else if (dir == 's') {
      idir='s';
      y = y + speed;
    } else if (dir == 'a') {
      idir='a';
      x = x - speed;
    } else if (dir == 'd') {
      idir='d';
      x = x + speed;
    }
  }

  void fire() {
  }
  boolean intersect(Obstacle o) {
    float distance = dist(x, y, o.x, o.y);
    if (distance < 50) {
      return true;
    } else {
      return false;
    }
  }
}
