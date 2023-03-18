import java.util.Collections;
import java.util.Arrays;

/*
Dit zijn de definitie van lijsten die kleuren, vormen en shading bevatten, 
evenals een constante maxNumber die gelijk is aan 3.
*/
final ArrayList<String> coloring = new ArrayList<String>();
final ArrayList<String> shapes = new ArrayList<String>();
final int maxNumber = 3;
final ArrayList<String> shading = new ArrayList<String>();

/*
Dit zijn de definitie van de verschillende kaarten, de kaartstapel (deck), 
de dode stapel (graveyard) en de kaarten op tafel (grid).
*/
HashMap<String, PImage> cards = new HashMap<String, PImage>();
ArrayList<String> deck;
ArrayList<String> graveyard = new ArrayList<String>();
ArrayList<String> grid = new ArrayList<String>();

/*
Dit is de definitie van de geselecteerde kaarten en het aantal geselecteerde kaarten.
*/
String[] selectedCards = new String[3];
int numSelected = 0;

/*
Deze functie initialiseert de lijsten coloring, shapes en shading met verschillende kleuren, vormen en shading.
*/
void setupCardValues() {
  coloring.add("blauw");
  coloring.add("groen");
  coloring.add("rood");
 
  shapes.add("kronkel");
  shapes.add("ovaal");
  shapes.add("ruit");
  
  shading.add("vol");
  shading.add("halfvol");
  shading.add("leeg");
}

/*
Deze functie initialiseert de kaarten met kleur, vorm, nummer en shading. loadImage() laadt de 
afbeeldingen van de kaarten. De kaarten worden vervolgens in de deck gezet en de kaarten worden geschud.
*/
void setupCards() {
  int maxNumber = 3;
  
  for (int colors = 0; colors < coloring.size(); colors++) {
    for (int shape = 0; shape < shapes.size(); shape++) {
      for (int number = 0; number < maxNumber; number++) {
        int numbers = number + 1;
        
        if (usingShades) {
          for (int shade = 0; shade < shading.size(); shade++) {
            PImage img = loadImage(coloring.get(colors) + "_" + shapes.get(shape) + "_" + numbers + "_" + shading.get(shade) + ".png");
            cards.put(coloring.get(colors) + "_" + shapes.get(shape) + "_" + numbers + "_" + shading.get(shade), img); 
          }
        } else {
          PImage img = loadImage(coloring.get(colors) + "_" + shapes.get(shape) + "_" + numbers + "_vol.png");
          cards.put(coloring.get(colors) + "_" + shapes.get(shape) + "_" + numbers, img); 
        }
      }
    }
  }
  
  deck = new ArrayList<String>(cards.keySet());
  Collections.shuffle(deck);
}

/*
Deze functie geeft een willekeurige kaart terug uit de array van kaarten die beschikbaar zijn voor het spel.
*/
String getRandomCard() {
  int randColour = int(random(coloring.size()));
  int randShape = int(random(shapes.size()));
  int randNumber = int(random(maxNumber));
  int randShade = int(random(shading.size()));
  
  int maxNumber = randNumber + 1;
      
  String card;
  do {
    if (usingShades) {
      card = coloring.get(randColour) + "_" + shapes.get(randShape) + "_" + maxNumber + "_" + shading.get(randShade);
    } else {
      card = coloring.get(randColour) + "_" + shapes.get(randShape) + "_" + maxNumber;
    }
  } while (deck.contains(card) || graveyard.contains(card));
  
  return card;
}

/*
Deze functie genereert een nieuwe set kaarten voor het spel door gebruik te maken 
van de getRandomCard() functie. De nieuwe kaarten worden in een array geplaatst.
*/
void generateCards() {
  deck.clear();
  cards.clear();
  
  for(int i = 0; i < newSetCards; i++) {
    String card = getRandomCard();
    deck.add(card);
  }
  
  for(String card : deck) {
    cards.put(card, loadImage(card + ".png"));
  }
}

