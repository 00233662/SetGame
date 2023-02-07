int numkaart = 27;
int randomkaart;

PImage[] kaart = new PImage[numkaart];


void setup() {
  size(1000, 800);
  frameRate(60); 
  
    for(int i = 0; i < numkaart; i++){
      kaart[i] = loadImage("kaart_"+ i +".png");
    }
  }
 
//void tekenKaarten() {

  
  
//}


void draw() {
  background(0);
  
  image(kaart[(int)random(numkaart)], 100, 100);
  image(kaart[(int)random(numkaart)], 310, 100);
  image(kaart[(int)random(numkaart)], 520, 100);
  image(kaart[(int)random(numkaart)], 100, 210);
  image(kaart[(int)random(numkaart)], 310, 210);
  image(kaart[(int)random(numkaart)], 520, 210);
  image(kaart[(int)random(numkaart)], 100, 320);
  image(kaart[(int)random(numkaart)], 310, 320);
  image(kaart[(int)random(numkaart)], 520, 320);
  noLoop();
}

void mousePressed(){
 redraw(); 
}
  







//Setup programma

//int Card_Width = 200;
//int Card_Height = 100; 
  
//  void setup() {
//  size(1000, 800);
//  frameRate(60);
//  }
  
