/*#########################
screen 0 = Main menu
screen 1 = Game Modes
screen 2 = 27 Set Game
screen 3 = 81 Set Game
screen 4 = Rules
screen 5 = Leaderboard
#########################*/

int screen = 0;

void screenMenu() {
  drawTable();
  textSize(TEXT_TITEL);
  textAlign(CENTER, CENTER);
  fill(TEXT_2);
  text("Set Game", screenWidth / 2, MENUHEIGHT); 
  
  for (int buttonIndex = 0; buttonIndex < 4; buttonIndex++) {
    drawButton(buttonIndex, buttonsMenu[buttonIndex][0], buttonsMenu[buttonIndex][1], buttonsMenu[buttonIndex][2], buttonsMenu[buttonIndex][3]);
  }
}

    
void screenGameMode() {
  drawTable();
  textSize(TEXT_48);
  textAlign(CENTER, CENTER);
  fill(TEXT_2);
  text("Choose your gamemode", screenWidth / 2, MENUHEIGHT);
  
  for (int buttonIndex = 0; buttonIndex < 4; buttonIndex++) {
    drawButton(buttonIndex + 4, buttonsMenu[buttonIndex][0], buttonsMenu[buttonIndex][1], buttonsMenu[buttonIndex][2], buttonsMenu[buttonIndex][3]);
  }
}
  
void screenRules() {
  String[] rules = loadStrings("Overige/Rules.txt");
  drawTable();
  textSize(TEXT_16);
  textAlign(CENTER, CENTER);
  fill(TEXT_2);
  
  float lineHeight = TEXT_16;
  float startY = screenHeight * 0.1;
  
  for (int i = 0; i < rules.length; i++) {
    text(rules[i], screenWidth / 2, startY + i * lineHeight);
  }
  drawButton(7, screenWidth / 2, screenHeight * 0.85, screenWidth / 4, screenHeight / 10);
}


void screenLeaderBoard() {
  drawTable();
  String[] Leaderboard = loadStrings("Overige/Leaderboard.txt");
  drawTable();
  textSize(TEXT_16);
  textAlign(CENTER, CENTER);
  fill(TEXT_2);
  
  float lineHeight = TEXT_16;
  float startY = screenHeight * 0.1;
  
  for (int i = 0; i < Leaderboard.length; i++) {
    text(Leaderboard[i], screenWidth / 2, startY + i * lineHeight);
  }
  drawButton(7, screenWidth / 2, screenHeight * 0.85, screenWidth / 4, screenHeight / 10);
}
