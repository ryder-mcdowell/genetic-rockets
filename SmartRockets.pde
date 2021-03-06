final int POPULATION_SIZE = 25;
final int LIFETIME = 250;
final float MUTATION_RATE = 0.01;
final int STARTING_LOCATION_X = 320;
final int STARTING_LOCATION_Y = 450;
final int TARGET_LOCATION_X = 40;
final int TARGET_LOCATION_Y = 40;
final int TARGET_DIAMETER = 40;
final int OBSTACLE_LOCATION_X = 200;
final int OBSTACLE_LOCATION_Y = 200;
final int OBSTACLE_WIDTH = 100;
final int OBSTACLE_HEIGHT = 20;
final float MAX_FORCE = 0.2;
final int ROCKET_SIZE = 4;

Population population;
int lifeCounter = 0;

void setup() {
  size(640, 480);
  population = new Population();
}

void draw() {
  background(255);

  fill(255);
  ellipse(TARGET_LOCATION_X, TARGET_LOCATION_Y, TARGET_DIAMETER, TARGET_DIAMETER);

  fill(0);
  rect(OBSTACLE_LOCATION_X, OBSTACLE_LOCATION_Y, OBSTACLE_WIDTH, OBSTACLE_HEIGHT);

  if (lifeCounter < LIFETIME) {
    population.live();
    lifeCounter++;
  } else {
    lifeCounter = 0;
    population.fitness();
    population.selection();
    population.reproduction();
  }
}