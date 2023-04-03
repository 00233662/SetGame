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
  
}

void draw() {
  drawTable();
  displayBoard();
  displaySetCounts();
  
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
