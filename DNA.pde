class DNA {

  PVector[] genes;

  DNA() {
    genes = new PVector[LIFETIME];
    for (int i = 0; i < genes.length; i++) {
      genes[i] = PVector.random2D();
      genes[i].mult(random(0, MAX_FORCE));
    }
  }

  Rocket crossover(DNA partnerDNA) {
    Rocket child = new Rocket(new PVector(STARTING_LOCATION_X, STARTING_LOCATION_Y));
    
    int coinFace;
    for (int i = 0; i < genes.length; i++) {
      coinFace = int(random(2));
      if (coinFace == 0) child.dna.genes[i] = genes[i];
      else child.dna.genes[i] = partnerDNA.genes[i];
    }

    return child;
  }

  void mutate() {
    for (int i = 0; i < genes.length; i++) {
      if (random(1) < MUTATION_RATE) {
        genes[i] = PVector.random2D();
        genes[i].mult(random(0, MAX_FORCE));
      }
    }
  }
}