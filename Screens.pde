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
  fill(TEXT_2);
  
  float lineHeight = TEXT_16;
  float startY = screenHeight * 0.1;
  
  for (int i = 0; i < rules.length; i++) {
    text(rules[i], screenWidth / 2, startY + i * lineHeight);
  }
  drawButton(7, buttonsMenu[4][0], buttonsMenu[4][1], buttonsMenu[4][2], buttonsMenu[4][3]);
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
  drawButton(7, buttonsMenu[4][0], buttonsMenu[4][1], buttonsMenu[4][2], buttonsMenu[4][3]);
}
