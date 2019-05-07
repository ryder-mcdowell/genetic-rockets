class Rocket {

  PVector position;
  PVector velocity;
  PVector acceleration;

  DNA dna;
  
  float fitness;
  int geneCounter = 0;

  Rocket(PVector location) {
    dna = new DNA();
    acceleration = new PVector();
    velocity = new PVector();
    position = location.get();
  }

  void run() {
    applyForce(dna.genes[geneCounter]);
    ++geneCounter;
    update();
  }

  float fitness() {
    float distance = PVector.dist(position, new PVector(0,0)); //!
    return 1.0 / distance;
  }

  void applyForce(PVector f) {
    acceleration.add(f);
  }

  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    acceleration.mult(0);
  }

  void display() {
    float theta = velocity.heading2D() + PI/2;
    fill(200, 100);
    stroke(0);
    pushMatrix();
    translate(position.x, position.y);
    rotate(theta);

    // Thrusters
    rectMode(CENTER);
    fill(0);
    rect(-ROCKET_SIZE/2, ROCKET_SIZE*2, ROCKET_SIZE/2, ROCKET_SIZE);
    rect(ROCKET_SIZE/2, ROCKET_SIZE*2, ROCKET_SIZE/2, ROCKET_SIZE);

    // Fuselage
    fill(175);
    beginShape(TRIANGLES);
    vertex(0, -ROCKET_SIZE*2);
    vertex(-ROCKET_SIZE, ROCKET_SIZE*2);
    vertex(ROCKET_SIZE, ROCKET_SIZE*2);
    endShape();

    popMatrix();
  }

}