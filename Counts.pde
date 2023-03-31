int countSetsOnBoard() {
  int setCount = 0;

  for (int i = 0; i < gridRows * gridCols - 2; i++) {
    if (isCardInGraveyard(i)) {
      continue;
    }
    for (int j = i + 1; j < gridRows * gridCols - 1; j++) {
      if (isCardInGraveyard(j)) {
        continue;
      }
      for (int k = j + 1; k < gridRows * gridCols; k++) {
        if (isCardInGraveyard(k)) {
          continue;
        }
        if (isSet(board[i], board[j], board[k])) {
          setCount++;
        }
      }
    }
  }

  return setCount;
}

boolean isCardInGraveyard(int index) {
  String card = uniqueCards.get(index);
  return graveyard.contains(card);
}


int countCardsInGraveyard() {
  return graveyard.size();
}

int countCardsLeftInDeck() {
  return uniqueCards.size() - deckIndex;
}
