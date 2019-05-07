class Population {
  
  Rocket[] population;
  ArrayList<Rocket> matingPool;
  int generations;

  Population() {
    population = new Rocket[POPULATION_SIZE];

    for (int i = 0; i < population.length; i++) {
      population[i] = new Rocket(new PVector(STARTING_LOCATION_X, STARTING_LOCATION_Y));
    }
  }

  void live() {
    for (int i = 0; i < population.length; i++) {
      population[i].run();
      population[i].display();
    }
  }

  void fitness() {

  }

  void selection() {

  }

  void reproduction() {
    for (int i = 0; i < population.length; i++) {
      population[i].geneCounter = 0;
    }
  }
  
}