// Initialisatie van schermnummers
final int SCREEN_MENU = 0;
final int SCREEN_GAMEMODE = 1;
final int SCREEN_SETTINGS = 2;
final int SCREEN_RULES = 3;
final int SCREEN_27CARDSSET = 4;
final int SCREEN_81CARDSSET = 5;
final int SCREEN_PAUSED = 6;
final int SCREEN_GAMEOVER = 7;

// Boolean om aan te geven of er wel of niet gebruik wordt gemaakt van shading
boolean usingShades = false; // veranderen voor de 27 of 81 kaart versie
boolean gameStarted = false; // game started
boolean gameEnd = false; // game ended
boolean givingClue = false;

// Scherm breedte en hoogte
final int screenWidth = 1000;
final int screenHeight = 800;

// Huidig scherm en geselecteerd scherm
int screen = 0;
int selectedScreen = SCREEN_MENU;

// Aantal nieuwe set kaarten
int newSetCards;

// Timers
int runningTimer;
int runningTimerEnd;
int gameTimer = 0;
int setTimer = 0;
int runningTimerStart;
int timeElapsed = 0;

// Random kaart, aantal kolommen en rijen, marges, spacing, hoogte en breedte van kaarten
int randomkaart;
int gridCols = 3;
int gridRows = 4;
int xMargin = 50;     // Horizontal margin between the grid and the window edge
int yMargin = 50;     // Vertical margin between the grid and the window edge
int xSpacing = 10;    // Horizontal spacing between cards
int ySpacing = 10;    // Vertical spacing between cards
int cardHeight = screenHeight / 8;
int cardWidth = cardHeight * 2;


// Hoogtes en breedtes van menu en pop-upvensters
float space = 0.1 * screenHeight;
float menuHeight = 0.26666666666 * screenHeight;
float popUpHeight = (screenHeight - menuHeight) * 0.8;
float menuButtonHeight = screenHeight / 10;
float menuButtonWidth = screenWidth / 3;

// Tekstformaten voor verschillende typen koppen en teksten
float tekstStandaard = 0.01875 * screenWidth;
float tekstKop3 = 0.025 * screenWidth;
float tekstKop2 = 0.03125 * screenWidth;
float tekstKop1 = 0.075 * screenWidth;
float tekstTitel = 0.225 * screenHeight;

// Kleuren die gebruikt worden voor het rooster, menu's, tekst en de HAN-roze accentkleur
final color TABLE_COLOR_1 = #ffaaca; //
final color TABLE_COLOR_2 = #a73e65; //
final color MENU_COLOR = #000000; // Black
final color MENU_STROKE = #e50056; // HAN Roze
final color HAN_ROZE = #e50056; //HAN roze
final color TEXT_COLOR = #000000; // Zwart voor tekst
