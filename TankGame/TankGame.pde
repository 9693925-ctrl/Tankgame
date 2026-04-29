//1 April 2026 | TankGame by Isabella Wang
Tank t1;
ArrayList<Projectile> projectiles = new ArrayList<Projectile>();
ArrayList<Obstacle> obstacles = new ArrayList<Obstacle>();
ArrayList<PowerUp> powerups = new ArrayList<PowerUp>();
Obstacle obs1;
PImage bg;
int score;
Timer objTimer, puTimer;

void setup() {
  size(500, 500);
  score = 0;
  bg =  loadImage("desert.png");
  t1 = new Tank();
  objTimer = new Timer(1000);
  objTimer.start();
  puTimer = new Timer(5000);
  puTimer.start();
  //obstacles.add(new Obstacle(300, 200, 100, 100, int(random(1, 10)), 10));
}



void draw() {
  background(127);
  imageMode(CORNER);
  image(bg, 0, 0);

  //Distribute object on timer
  if (objTimer.isFinished()) {
    //Add object
    obstacles.add(new Obstacle(100, 100, int(random(1, 10)), 10));
    //Restart timer
    objTimer.start();
  }

  //Distribute powerups on timer
  if (puTimer.isFinished()) {
    //Add powerup
    powerups.add(new PowerUp(100, 100));
    //Restart timer
    puTimer.start();
  }

  //Displays and removes powerups
  for (int i = 0; i < powerups.size(); i++) {
    PowerUp pu = powerups.get(i);
    pu.display();
    pu.move();
    if (pu.reachedEdge()) {
      obstacles.remove(pu);
    }
    if (pu.intersect(t1)) {
      //Turret
      if (pu.type == 't') {
        t1.turretCount++;
      } else if (pu.type == 'a') {
        t1.turretCount++;
      } else if (pu.type == 't') {
        t1.laserCount= t1.laserCount +100;
      } else if (pu.type == 'h') {
        t1.health= t1.health +100;
      }
    }
  }


  //Displays and removes obstacles
  for (int i = 0; i < obstacles.size(); i++) {
    Obstacle o = obstacles.get(i);
    o.display();
    o.move();
    if (o.reachedEdge()) {
      obstacles.remove(i);
    }
    //detect collision to tank
    if (t1.intersect(o)) {
    }
    //impact to change score,health and obstacles
  }
  // Render and detect collision
  for (int i = 0; i < projectiles.size(); i++) {
    Projectile p = projectiles.get(i);
    for (int j = 0; j < obstacles.size(); j++) {
      Obstacle o = obstacles.get(j);
      if (p.intersect(o)) {
        score = score + 100;
        projectiles.remove(i);
        obstacles.remove(j);
      }
    }
    p.display();
    p.move();
    if (p.reachedEdge()) {
      projectiles.remove(i);
    }
  }
  t1.display();
  scorePanel();
  println("Objects in Memory"+obstacles.size());
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
    if (t1.turretCount == 1 && t1.laserCount> 0) {
      projectiles.add(new Projectile(t1.x, t1.y, dx * speed, dy * speed));
      t1.laserCount = t1.laserCount=1;
    } else if (t1.turretCount == 2) {
      projectiles.add(new Projectile(t1.x-20, t1.y, dx * speed, dy * speed));
      projectiles.add(new Projectile(t1.x+20, t1.y, dx * speed, dy * speed));
      t1.laserCount = t1.laserCount=2;
    } 
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
  text("Health:" + t1.health, width/2-150, 25);
  text("Ammo:" + score, width/2+150, 25);
}
