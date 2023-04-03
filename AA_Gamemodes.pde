/*#########################
screen 0 = Main menu
screen 1 = Game Modes
screen 2 = 27 Set Game
screen 3 = 81 Set Game
screen 4 = Rules
screen 5 = Leaderboard
#########################*/

String menuMassege;
boolean playingTheGame = false;

void playSetGame() {
  drawTable();
  displayBoard();
  displaySetCounts();
  gridRows = 3;
  usingShades = true;
  if(screen == 3)
    gridRows = 4;
    usingShades = true;
}
