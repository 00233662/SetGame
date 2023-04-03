void mousePressed() {
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

int[] getClickedCell() {
  int clickedRow = (mouseY - 50) / (cardHeight + 10);
  int clickedCol = (mouseX - 50) / (cardWidth + 10);
  return new int[]{clickedRow, clickedCol};
}

boolean isValidCell(int row, int col) {
  return row >= 0 && row < gridRows && col >= 0 && col < gridCols;
}

boolean isCardSelectable(int clickedIndex) {
  String card = uniqueCards.get(clickedIndex);
  return !graveyard.contains(card);
}

void handleCardSelection(int clickedIndex) {
  if (!selectedCardIndices[clickedIndex]) {
    selectCard(clickedIndex);
  } else {
    unselectCard(clickedIndex);
  }
}

void processSelectedCards() {
  if (isValidSet(selectedCards)) {
    println("Valid set!");
    moveSelectedCardsToGraveyard();
  } else {
    println("Invalid set!");
  }
  resetSelection();
}

void selectCard(int clickedIndex) {
  selectedCards[numSelectedCards] = board[clickedIndex];
  selectedCardIndices[clickedIndex] = true;
  numSelectedCards++;
}

void unselectCard(int clickedIndex) {
  for (int i = 0; i < numSelectedCards; i++) {
    if (Arrays.equals(selectedCards[i], board[clickedIndex])) {
      for (int j = i; j < numSelectedCards - 1; j++) {
        selectedCards[j] = selectedCards[j + 1];
      }
      numSelectedCards--;
      selectedCardIndices[clickedIndex] = false;
    }
  }
}

void resetSelection() {
  numSelectedCards = 0;
  for (int i = 0; i < selectedCardIndices.length; i++) {
    selectedCardIndices[i] = false;
  }
}

void moveSelectedCardsToGraveyard() {
  int removedCards = 0;

  for (int i = 0; i < selectedCardIndices.length; i++) {
    if (selectedCardIndices[i]) {
      removedCards = processSelectedCard(i, removedCards);
    }
  }
}

int processSelectedCard(int index, int removedCards) {
  String card = uniqueCards.get(index);
  graveyard.add(card);

  if (deckIndex < uniqueCards.size()) {
    String newCard = uniqueCards.get(deckIndex);
    uniqueCards.set(index, newCard);
    updateCardFeatures(index, newCard);
    deckIndex++;
  } else {
    board[index] = new int[NUM_FEATURES];
    uniqueCards.set(index, null);
    removedCards++;
  }

  return removedCards;
}

void updateCardFeatures(int index, String card) {
  int[] cardFeatures = new int[4];
  for (int j = 0; j < coloring.size(); j++) {
    if (card.contains(coloring.get(j))) {
      cardFeatures[0] = j;
    }
  }
  for (int j = 0; j < shapes.size(); j++) {
    if (card.contains(shapes.get(j))) {
      cardFeatures[1] = j;
    }
  }
  for (int j = 0; j < maxNumber; j++) {
    if (card.contains(String.valueOf(j + 1))) {
      cardFeatures[2] = j;
    }
  }
  if (usingShades) {
    for (int j = 0; j < shading.size(); j++) {
      if (card.contains(shading.get(j))) {
        cardFeatures[3] = j;
      }
    }
  } else {
    cardFeatures[3] = 0;
  }
  board[index] = cardFeatures;
}

boolean isGameEnded() {
  if (countCardsLeftInDeck() == 0) {
    int setsOnBoard = countSetsOnBoard();
    if (setsOnBoard == 0) {
      return true;
    }
  }
  return false;
}
