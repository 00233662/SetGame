/*#########################
screen MENU = 0
screen GAMEMODE = 1
screen CARDS27SET = 2
screen CARDS81SET = 3
screen RULES = 4
screen LEADERBOARD = 5
#########################*/

int screen = MENU;

void screenMenu() {
  drawTable();
  textSize(TEXT_TITEL);
  textAlign(CENTER, CENTER);
  fill(TEXT_2);
  text("Set Game", screenWidth / 2, MENUHEIGHT); 
  
  for (int buttonIndex = 0; buttonIndex < 4; buttonIndex++) {
    float x = buttonsMenu[buttonIndex][0];
    float y = buttonsMenu[buttonIndex][1];
    drawButton(buttonIndex, x, y, MENU_BUTTONWIDTH, MENU_BUTTONHEIGHT);
  }
}

    
void screenGameMode() {
  drawTable();
  textSize(TEXT_48);
  textAlign(CENTER, CENTER);
  fill(TEXT_2);
  text("Choose your gamemode", screenWidth / 2, MENUHEIGHT);
  
  for (int buttonIndex = 0; buttonIndex < 4; buttonIndex++) {
    float x = buttonsMenu[buttonIndex][0];
    float y = buttonsMenu[buttonIndex][1];
    drawButton(buttonIndex + 4, x, y, MENU_BUTTONWIDTH, MENU_BUTTONHEIGHT);
  }
}
  
void screenRules() {
  String[] rules = loadStrings("Overige/Rules.txt");
  drawTable();
  textSize(TEXT_16);
  textAlign(CENTER, CENTER);
  fill(TEXT_1);
  
  float lineHeight = TEXT_16;
  float startY = screenHeight * 0.1;
  
  for (int i = 0; i < rules.length; i++) {
    text(rules[i], screenWidth / 2, startY + i * lineHeight);
  }
  drawButton(7, buttonsMenu[4][0], buttonsMenu[4][1], buttonsMenu[4][2], buttonsMenu[4][3]);
}

void screenLeaderBoard() {
  drawTable();
  String[] leaderboard = loadStrings("Overige/Leaderboard.txt");
  drawTable();
  textSize(TEXT_28);
  textAlign(CENTER, CENTER);
  fill(TEXT_1);

  float lineHeight = TEXT_20;
  float startY = screenHeight * 0.1;

  text("Player", screenWidth * 0.25, startY);
  text("Sets", screenWidth * 0.45, startY);
  text("Score", screenWidth * 0.6, startY);
  text("Time", screenWidth * 0.75, startY);

  for (int i = 0; i < leaderboard.length; i++) {
    String[] data = split(leaderboard[i], ',');

    if (data.length == 4) {
      String playerName = data[0].trim();
      String elapsedTime = data[1].trim();
      String setsFound = data[2].trim();
      String playerScore = data[3].trim();

      long millis = Long.parseLong(elapsedTime);
      long minutes = (millis / 1000) / 60;
      long seconds = (millis / 1000) % 60;
      String formattedTime = String.format("%02d:%02d", minutes, seconds);

      textSize(TEXT_20);
      text(playerName, screenWidth * 0.25, startY + (i + 3) * lineHeight);
      text(setsFound, screenWidth * 0.45, startY + (i + 3) * lineHeight);
      text(playerScore, screenWidth * 0.6, startY + (i + 3) * lineHeight);
      text(formattedTime, screenWidth * 0.75, startY + (i + 3) * lineHeight);
    }
  }
  drawButton(7, buttonsMenu[4][0], buttonsMenu[4][1], buttonsMenu[4][2], buttonsMenu[4][3]);
}
