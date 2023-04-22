void keyPressed() {
  if (gameEnded && keyCode == ENTER) {
    if (!typedText.isEmpty()) {
      saveScoreToFile(playerName, playerScore, elapsedTime, setsFound, usingShades);
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


void saveScoreToFile(String playerName, int playerScore, int elapsedTime, int setsFound, boolean usingShades) {
  String leaderboardFilePath = usingShades ? "Overige/Leaderboard_81.txt" : "Overige/Leaderboard_27.txt";

  try {
    String[] existingLines = loadStrings(leaderboardFilePath);
    String[] newLines = new String[existingLines.length + 1];

    for (int i = 0; i < existingLines.length; i++) {
      newLines[i] = existingLines[i];
    }

    String dataToSave = playerName + "," + elapsedTime + "," + setsFound + "," + playerScore;
    newLines[existingLines.length] = dataToSave;

    saveStrings(leaderboardFilePath, newLines);
  } catch (Exception e) {
    println("An error occurred while saving the score: " + e.getMessage());
  }
}
