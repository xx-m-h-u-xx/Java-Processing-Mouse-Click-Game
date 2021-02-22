/*--- Player class  --- */
/* Defines Defender class's DATA attributes */
class Player
{
  int x;
  int y;
  int velocityX;
  int velocityY;
  PImage[] playerFrames;  // = {frame1, frame2, frame3, frame4} ; // playerFrame1, playerFrame2, playerFrame3, playerFrame4;
  int count = 0;
  
  /* declaring constructor from its class  */
  Player()
  {
    this.x = x;
    this.y = y;
    this.velocityX = velocityX;
    this.velocityY = velocityY;
    
    this.playerFrames = new PImage[4];
    for (int i = 0; i < playerFrames.length; i++) {
      playerFrames[i] = loadImage("Images/Player/frame"+i+".gif"); 
      playerFrames[i].resize(width/8, height/8);
    }   
  }

  /* renders instructions to make actual appearance of defender */
  void render()
  {
   if (count < 10)
    {
      image(playerFrames[0],x,y);
    }
     else if(count < 20) {
      image(playerFrames[1],x,y);
    }
    else if (count < 30) {
      image(playerFrames[2],x,y);
    }
    else if (count < 40) {
      image(playerFrames[3],x,y);
    }
    else
    {
      count = 0;
    }
    count += 1;
  }
  
  void move() {
    
   /*  if (x <= 0)
    {
      velocityX += 1; }
    if ( y <=0)
    {
     velocityY += 1; }
    if (x >= width)
    {
      velocityX += -1; }
    if (y >= height) 
    {
      velocityY = -1; }  */
  }
 
  
  /* setting boolean statment, returns value, when it is true */
 /* boolean crash()
  {
    // sets color type to named variable 
    color detectedColour;
    
    // iterates loop, starting i=y-position until i is less than or equal to "y+10" (the defender1's height);
    for (int i=y; i<=y+10; i++)  
    {
      // gets the colour value from position "x+65"
      detectedColour=get(x+65,i);
      
      // if variable detects colour1 of  (0,255,0)  OR  colour2 of (50,100,0); 
      if (detectedColour==EagleColour1 || detectedColour == EagleColour2 )
      {
        return true; // returns the result
      }
    } // ends for-loop
    
    // if it doesnt detect colour..
    return false;
  } // shuts boolean crash statement */
 
    
} // end of class: Player
