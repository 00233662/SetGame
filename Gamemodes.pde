/*#########################
screen 0 = Main menu
screen 1 = Game Modes
screen 2 = Games
screen 3 = Rules
screen 4 = Leaderboard
#########################*/

void playSetGame() {
  drawTable();
  displayBoard();
  displaySetCounts();
  if(gameEnded) {
    displayGameOverMessage();
  } else {
    gameEnded = isGameEnded();
  }
}
