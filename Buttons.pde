PImage[] buttonImages = new PImage[13];

void setupButtons() {
  for (int i = 0; i < 13; i++) {
    buttonImages[i] = loadImage("Overige/button" + i + ".png");
  }
}

float[][] buttonsMenu = {
  {screenWidth / 2, screenHeight / 2, MENU_BUTTONWIDTH, MENU_BUTTONHEIGHT}, 
  {screenWidth / 2, screenHeight / 2 + MARGIN + MENU_BUTTONHEIGHT, MENU_BUTTONWIDTH, MENU_BUTTONHEIGHT}, 
  {screenWidth / 2, screenHeight / 2 + MARGIN * 2 + MENU_BUTTONHEIGHT * 2, MENU_BUTTONWIDTH, MENU_BUTTONHEIGHT}, 
  {screenWidth / 2, screenHeight / 2 + MARGIN * 3 + MENU_BUTTONHEIGHT * 3, MENU_BUTTONWIDTH, MENU_BUTTONHEIGHT},
  {screenWidth / 2, screenHeight * 0.88, screenWidth / 4, screenHeight / 10}
};

float[][] buttonsInGame = {
  {screenWidth * 0.2, screenHeight * 0.9, screenWidth * 0.20, screenHeight * 0.08},
  {screenWidth * 0.5, screenHeight * 0.9, screenWidth * 0.20, screenHeight * 0.08},
  {screenWidth * 0.8, screenHeight * 0.9, screenWidth * 0.20, screenHeight * 0.08},
  {screenWidth * 0.8, screenHeight * 0.6, screenWidth * 0.20, screenHeight * 0.08},
  {screenWidth * 0.8, screenHeight * 0.7, screenWidth * 0.20, screenHeight * 0.08}
};

void drawButton(int buttonIndex, float x, float y, float width, float height) {
  image(buttonImages[buttonIndex], x - width / 2, y - height / 2, width, height);
}

void drawButtonInGame(int buttonIndex, float x, float y, float width, float height) {
  image(buttonImages[buttonIndex], x - width / 2, y - height / 2, width, height);
}

boolean buttonPressed(float x, float y, float width, float height) {
  return mouseX > x - width / 2 && mouseX < x + width / 2 && mouseY > y - height / 2 && mouseY < y + height / 2;
}
