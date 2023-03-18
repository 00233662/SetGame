// Initialiseer geselecteerde kaart index op -1
int selectedCardIndex = -1; 


void drawTable() {
  background(TABLE_COLOR_1);
  noStroke();
  fill(TABLE_COLOR_2);
  rect(0, 0, screenWidth, space * 0.4);
  rect(0, screenHeight, screenWidth, -space * 3.7);
  rect(0, 0, space * 0.5, screenHeight);
  rect(screenWidth, 0, -space * 4, screenHeight);
}

void drawCardGrid() {
  // Loop door elke rij van het raster
  for (int row = 0; row < gridRows; row++) {
    // Loop door elke kolom van het raster
    for (int col = 0; col < gridCols; col++) {

      // Bereken de x- en y-coördinaten van de huidige rasterpositie
      int x = xMargin + col * (cardWidth + xSpacing);
      int y = yMargin + row * (cardHeight + ySpacing);

      // Bereken de index van de huidige kaart in het deck
      int index = row * gridCols + col;

      // Controleer of de huidige index geldig is. (groter of kleiner)
      if (index < deck.size()) {

        // Haal de bijbehorende PImage op voor de huidige kaart uit de cards HashMap
        String card = deck.get(index);
        PImage img = cards.get(card);

        // Teken de kaartafbeelding op het scherm op de huidige rasterpositie
        image(img, x, y, cardWidth, cardHeight);

        // Controleer of de huidige kaart de geselecteerde kaart is
        if (selectedCardIndices.contains(index)) {
          // Teken een rand rond de geselecteerde kaart
          stroke(255, 0, 0);
          strokeWeight(4);
          noFill();
          rect(x, y, cardWidth, cardHeight);
        }
      }
      else {
        // Bereken de index van de huidige kaart in de graveyard
        int graveyardIndex = index - deck.size();

        // Controleer of de huidige index geldig, groter of kleiner is
        if (graveyardIndex < graveyard.size()) {

          // Haal de bijbehorende PImage op voor de huidige kaart uit de cards HashMap
          String card = graveyard.get(graveyardIndex);
          PImage img = cards.get(card);

          // Teken de kaartafbeelding op het scherm op de huidige rasterpositie
          image(img, x, y, cardWidth, cardHeight);

          // Controleer of de huidige kaart de geselecteerde kaart is
          if (selectedCardIndices.contains(index)) {
            // Teken een rand rond de geselecteerde kaart
            stroke(255, 0, 0);
            strokeWeight(4);
            noFill();
            rect(x, y, cardWidth, cardHeight);
          }
        }
      }
    }
  }
}



void drawTimer() {
  fill(HAN_ROZE);
  if (screen == SCREEN_PAUSED) {
    text("Tijd: " + timeElapsed/1000, screenWidth - (4 / screenWidth), 0 + (screenHeight + 100));
  } else if (screen == SCREEN_GAMEOVER) {
    text("Time: " + (runningTimerEnd - runningTimerStart + timeElapsed)/1000, screenWidth - (4 / screenWidth), 0 + (screenHeight + 100));
  } else {
    text("Time: " + (millis() - runningTimerStart + timeElapsed)/1000, screenWidth - (4 / screenWidth), 0 + (screenHeight + 100));
  }
}

public void togglePauseResume() {
  if (screen == SCREEN_PAUSED) {
    resumeGame();
  } else {
    pauseGame();
  }
}

void pauseGame() {
  if(screen == SCREEN_PAUSED);
  timeElapsed += millis() - runningTimerStart;
}

public void resumeGame() {
  if(screen == SCREEN_27CARDSSET || screen == SCREEN_81CARDSSET);
  runningTimerStart = millis();
}
