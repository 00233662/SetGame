
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
        if (!isPaused) {
          displayCards(index, j, i);
        } else {
          PImage img = loadImage("achterkant.png");
          displayCard(img, j, i);
        }
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

void displayCards(int index, int col, int row) {
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
  image(img, col * (cardWidth + 10) + 100, row * (cardHeight + 10) + 50, cardWidth, cardHeight);
}

void displaySelection(int col, int row) {
  stroke(HAN_ROZE);
  strokeWeight(5);
  noFill();
  rect(col * (cardWidth + 10) + 100, row * (cardHeight + 10) + 50, cardWidth, cardHeight);
}

void displaySetCounts() {
  int setCount = countSetsOnBoard();
  int cardsInGraveyard = countCardsInGraveyard();
  int cardsLeftInDeck = countCardsLeftInDeck();
  
  textSize(20);
  fill(TEXT_1);
  textAlign(RIGHT);
  text("Sets on board: " + setCount, screenWidth * 0.89, screenHeight * 0.1);
  text("Cards in graveyard: " + cardsInGraveyard, screenWidth * 0.89, screenHeight * 0.14);
  text("Cards left in deck: " + cardsLeftInDeck, screenWidth * 0.89, screenHeight * 0.18);
}

void displayTimer() {
  int seconds = elapsedTime / 1000;
  int minutes = seconds / 60;
  seconds = seconds % 60;

  textAlign(RIGHT);
  textSize(24);
  fill(TEXT_1); 
  String timerText = nf(minutes, 2) + ":" + nf(seconds, 2);
  text(timerText, screenWidth * 0.89, screenHeight * 0.3); 
}

void displayScore() {
  textAlign(RIGHT);
  textSize(24);
  fill(TEXT_1);
  String scoreText = "Score: " + playerScore;
  text(scoreText, screenWidth * 0.89, screenHeight * 0.26);
}

void displayMessage() {
  if (millis() < messageDisplayTime) {
    textAlign(RIGHT);
    textSize(32);
    fill(TEXT_1);
    text(showMessage, screenWidth * 0.87, screenHeight * 0.43);
  }
}

void displayGameOverMessage() {
  fill(MENU_COLOR, 200);
  rect(0, 0, width, height);

  textAlign(CENTER, CENTER);
  textSize(32);
  fill(255, 255, 255);
  text("Game Over", width / 2, 100);
  text("Time: " + nf(elapsedTime / 60000) + ":" + nf((elapsedTime / 1000) % 60, 2), width / 2, 150);
  text("Score: " + playerScore, width / 2, 200);

  textSize(24);
  text("Enter your name:", width / 2, 250);
  text(typedText + (millis() % 1000 < 500 ? "_" : ""), width / 2, 300);

  text("Press Enter to save your score", width / 2, 400);
}
