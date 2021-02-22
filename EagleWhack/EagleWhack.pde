/* --------------------------------------------------------
          "EagleWhack" 1CWK40 Game Coursework
----------------------------------------------------------- */

/* ---- Declaring variables ---- */

int x = 0;        
PImage imgSpace; 

// declares & assigns screenmode values to an enumerated set called "sceen"
// sets the current actual display to variable named "gameScreen"
enum screen { STARTUP , GAME , END }  
screen gameScreen = screen.STARTUP;    

/* ---- Initialising & calling OBJECTS ---- */
/****** Declaring, Instiatiating Eagles object ******* */
int numEagles = 12;
Eagle[] eagleList = new Eagle[numEagles];
// Eagle[] eagle;                   // creating an empty array
Eagle eagle1, eagle2;
Player player1;

/* --------- Setup event -------- */
void setup()
{
 size(800,400);
 //initialiseBackground();              // calls function that's specified
 player1 = new Player(10,10,0,0);        // creating Defender instance
 eagle1 = new Eagle(400,100,2);        // creating Enemy instance
 eagle2 = new Eagle(400,200,2);
 //eagle3 = new Eagle(600,200,2);
 //eagle4 = new Eagle(600,400,2); 
 for (int i = 0; i < eagleList.length; i++) {
  eagleList[i] = new Eagle();
  numEagles++; }
}

/* -----------  EVENT draw --------------------- */
void draw()
{
  if(gameScreen == screen.STARTUP) {
    startupScreen();
  } else if (gameScreen == screen.GAME) {
    gameScreen();
  } else if(gameScreen == screen.END) {
    gameoverScreen();
  }
}

/* ------------ Game screens ------------------- */
void startupScreen() {
  background(236, 240, 241);
  textAlign(CENTER);
  fill(52, 73, 94);
  textSize(70);
  text("Eagle Whack", width/2, height/2);
  textSize(15); 
  text("Press ENTER to start", width/2, height-30);
}
void gameScreen() {
   background(0);
   for (int i=0; i < eagles.length; i++) {
     eagles[i].move();
     eagles[i].render(); }
   player1.render(); // renders player1 property
   eagle1.update();
   eagle2.update();
} 

void gameoverScreen() {
  background(44, 62, 80);
  textAlign(CENTER);
  fill(236, 240, 241);
  textSize(12);
  textSize(15);
  text("Press ENTER to Restart", width/2, height-30);
}

void keyPressed() {
  if(keyCode == ENTER) {
    // if the screen is on the STARTUP screen, starts the GAME
      if(gameScreen == screen.STARTUP) {
        startGame();
        // gameScreen = screen.GAME;
      }
      if(gameScreen == screen.END) {
        gameoverScreen();
      }
  }
}

void startGame() {
  // changes the mode AND therefore proceeds to the gameScreen function
  gameScreen = screen.GAME;
}
/* void handleEagles(){
  if(mousePressed)) {
    eagle1 = null; }
    /* for (int i = 0; i < eagles.length; i++) 
     eagles[i].isShot); // calls eagleClicked function
}  */ 
