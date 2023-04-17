/*#########################
screen 0 = Main menu
screen 1 = Game Modes
screen 2 = Games
screen 3 = Rules
screen 4 = Leaderboard
#########################*/

void playSetGame(boolean usingShades) {
  if (!gameInitialized) {
    gameEnded = false;
    hintGiven = false;
    uniqueCards.clear();
    resetTimer();
    graveyard.clear();
    resetSelection();
    setupCards();
    deckIndex = 0;
    playerScore = 0;

    if (usingShades) {
      board = new int[12][NUM_FEATURES];
      gridRows = 4;
      gridCols = 3;
    } else {
      board = new int[9][NUM_FEATURES];
      gridRows = 3;
      gridCols = 3;
    }
    
    this.usingShades = usingShades;
    dealCards();
    gameInitialized = true;
  }
  
  drawTable();
  displayBoard();
  displaySetCounts();
  displayScore();
  displayMessage();
  drawButtonsInGame();
  
  if (!stoppedTime) {
    elapsedTime = millis() - startTime;
  }
  
  displayTimer();
  
  if (gameEnded) {
    displayGameOverMessage();
    stoppedTime = true;
  } else {
    gameEnded = isGameEnded();
  }
}
