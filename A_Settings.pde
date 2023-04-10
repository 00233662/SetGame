/*
Imports
*/
import java.util.Collections;
import java.util.Arrays;
import java.util.List;

/*
Constants
*/
final ArrayList<String> coloring = new ArrayList<String>();
final ArrayList<String> shapes = new ArrayList<String>();
final int maxNumber = 3;
final ArrayList<String> shading = new ArrayList<String>();

final int NUM_FEATURES = 4;
final int NUM_OPTIONS = 3;
final int NUM_CARDS = NUM_FEATURES * NUM_OPTIONS * NUM_OPTIONS * NUM_OPTIONS;

// Scherm breedte en hoogte
final int screenWidth = 900;
final int screenHeight = 750;

// Game schermen
final int MENU = 0;
final int GAMEMODE = 1;
final int CARDS27SET = 2;
final int CARDS81SET = 3;
final int RULES = 4;
final int LEADERBOARD = 5;

// Kleuren die gebruikt worden voor het rooster, menu's, tekst en de HAN-roze accentkleur
final color TABLE_COLOR_1 = #f7b3cc; //
final color TABLE_COLOR_2 = #e50056; //
final color MENU_COLOR = #000000; // Black
final color HAN_ROZE = #e50056; //HAN roze
final color TEXT_1 = #000000; // Zwart
final color TEXT_2 = #ffffff;

// Menu en knoppenhoogte
final float MARGIN = 0.015625 * screenWidth;
final float MENUHEIGHT = 0.26666666666 * screenHeight;
final float ENDHEIGHT = (screenWidth - MENUHEIGHT) * 0.8;
final float MENU_BUTTONWIDTH = screenWidth / 3;
final float MENU_BUTTONHEIGHT = screenHeight / 10;

//textSize
final float TEXT_16 = 0.025 * screenWidth;
final float TEXT_20 = 0.03125 * screenWidth;
final float TEXT_48 = 0.075 * screenWidth;
final float TEXT_TITEL = 0.225 * screenHeight;

/*
Global variables
*/

boolean usingShades = false; // veranderen voor de 27 of 81 kaart versie
boolean gameEnded = false; // Einde van de game
boolean hintGiven = true; 


int cardWidth = screenWidth / 6;
int cardHeight = (cardWidth / 3) * 2;
int gridRows = 3;
int gridCols = 3;

ArrayList<String> uniqueCards = new ArrayList<String>();
int[][] board = new int[15][NUM_FEATURES];
ArrayList<String> graveyard = new ArrayList<String>();
int[][] selectedCards = new int[3][NUM_FEATURES];
int deckIndex = 0;
boolean[] selectedCardIndices = new boolean[15];
int numSelectedCards = 0;
