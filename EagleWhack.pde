/* -------------------------------------------------------------
     "EagleWhack" 1CWK40 Programming MouseClickGame Coursework
---------------------------------------------------------------- */

/* ---- Declaring variables ---- */

int x, y;        
int score = 0;
int lives = 0;
PImage imgGameDisplay; 

// declares & assigns screenmode values to an enumerated set called "sceen"
// sets the current actual display to variable named "gameScreen"
enum screen { STARTUP , GAME , END }  
screen gameScreen = screen.STARTUP;    

/* ---- Initialising & calling OBJECTS ---- */
/****** Declaring, Instiatiating Eagles object ******* */

// Eagle[] eaglesList;                   // creates an empty array
//Eagle eagle1, eagle2;
ArrayList <Eagle> eaglesList;
Player player1;
Nest nest;

/* ----- initialises the game display ----- */
void initialiseGameDisplay() {
 imgGameDisplay = loadImage("Images/game-screen.gif");
 imgGameDisplay.resize(width,height);
}

/* ----- initialises Eagle objects ----- */
void initialiseEagles() {
  
  // Creates ArrayList of Eagle object-type named eaglesList 
  eaglesList = new ArrayList <Eagle>();

 for(int i = eaglesList.size(); i < 10; i++) {
   int index = int(random(0,eaglesList.size()));
   eaglesList.add(new Eagle(index+i,20*i,i)); }
 
         /* Using Array to generate Eagles
           eaglesList = new Eagle[6] ;
           for (int i = 0; i < eaglesList.length; i++) {
           int index = int(random(0,eaglesList.length));
           eaglesList[i] = new Eagle(index*i,20+20*i,i); } */
}

void generateEagles() {
   /* // Using standard Array to loop Eagle objects in order to be displayed
   for (int i = 0; i < eaglesList.length; i++) {
     eaglesList[i].move();
     eaglesList[i].render(); */ 
  
  // iterates backwards as elements gets deleted easily
  // iterates loop until size of eagleList is reached
  // for (int i = eaglesList.size()-1; i >= 0; i--) {
  for (int i = 0; i < eaglesList.size(); i++) {   
    //  eaglesList gets (i) and then calls the update function;
    Eagle hawk = (Eagle) eaglesList.get(i);
    hawk.update();
    hawk.detectScreenBoundary();
    println(eaglesList.size());
  }
}

/* --------- Setup event -------- */
void setup()
{
 size(800,400);
 initialiseGameDisplay();
 player1 = new Player();        // creating Defender instance
 nest = new Nest();
 initialiseEagles();
}

/* ------------ Game display screens ------------------- */
void startupScreen() {
  background(#030303);
  textAlign(CENTER);
  fill(#B2B4B4);
  textSize(80);
  text("Eagle Whack", width/2, height/2);
  textSize(20); 
  text("Press ENTER to start", width/2, height-40);
}

void gameDisplayScreen() {
  image(imgGameDisplay, x, 0); 
  nest.displayNest();
  player1.render(); // renders player1 property
  player1.move();
  generateEagles();
  followMouse();
}
   
void gameOverScreen() {
  background(#6F6B6B);
  textAlign(CENTER);
  fill(236, 240, 241);
  textSize(16);
  text(" <<< Game Over >>> ", width/2, height/2);
  textSize(14);
  text(" -- Press ENTER to Restart -- ", width/2, height-30);
}


/* -----------  EVENT draw --------------------- */
void draw()
{
  if(gameScreen == screen.STARTUP) {
    startupScreen();
  }
  else if (gameScreen == screen.GAME)
  {
    gameDisplayScreen();
  }
  else if(gameScreen == screen.END) {
    gameOverScreen();
  }
}

void beginGame() {
  // changes the mode AND therefore proceeds to the gameScreen function
  gameScreen = screen.GAME;
}
void endGame() {
  gameScreen = screen.END;
}

void keyPressed() {
  if(keyCode == ENTER) {
    // if the screen is on the STARTUP screen, starts the GAME
      if(gameScreen == screen.STARTUP) {
        beginGame();
        // gameScreen = screen.GAME;
      }
     // if the screen is on the END, displays gameoverScreen 
      if(gameScreen == screen.END) {
        gameOverScreen();
      }
  }
}

void mousePressed() {
  for(int i = 0 ; i <= eaglesList.size()-1 ; i++) { 
    Eagle hawk = eaglesList.get(i);
    
    if (hawk.eagleClicked() == true) {
      // if (mouseX >= hawk.x || mouseY >= hawk.y) {
        eaglesList.remove(hawk);
        //endGame();
        
        if(eaglesList.size() == 0) {
          println(eaglesList.size());
          endGame(); }
      }
  }
}

void followMouse() {
  // calculates player1 position and the mouse cursor's position  
  int moving = 1;
  int pointerX = mouseX;
  player1.velocityX = pointerX - player1.x;
  player1.x = moving + player1.velocityX * moving;
  
  int pointerY = mouseY;
  player1.velocityY = pointerY - player1.y;
  player1.y = moving + player1.velocityY * moving;
}


/* void removeEagle() {
   for(int i = eaglesList.size() -1 ; i >= 0; i--) {
     Eagle hawk = eaglesList.get(i);
     if(hawk.eagleClicked() == true) {
      eaglesList.get(i).remove(i);
    }
   }
} */
