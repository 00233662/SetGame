void mousePressed() {
  if (screen == 0) { 
    handleMenuButtons();
  } else if (screen == 1) {
    handleModeButtons();
  } else if (screen == 2) {
    handleInGameButtons();
    handleCardSelection();
  } else if (screen == 3) {
    handleCardSelection();
  } else if (screen == 4 || screen == 5) {
    handleBack4And5Buttons();
  }
}

void handleCardSelection() {
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
          screen = 2;
          break;
        case 1:
          screen = 1;
          break;
        case 2:
          screen = 4;
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
          screen = 2;
          break;
        case 1:
          screen = 3;
          break;
        case 2:
          screen = 5;
          break;
        case 3:
          screen = 0;
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
    screen = 0;
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
          exit(); // Pauze
          break;
        case 1:
          initializeSetGame();
          break;
        case 2:
          screen = 0; // exit button
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
