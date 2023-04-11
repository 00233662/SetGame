/*#########################
screen 0 = Main menu
screen 1 = Game Modes
screen 2 = Games
screen 3 = Rules
screen 4 = Leaderboard
#########################*/

void initializeSetGame() {
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
}

void playSetGame() {
  drawTable();
  displayBoard();
  displaySetCounts();
  drawButtonsInGame();
  elapsedTime = millis() - startTime;
  displayTimer();
  
  if(gameEnded) {
    displayGameOverMessage();
  } else {
    gameEnded = isGameEnded();
  }
}


void drawButtonsInGame() {
  for (int buttonIndex = 0; buttonIndex < buttonsInGame.length; buttonIndex++) {
    float x = buttonsInGame[buttonIndex][0];
    float y = buttonsInGame[buttonIndex][1];
    float width = buttonsInGame[buttonIndex][2];
    float height = buttonsInGame[buttonIndex][3];
    drawButtonInGame(buttonIndex + 8, x, y, width, height);
  } 
}
