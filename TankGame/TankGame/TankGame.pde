//1 April 2026 | TankGame by Isabella Wang
Tank t1;
ArrayList<Projectile> projectiles = new ArrayList<Projectile>();
ArrayList<Obstacle> obstacles = new ArrayList<Obstacle>();
Obstacle obs1;
PImage bg;
int score;

void setup() {
  size(500, 500);
  score = 0;
  bg =  loadImage("desert.png");
  t1 = new Tank();
obstacles.add(new Obstacle(300,200,100,100, int(random(1,10)),10));
}



void draw() {
  background(127);
  imageMode(CORNER);
  image(bg, 0, 0);
  
  
  for (int i = 0; i < obstacles.size(); i++) {
  Obstacle o = obstacles.get(i);
  o.display();
  o.move();
}
  for (int i = 0; i < projectiles.size(); i++) {
    Projectile p = projectiles.get(i);
    p.display();
    p.move();
  }
  t1.display();
  scorePanel();
}

void keyPressed() {
  if (key == 'w') {
    t1.move('w');
  } else if (key == 's') {
    t1.move('s');
  } else if (key == 'a') {
    t1.move('a');
  } else if (key == 'd') {
    t1.move('d');
  }
}

void mousePressed() {
  float dx = mouseX - t1.x;
  float dy = mouseY - t1.y;
  float mag = sqrt(dx*dx + dy*dy);
  
  if (mag > 0) {
    dx /= mag;
    dy /= mag;
    
    float speed = 5;
    projectiles.add(new Projectile(t1.x, t1.y, 4, 10));
  }
}


void scorePanel() {
  fill(127, 200);
  rectMode(CENTER);
  noStroke();
  rect(width/2, 15, width, 30);
  fill(255);
  textSize(30);
  textAlign(CENTER);
  text("Score:" + score, width/2, 25);
}