/*
Deze functie deelt een aantal kaarten uit aan de tafel. Het controleert of er een set van drie 
kaarten op tafel ligt, en zo ja, dan worden er geen kaarten uitgedeeld (meer dan 12). 
Als er geen sets op tafel liggen, worden er nieuwe kaarten uitgedeeld vanuit de kaartstapel. 
Als de kaartstapel leeg en er geen sets meer op tafel liggen eindig het spel.
*/
void dealCards(int numCards) {
  // Controleerd of er sets zijn in de kaartstapel.
  int numDeckSets = countSets(deck);
  if (numDeckSets > 0) {
    // als er sets zijn, komen er geen nieuw kaarten
    return;
  }

    // Controleer of er geen kaarten meer over zijn in de stapel en geen sets meer op tafel zijn
  if (deck.size() == 0 && countSets(grid) == 0) {
  // Beëindig het spel als er geen kaarten meer over zijn in de stapel en geen sets meer op tafel zijn
    gameEnd = true;
  }

  // Deal een bepaald aantal kaarten op tafel
  for (int i = 0; i < numCards; i++) {
    // controleer aantal kaarten over in de kaartenstapel
    if (deck.size() == 0) {
      // als er geen kaarten meer zijn break loop
      break;
    }

    // Pak de bovenste kaart van de stapel
    String card = deck.remove(0);

    // controleer of de nieuwe kaart een set kan creeëren
    if (grid.size() >= 2) {
      for (int j = 0; j < grid.size() - 1; j++) {
        for (int k = j + 1; k < grid.size(); k++) {
          if (isSet(card, grid.get(j), grid.get(k))) {
            if (!graveyard.contains(card)) {
              graveyard.add(card);
            }
            break;
          }
        }
        if (graveyard.contains(card)) {
          // Als de nieuwe kaart in graveyard is, ga dan verder met de volgende kaart
          break;
        }
      }
    }

    // Als de nieuwe kaart niet bestaand in de graveyard or grid, voeg deze dan toe aan de tafel
    if (!graveyard.contains(card)) {
      if (!grid.contains(card)) {
        grid.add(card);
      }
    }
  }
}


// Functie om het aantal sets in het rooster te tellen
int countSets(ArrayList<String> cards) {
  int numCards = cards.size();
  int numSets = 0;
  
  // Loop door alle mogelijke combinaties van drie geselecteerde kaarten
  for (int i = 0; i < numCards - 2; i++) {
    for (int j = i + 1; j < numCards - 1; j++) {
      for (int k = j + 1; k < numCards; k++) {
        // Check if the three cards form a set
        if (isSet(cards.get(i), cards.get(j), cards.get(k))) {
          numSets++;
        }
      }
    }
  }
  
  return numSets;
}


void shuffleDeck() {
  // Loop door elke kaart in het deck
  for (int i = 0; i < deck.size(); i++) {
    // Genereer een willekeurige index tussen i(0) en het einde van het deck
    int j = (int) random(i, deck.size());
    // Wissel de kaart op index i om met de kaart op index j
    String temp = deck.get(i);
    deck.set(i, deck.get(j));
    deck.set(j, temp);
  }
}


// Controleer of drie kaarten een set vormen en verwijder ze uit het rooster als dat zo is
boolean isSet(String card1, String card2, String card3) {
  if (card1 == null || card2 == null || card3 == null) {
    return false;
  }

  boolean isSetColor = false;
  boolean isSetShape = false;
  boolean isSetNumber = false;
  boolean isSetShading = false;
  
  String[] card1Parts = card1.split("_");
  String[] card2Parts = card2.split("_");
  String[] card3Parts = card3.split("_");
  
  // Controleer of alle kleuren hetzelfde zijn of allemaal verschillend
  if(card1Parts[0].equals(card2Parts[0]) && card1Parts[0].equals(card3Parts[0])) {
    isSetColor = true;
  } 
  else if(!card1Parts[0].equals(card2Parts[0]) && !card1Parts[0].equals(card3Parts[0]) && !card2Parts[0].equals(card3Parts[0])) {
    isSetColor = true;
  }
  
  // Controleer of alle vormen hetzelfde zijn of allemaal verschillend
  if(card1Parts[1].equals(card2Parts[1]) && card1Parts[1].equals(card3Parts[1])) {
    isSetShape = true;
  } 
  else if(!card1Parts[1].equals(card2Parts[1]) && !card1Parts[1].equals(card3Parts[1]) && !card2Parts[1].equals(card3Parts[1])) {
    isSetShape = true;
  }
  
  // Controleer of alle getallen hetzelfde zijn of allemaal verschillend zijn
  if(card1Parts[2].equals(card2Parts[2]) && card1Parts[2].equals(card3Parts[2])) {
    isSetNumber = true;
  } 
  else if(!card1Parts[2].equals(card2Parts[2]) && !card1Parts[2].equals(card3Parts[2]) && !card2Parts[2].equals(card3Parts[2])) {
    isSetNumber = true;
  }
  
  // Controleer of alle schaduwen hetzelfde zijn of allemaal verschillend zijn
  if(card1Parts.length == 4 && card2Parts.length == 4 && card3Parts.length == 4) {
    if(card1Parts[3].equals(card2Parts[3]) && card1Parts[3].equals(card3Parts[3])) {
      isSetShading = true;
    } 
    else if(!card1Parts[3].equals(card2Parts[3]) && !card1Parts[3].equals(card3Parts[3]) && !card2Parts[3].equals(card3Parts[3])) {
      isSetShading = true;
    }
  } 
  else if(card1Parts.length != 4 && card2Parts.length != 4 && card3Parts.length != 4) {
    isSetShading = true;
  }
  
  // Als het een set is, verwijder dan de kaarten uit de grid
  if(isSetColor && isSetShape && isSetNumber && isSetShading) {
    grid.remove(card1);
    grid.remove(card2);
    grid.remove(card3);
    return true;
  }
  else {
    return false;
  }
}
