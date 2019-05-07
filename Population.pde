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
    matingPool = new ArrayList<Rocket>();

    for (Rocket rocket : population) {
      int n = int(rocket.fitness() * 1000);
      for (int i = 0; i < n; i++) {
        matingPool.add(rocket);
      }
    }
  }

  void selection() {

  }

  void reproduction() {
    for (int i = 0; i < population.length; i++) {

      int parentAIndex = int(random(matingPool.size() - 1));
      int parentBIndex = int(random(matingPool.size() - 1));

      while (parentBIndex == parentAIndex) {
        parentBIndex = int(random(matingPool.size() - 1));
      }

      Rocket parentA = matingPool.get(parentAIndex);
      Rocket parentB = matingPool.get(parentBIndex);

      Rocket child = parentA.dna.crossover(parentB.dna);
      child.dna.mutate();

      population[i] = child;
    }

    for (int i = 0; i < population.length; i++) {
      population[i].geneCounter = 0;
    }
  }
  
}