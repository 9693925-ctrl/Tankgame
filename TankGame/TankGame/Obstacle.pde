class Obstacle {
  // Member variable
  float x, y, w, h, speed, health;
  PImage O1;
  char idir;
  // Constructor
  Obstacle(float x, float y, float w, float h, float speed, float health) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.speed = speed;
    this.health = health;
    O1 = loadImage ("obstacle1.png");
    idir='w';
  }

  void display() {
   image(O1, x, y);
   imageMode(CENTER);
  }

  void move() {
   x=x+speed;
   if(x>width){
     x = 0;
   }
  }

  void fire() {
  }
}
