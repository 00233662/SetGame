// Initialiseer een ArrayList om de geselecteerde kaartindices op te slaan
ArrayList<Integer> selectedCardIndices = new ArrayList<Integer>();
boolean gameOver = false;
String gameOutcome = "";
ArrayList<ArrayList<Integer>> selectedSets = new ArrayList<ArrayList<Integer>>();

void mousePressed() {
  // Controleer of de muis binnen de grenzen van de tafelgrid valt
  if (mouseX > xMargin && mouseX < xMargin + gridCols * (cardWidth + xSpacing) && mouseY > yMargin && mouseY < yMargin + gridRows * (cardHeight + ySpacing)) {

    // Bereken de rij en kolom van de geselecteerde kaart
    int row = (mouseY - yMargin) / (cardHeight + ySpacing);
    int col = (mouseX - xMargin) / (cardWidth + xSpacing);

    // Bereken de index van de geselecteerde kaart in het deck of graveyard
    int index = row * gridCols + col;
    boolean inDeck = index < deck.size();
    boolean inGraveyard = index >= deck.size() && index < deck.size() + graveyard.size();

    // Controleer of de geselecteerde kaart zich in het deck of graveyard bevindt
    if (inDeck || inGraveyard) {

      // Controleer of de kaart al geselecteerd is
      if (selectedCardIndices.contains(index)) {
        // Deselecteer de kaart
        selectedCardIndices.remove(selectedCardIndices.indexOf(index));
      } else {
        // Voeg de geselecteerde kaart toe aan de lijst van geselecteerde kaarten
        selectedCardIndices.add(index);
      }

      // Controleer of er drie kaarten zijn geselecteerd
      if (selectedCardIndices.size() == 3) {

        // Controleer of de geselecteerde kaarten een set vormen
        if (isSet(getCardAtIndex(selectedCardIndices.get(0)), getCardAtIndex(selectedCardIndices.get(1)), getCardAtIndex(selectedCardIndices.get(2)))) {

           // Verwijder de kaart ook uit de grid als deze zich in het graveyard bevindt
          for (int i = 2; i >= 0; i--) {
            int selectedIndex = selectedCardIndices.get(i);
            if (selectedIndex < deck.size()) {
              deck.remove(selectedIndex);
            } else {
              graveyard.remove(selectedIndex - deck.size());
            // Verwijder de kaart ook uit de grid als deze zich in het graveyard bevindt
              grid.remove(selectedIndex - deck.size());
            }
          }

          // Voeg de set toe aan de lijst van geselecteerde sets
          selectedSets.add(selectedCardIndices);

          // Maak de lijst van geselecteerde kaarten leeg
          selectedCardIndices.clear();

          // Deel nieuwe kaarten uit om de verwijderde kaarten te vervangen
          if (!gameOver) {
            dealCards(3);
          }
        } else {
          // Maak de lijst van geselecteerde kaarten
          selectedCardIndices.clear();
        }
      }
    }
  }
}



String getCardAtIndex(int index) {
  if (index < deck.size()) {
    return deck.get(index);
  }
  else {
    return graveyard.get(index - deck.size());
  }
}
