/*#########################
screen MENU = 0
screen GAMEMODE = 1
screen CARDS27SET = 2
screen CARDS81SET = 3
screen RULES = 4
screen LEADERBOARD = 5
#########################*/

void mousePressed() {
  if (screen == MENU) { 
    handleMenuButtons();
  } else if (screen == GAMEMODE) {
    handleModeButtons();
  } else if (screen == CARDS27SET) {
    handleInGameButtons();
    handleCardSelection();
  } else if (screen == CARDS81SET) {
    handleInGameButtons();
    handleCardSelection();
  } else if (screen == RULES || screen == LEADERBOARD) {
    handleBack4And5Buttons();
  }
}

void handleCardSelection() {
  if (isPaused) {
    return;
  }
  
  int[] clickedCell = getClickedCell();
  int clickedRow = clickedCell[0];
  int clickedCol = clickedCell[1];
  if (isValidCell(clickedRow, clickedCol)) {
    int clickedIndex = clickedRow * gridCols + clickedCol;
    handleCardSelection(clickedIndex);
  }
  if (numSelectedCards == 3) {
    processSelectedCards();
  }
}

void handleMenuButtons() {
  for (int buttonIndex = 0; buttonIndex < 4; buttonIndex++) {
    float x = buttonsMenu[buttonIndex][0];
    float y = buttonsMenu[buttonIndex][1];
    float width = MENU_BUTTONWIDTH;
    float height = MENU_BUTTONHEIGHT;

    if (buttonPressed(x, y, width, height)) {
      switch (buttonIndex) {
        case 0:
          screen = CARDS27SET;
          gridRows = 3;
          gridCols = 3;
          usingShades = false;
          break;
        case 1:
          screen = GAMEMODE;
          break;
        case 2:
          screen = RULES;
          break;
        case 3:
          exit();
          break;
      }
    }
  }
}


void handleModeButtons() {
  for (int buttonIndex = 0; buttonIndex < 4; buttonIndex++) {
    float x = buttonsMenu[buttonIndex][0];
    float y = buttonsMenu[buttonIndex][1];
    float width = MENU_BUTTONWIDTH;
    float height = MENU_BUTTONHEIGHT;

    if (buttonPressed(x, y, width, height)) {
      switch (buttonIndex) {
        case 0:
          screen = CARDS27SET;
          board = new int[9][NUM_FEATURES];
          gridRows = 3;
          gridCols = 3;
          usingShades = false;
          break;
        case 1:
          screen = CARDS81SET;
          board = new int[12][NUM_FEATURES];
          gridRows = 4;
          gridCols = 3;
          usingShades = true;
          break;
        case 2:
          screen = LEADERBOARD;
          break;
        case 3:
          screen = MENU;
          break;
      }
    }
  }
}

void handleBack4And5Buttons() {
  float x = buttonsMenu[4][0];
  float y = buttonsMenu[4][1];
  float width = buttonsMenu[4][2];
  float height = buttonsMenu[4][3];

  if (buttonPressed(x, y, width, height)) {
    screen = MENU;
  }
}

void handleInGameButtons() {
  for (int buttonIndex = 0; buttonIndex < buttonsInGame.length; buttonIndex++) {
    float x = buttonsInGame[buttonIndex][0];
    float y = buttonsInGame[buttonIndex][1];
    float width = buttonsInGame[buttonIndex][2];
    float height = buttonsInGame[buttonIndex][3];

    if (buttonPressed(x, y, width, height)) {
      switch (buttonIndex) {
        case 0:
          isPaused = !isPaused;
          if (isPaused) {
            stoppedTime = true;
          } else {
            stoppedTime = false;
            startTime = millis() - elapsedTime;
          }
          break;
        case 1:
          gameInitialized = false; // reset button
          break;
        case 2:
          screen = MENU; // exit button
          gameInitialized = false;
          break;
        case 3:
          giveHint(); // give hint
          break;
        case 4:
          exit(); // add 3 cards
          break;
      }
    }
  }
}
