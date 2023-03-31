/*
Deze functie initialiseert de lijsten coloring, shapes en shading met verschillende kleuren, vormen en shading.
*/
void setupCardValues() {
  coloring.add("blauw");
  coloring.add("groen");
  coloring.add("rood");
 
  shapes.add("kronkel");
  shapes.add("ovaal");
  shapes.add("ruit");
  
  shading.add("vol");
  shading.add("halfvol");
  shading.add("leeg");
}

/*
Deze functie initialiseert de kaarten met kleur, vorm, nummer en shading. loadImage() laadt de 
afbeeldingen van de kaarten. De kaarten worden vervolgens in de deck gezet en de kaarten worden geschud.
*/
void setupCards() {
  for (int colors = 0; colors < coloring.size(); colors++) {
    for (int shape = 0; shape < shapes.size(); shape++) {
      for (int number = 0; number < maxNumber; number++) {
        if (usingShades) {
          createCardsWithShading(colors, shape, number);
        } else {
          createCardWithoutShading(colors, shape, number);
        }
      }
    }
  }
  Collections.shuffle(uniqueCards);
}

void createCardsWithShading(int colors, int shape, int number) {
  for (int shade = 0; shade < shading.size(); shade++) {
    String cardKey = generateCardKey(colors, shape, number, shade);
    uniqueCards.add(cardKey);
  }
}

void createCardWithoutShading(int colors, int shape, int number) {
  String cardKey = generateCardKey(colors, shape, number, -1);
  uniqueCards.add(cardKey);
}

String generateCardKey(int colors, int shape, int number, int shade) {
  String colorName = coloring.get(colors);
  String shapeName = shapes.get(shape);
  int numbers = number + 1;
  String shadingName = shade == -1 ? "vol" : shading.get(shade);

  return colorName + "_" + shapeName + "_" + numbers + "_" + shadingName;
}

void dealCards() {
  for (int i = 0; i < gridRows * gridCols; i++) {
    String card = getCardFromDeckOrGraveyard();
    int[] cardFeatures = extractCardFeatures(card);
    board[i] = cardFeatures;
  }
}

String getCardFromDeckOrGraveyard() {
  int deckSize = uniqueCards.size();
  if (deckIndex < deckSize) {
    String card = uniqueCards.get(deckIndex);
    deckIndex++;
    return card;
  } else {
    return graveyard.remove(0);
  }
}

int[] extractCardFeatures(String card) {
  int[] cardFeatures = new int[4];
  cardFeatures[0] = getIndexFromList(card, coloring);
  cardFeatures[1] = getIndexFromList(card, shapes);
  cardFeatures[2] = getIndexFromNumber(card);
  cardFeatures[3] = usingShades ? getIndexFromList(card, shading) : 0;
  return cardFeatures;
}

int getIndexFromList(String card, List<String> featuresList) {
  for (int j = 0; j < featuresList.size(); j++) {
    if (card.contains(featuresList.get(j))) {
      return j;
    }
  }
  return -1;
}

int getIndexFromNumber(String card) {
  for (int j = 0; j < maxNumber; j++) {
    if (card.contains(String.valueOf(j + 1))) {
      return j;
    }
  }
  return -1;
}

boolean isSet(int[] card1, int[] card2, int[] card3) {
  if (isCardEmpty(card1) || isCardEmpty(card2) || isCardEmpty(card3)) {
    return false;
  }

  final int NUM_FEATURES = 4;
  for (int feature = 0; feature < NUM_FEATURES; feature++) {
    if (!((card1[feature] == card2[feature] && card2[feature] == card3[feature]) ||
        (card1[feature] != card2[feature] && card2[feature] != card3[feature] && card1[feature] != card3[feature]))) {
      return false;
    }
  }
  return true;
}

boolean isCardEmpty(int[] card) {
  for (int feature : card) {
    if (feature != 0) {
      return false;
    }
  }
  return true;
}

boolean isValidSet(int[][] selectedCards) {
  for (int i = 0; i < 4; i++) {
    if (!validFeature(selectedCards, i)) {
      return false;
    }
  }
  return true;
}

boolean validFeature(int[][] cards, int featureIndex) {  
  return (cards[0][featureIndex] == cards[1][featureIndex] && cards[1][featureIndex] == cards[2][featureIndex]) ||
         (cards[0][featureIndex] != cards[1][featureIndex] && cards[1][featureIndex] != cards[2][featureIndex] && cards[0][featureIndex] != cards[2][featureIndex]);
}
