/*
De functie settings() wordt aangeroepen bij het opstarten van de applicatie en 
zorgt ervoor dat het scherm de grootte krijgt van screenWidth en screenHeight.
*/
void settings() {
  size(screenWidth, screenHeight);
}

/*
De functie setup() wordt ook opgeroepen bij het opstarten van de applicatie.
*/
void setup() {
  setupCardValues();
  setupCards();
  setupButtons();
  dealCards();
  startTime = millis();
}

/*#########################
screen MENU = 0
screen GAMEMODE = 1
screen CARDS27SET = 2
screen CARDS81SET = 3
screen RULES = 4
screen LEADERBOARD = 5
#########################*/

void draw() {
  if(screen == MENU)
    screenMenu();
    
  // Choose game mode 
  if(screen == GAMEMODE)
    screenGameMode();
  
  // Play your gamemode
  if(screen == CARDS27SET || screen == CARDS81SET)
    playSetGame();
  
  // Rules
  if(screen == RULES)
    screenRules();
    
  if(screen == LEADERBOARD)
    screenLeaderBoard();
}
