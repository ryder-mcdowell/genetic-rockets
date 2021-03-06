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

  boolean inTarget(PVector position) {
    return (position.x < TARGET_LOCATION_X + (TARGET_DIAMETER/2 - ROCKET_SIZE) && position.x > TARGET_LOCATION_X - (TARGET_DIAMETER/2 - ROCKET_SIZE)) && (position.y < TARGET_LOCATION_Y + (TARGET_DIAMETER/2 - ROCKET_SIZE) && position.y > TARGET_LOCATION_Y - (TARGET_DIAMETER/2 - ROCKET_SIZE));
  }

  boolean hitObstacle(PVector position) {
    return (position.x < OBSTACLE_LOCATION_X + (OBSTACLE_WIDTH/2 - ROCKET_SIZE) && position.x > OBSTACLE_LOCATION_X - (OBSTACLE_WIDTH/2 - ROCKET_SIZE)) && (position.y < OBSTACLE_LOCATION_Y + (OBSTACLE_HEIGHT/2 - ROCKET_SIZE) && position.y > OBSTACLE_LOCATION_Y - (OBSTACLE_HEIGHT/2 - ROCKET_SIZE));
  }

  void live() {
    for (int i = 0; i < population.length; i++) {
      if (!inTarget(population[i].position) && !hitObstacle(population[i].position)) {
        population[i].run();
        population[i].display();
      }
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