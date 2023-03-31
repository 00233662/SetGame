void calculateSets() {
  setsOnBoard = countSetsOnBoard();
  setsLeft = countSetsLeft();
}

void updateSetCounts() {
  setsOnBoard = countSetsOnBoard();
  setsCollected++;
  setsLeft = countSetsLeft();
}

int countSetsOnBoard() {
  int count = 0;
  for (int i = 0; i < gridRows * gridCols - 2; i++) {
    for (int j = i + 1; j < gridRows * gridCols - 1; j++) {
      for (int k = j + 1; k < gridRows * gridCols; k++) {
        if (isSet(board[i], board[j], board[k])) {
          count++;
        }
      }
    }
  }
  return count;
}

int countSetsLeft() {
  return uniqueCards.size() / 3 - setsCollected;
}
