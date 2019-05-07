final int POPULATION_SIZE = 25;
final int LIFETIME = 500;
final float MUTATION_RATE = 0.01;
final int STARTING_LOCATION_X = 320;
final int STARTING_LOCATION_Y = 450;
final int TARGET_LOCATION_X = 40;
final int TARGET_LOCATION_Y = 40;
final float MAX_FORCE = 0.1;
final int ROCKET_SIZE = 4;

Population population;
int lifeCounter = 0;

void setup() {
  size(640, 480);
  population = new Population();
}

void draw() {
  background(255);

  ellipse(TARGET_LOCATION_X, TARGET_LOCATION_Y, 20, 20);

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