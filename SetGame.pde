import java.util.HashSet;
import java.util.Set;
import java.util.List;

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
}

void draw() {
 drawTable();
 drawCardGrid();
  switch (selectedScreen) {
    case SCREEN_MENU:
      drawMenu();
      break;
    case SCREEN_GAMEMODE:
      drawGamemode();
      break;
    case SCREEN_SETTINGS:
      drawSettings();
      break;
    case SCREEN_RULES:
      drawRules();
      break;
    case SCREEN_27CARDSSET:
      drawGame27();
      break;
    case SCREEN_81CARDSSET:
      drawGame81();
      break;
    case SCREEN_PAUSED:
      drawPause();
      break;
    case SCREEN_GAMEOVER:
      drawGameover();
      break;
      
  }
}
