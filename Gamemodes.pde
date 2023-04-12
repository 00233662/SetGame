/*#########################
screen 0 = Main menu
screen 1 = Game Modes
screen 2 = Games
screen 3 = Rules
screen 4 = Leaderboard
#########################*/

void playSetGame() {
  if (!gameInitialized) {
    gameEnded = false;
    hintGiven = false;
    uniqueCards.clear();
    resetTimer();
    graveyard.clear();
    setupCards();
    deckIndex = 0;
    dealCards();
    if (countSetsOnBoard() == 0) {
      uniqueCards.clear();
      setupCards();
      deckIndex = 0;
      dealCards();
    }
    gameInitialized = true;
  }

  drawTable();
  displayBoard();
  displaySetCounts();
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
