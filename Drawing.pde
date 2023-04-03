void drawTable() {
  background(TABLE_COLOR_1);
  noStroke();
  fill(TABLE_COLOR_2);
  rect(0, 0, MARGIN * 4, screenHeight);
  rect(screenWidth, 0, -MARGIN * 4, screenHeight);
}



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
  image(img, col * (cardWidth + 10) + 75, row * (cardHeight + 10) + 50, cardWidth, cardHeight);
}

void displaySelection(int col, int row) {
  stroke(HAN_ROZE);
  strokeWeight(5);
  noFill();
  rect(col * (cardWidth + 10) + 75, row * (cardHeight + 10) + 50, cardWidth, cardHeight);
}

void displaySetCounts() {
  int setCount = countSetsOnBoard();
  int cardsInGraveyard = countCardsInGraveyard();
  int cardsLeftInDeck = countCardsLeftInDeck();
  
  textSize(20);
  fill(TEXT_1);
  textAlign(RIGHT);
  text("Sets on board: " + setCount, screenWidth - 70, 70);
  text("Cards in graveyard: " + cardsInGraveyard, screenWidth - 70, 100);
  text("Cards left in deck: " + cardsLeftInDeck, screenWidth - 70, 130);
}

void displayGameOverMessage() {
  textAlign(CENTER, CENTER);
  textSize(32);
  fill(TEXT_1);
  text("Game Over", screenWidth / 2, screenHeight / 2);
}
