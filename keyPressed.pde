void keyPressed() {
  if (gameEnded && keyCode == ENTER) {
    if (!typedText.isEmpty()) {
      saveScoreToFile(typedText, playerScore, elapsedTime);
      resetEndScreen();
    }
  } else if (gameEnded) {
    if (keyCode == BACKSPACE) {
      if (typedText.length() > 0) {
        typedText = typedText.substring(0, typedText.length() - 1);
      }
    } else if (typedText.length() < 15) {
      typedText += key;
    }
  }
}

void resetEndScreen() {
  screen = LEADERBOARD;
  gameInitialized = false;
  gameEnded = false;
  stoppedTime = false;
  typedText = "";
}


void savePlayerScore() {
  String[] lines = loadStrings("Overige/Leaderboard.txt");
  String newEntry = playerName + ", " + elapsedTime + ", " + playerScore;
  String[] newLines = new String[lines.length + 1];
  for (int i = 0; i < lines.length; i++) {
    newLines[i] = lines[i];
  }
  newLines[lines.length] = newEntry;
  saveStrings("Leaderboard.txt", newLines);
}

void saveScoreToFile(String playerName, int playerScore, int elapsedTime) {
  String leaderboardFilePath = "Overige/Leaderboard.txt";

  try {
    String[] existingLines = loadStrings(leaderboardFilePath);
    String[] newLines = new String[existingLines.length + 1];

    for (int i = 0; i < existingLines.length; i++) {
      newLines[i] = existingLines[i];
    }

    String dataToSave = playerName + "," + playerScore + "," + elapsedTime;
    newLines[existingLines.length] = dataToSave;

    saveStrings(leaderboardFilePath, newLines);
  } catch (Exception e) {
    println("An error occurred while saving the score: " + e.getMessage());
  }
}
