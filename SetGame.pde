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
  dealCards();
  calculateSets();
}

void draw() {
  background(0);
  displayBoard();
  displaySetCounts();
}
