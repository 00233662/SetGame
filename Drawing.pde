void displayBoard() {
  for (int i = 0; i < gridRows; i++) {
    for (int j = 0; j < gridCols; j++) {
      int index = i * gridCols + j;
      String card = getCardAtIndex(index);
      if (card != null && !graveyard.contains(card)) {
        displayCardOrPlaceholder(index, j, i);
      }
    }
  }
}

String getCardAtIndex(int index) {
  try {
    return uniqueCards.get(index);
  } catch (IndexOutOfBoundsException e) {
    return null;
  }
}

void displayCardOrPlaceholder(int index, int col, int row) {
  String card = getCardAtIndex(index);
  if (card != null && !graveyard.contains(card)) {
    PImage img = loadImage(card + ".png");
    displayCard(img, col, row);
    if (selectedCardIndices[index]) {
      displaySelection(col, row);
    }
  }
}


void displayCard(PImage img, int col, int row) {
  image(img, col * (cardWidth + 10) + 50, row * (cardHeight + 10) + 50, cardWidth, cardHeight);
}

void displaySelection(int col, int row) {
  stroke(HAN_ROZE);
  strokeWeight(5);
  noFill();
  rect(col * (cardWidth + 10) + 50, row * (cardHeight + 10) + 50, cardWidth, cardHeight);
}

void displaySetCounts() {
  int setCount = countSetsOnBoard();
  int cardsInGraveyard = countCardsInGraveyard();
  int cardsLeftInDeck = countCardsLeftInDeck();
  
  textSize(20);
  fill(HAN_ROZE);
  textAlign(RIGHT);
  text("Sets on board: " + setCount, screenWidth - 20, 20);
  text("Cards in graveyard: " + cardsInGraveyard, screenWidth - 20, 50);
  text("Cards left in deck: " + cardsLeftInDeck, screenWidth - 20, 80);
}
