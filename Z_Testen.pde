//void testCountSetsOnBoard() {
//  // Initialize card values and board
//  setupCardValues();
//  setupCards();
//  dealCards();

//  // Print the current state of the board
//  System.out.println("Board state:");
//  for (int i = 0; i < gridRows * gridCols; i++) {
//    System.out.print("Card " + (i + 1) + ": ");
//    for (int j = 0; j < 4; j++) {
//      System.out.print(board[i][j] + " ");
//    }
//    System.out.println();
//  }

//  // Calculate the number of sets on the board and print the sets found
//  int setsCount = 0;
//  for (int i = 0; i < gridRows * gridCols - 2; i++) {
//    for (int j = i + 1; j < gridRows * gridCols - 1; j++) {
//      for (int k = j + 1; k < gridRows * gridCols; k++) {
//        int[][] selectedCards = new int[][] {board[i], board[j], board[k]};
//        if (isValidSet(selectedCards)) {
//          setsCount++;
//          System.out.println("Set " + setsCount + ": Cards " + (i + 1) + ", " + (j + 1) + ", " + (k + 1));
//        }
//      }
//    }
//  }

//  // Print the total number of sets found
//  System.out.println("Number of sets on the board: " + setsCount);

//  // Manually verify the result printed in the console
//}


//void setupAndRunTest() {
//  testCountSetsOnBoard();
//}
