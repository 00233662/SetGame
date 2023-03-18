void startNewGame() {
  // Reset game variables
  gameStarted = true;
  givingClue = false;
  runningTimerEnd = 0;
  runningTimer = 0;
  gameTimer = 0;
  setTimer = 0;
  timeElapsed = 0;

  // Bepaal aantal kaarten op basis van spelmodus
  if (selectedScreen == SCREEN_27CARDSSET) {
    newSetCards = 27;
  } else if (selectedScreen == SCREEN_81CARDSSET) {
    newSetCards = 81;
  }

  // Genereer nieuwe set kaarten
  generateCards();

  // Reset grid variables
  gridCols = 3;
  gridRows = 4;
  xMargin = 50;
  yMargin = 50;
  xSpacing = 10;
  ySpacing = 10;
  cardHeight = screenHeight / 8;
  cardWidth = cardHeight * 2;

  // Reset timer variables
  runningTimerStart = millis();
  runningTimerEnd = runningTimerStart + 5000;
  gameTimer = 0;
  setTimer = 0;
}
