class DNA {

  PVector[] genes;
  float maxForce = 0.1;

  DNA() {
    genes = new PVector[LIFETIME];
    for (int i = 0; i < genes.length; i++) {
      genes[i] = PVector.random2D();
      genes[i].mult(random(0, maxForce));
    }
  }

  // DNA crossover(DNA partner) {
  //   DNA child = new DNA(mutationRate);
    
  //   int coinFace;
  //   for (int i = 0; i < genes.length; i++) {
  //     coinFace = int(random(2));
  //     if (coinFace == 0) child.genes[i] = genes[i];
  //     else child.genes[i] = partner.genes[i];
  //   }

  //   return child;
  // }

  // void mutate() {
  //   for (int i = 0; i < genes.length; i++) {
  //     if (random(1) < mutationRate) {
  //       genes[i] = (char)random(32,128);
  //     }
  //   }
  // }
}