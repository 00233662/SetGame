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
final int screenWidth = 1000;
final int screenHeight = 800;

// Kleuren die gebruikt worden voor het rooster, menu's, tekst en de HAN-roze accentkleur
final color TABLE_COLOR_1 = #ffaaca; //
final color TABLE_COLOR_2 = #a73e65; //
final color MENU_COLOR = #000000; // Black
final color HAN_ROZE = #e50056; //HAN roze
final color TEXT_COLOR = #000000; // Zwart voor tekst

/*
Global variables
*/

// Boolean om aan te geven of er wel of niet gebruik wordt gemaakt van shading
boolean usingShades = false; // veranderen voor de 27 of 81 kaart versie

int cardWidth = 150;
int cardHeight = 100;
int gridRows = 3;
int gridCols = 3;

ArrayList<String> uniqueCards = new ArrayList<String>();
int[][] board = new int[12][NUM_FEATURES];
ArrayList<String> graveyard = new ArrayList<String>();
int[][] selectedCards = new int[3][NUM_FEATURES];
int deckIndex = 0;
boolean[] selectedCardIndices = new boolean[12];
int numSelectedCards = 0;

int setsOnBoard = 0;
int setsCollected = 0;
int setsLeft = 0;
