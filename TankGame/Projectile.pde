class Projectile {
  // Member variable
  float x, y, w, h, speed;
  float vx, vy;
  char dir;

  // Constructor
  Projectile(float x, float y, float vx, float vy) {
    this.x = x;
    this.y = y;
    this.vx = vx;
    this.vy = vy;
    this.w = 10;
    this.h = 10;
    speed = 10;
    dir = 'u';
  }

  void display() {
    fill(255, 0, 0);
    rect(x, y, w, h);
  }

  void move() {
    x += vx;
    y += vy;
  }

  boolean intersect(Obstacle o) {
    float distance = dist(x, y, o.x, o.y);
    if (distance < 50) {
      return true;
    } else {
      return false;
    }
  }

  void fire() {
  }
  
  boolean reachedEdge() {
    if (x < 0-w/2 || x > width+w/2 || y < 0-w/2 || y> height+w/2) {
      return true;
    } else {
      return false;
    }
  }
  
  boolean intersect(Tank t) {
    float distance = dist(x, y, t.x, t.y);
    if (distance < 50) {
      return true;
    } else {
      return false;
    }
  }

}
