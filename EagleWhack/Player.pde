/* Defining Defender CLASS */
class Player
{
  int x;
  int y;
  int speedX;
  int speedY;
  
  /* declaring constructor from its class  */
  Player(int x, int y, int speedX, int speedY)
  {
    this.x = x;
    this.y = y;
    this.speedX=speedX;
    this.speedY=speedY;
  }

  /* renders instructions to make actual appearance of defender */
  void render()
  {
    // fills and draw shape in with colour
    /* fill(255,0,0);
    rect(x,y,50,20);
    triangle(x+50,y,x+50,y+20,x+60,y+10);
    fill(0,0,100);
    rect(x,y-10,20,10); */
   
  }
  
  /* setting boolean statment, returns value, when it is true */
  boolean crash()
  {
    // sets color type to named variable 
    color detectedColour;
    
    // iterates loop, starting i=y-position until i is less than or equal to "y+10" (the defender1's height);
    for (int i=y; i<=y+10; i++)  
    {
      // gets the colour value from position "x+65"
      detectedColour=get(x+65,i);
      
      /* if variable detects colour1 of  (0,255,0)  OR  colour2 of (50,100,0);  */
      if (detectedColour==EagleColour1 || detectedColour == EagleColour2 )
      {
        return true; // returns the result
      }
    } // ends for-loop
    
    // if it doesnt detect colour..
    return false;
  } // shuts boolean crash statement
 
    
} // end of defenderClass
