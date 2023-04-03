PImage[] buttonImages = new PImage[12];

void setupButtons() {
  for (int i = 0; i < 12; i++) {
    buttonImages[i] = loadImage("Overige/button" + i + ".png");
  }
}

float[][] buttonsMenu = {
  {screenWidth / 2, screenHeight / 2, MENU_BUTTONWIDTH, MENU_BUTTONHEIGHT}, 
  {screenWidth / 2, screenHeight / 2 + MARGIN + MENU_BUTTONHEIGHT, MENU_BUTTONWIDTH, MENU_BUTTONHEIGHT}, 
  {screenWidth / 2, screenHeight / 2 + MARGIN * 2 + MENU_BUTTONHEIGHT * 2, MENU_BUTTONWIDTH, MENU_BUTTONHEIGHT}, 
  {screenWidth / 2, screenHeight / 2 + MARGIN * 3 + MENU_BUTTONHEIGHT * 3, MENU_BUTTONWIDTH, MENU_BUTTONHEIGHT}
};

void drawButton(int buttonIndex, float x, float y, float width, float height) {
  image(buttonImages[buttonIndex], x - width / 2, y - height / 2, width, height);
}
