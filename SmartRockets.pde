final int POPULATION_SIZE = 25;
final int LIFETIME = 100;
final float MUTATION_RATE = 0.01;
final int STARTING_LOCATION_X = 320;
final int STARTING_LOCATION_Y = 450;
final int ROCKET_SIZE = 4;

Population population;
int lifeCounter = 0;

void setup() {
  size(640, 480);
  population = new Population();
}

void draw() {
  background(255);

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