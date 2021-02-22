/* Defining fliesClass */

final int screenwidth = 800;
final color EagleColour1 = color(0,255,0);
final color EagleColour2 = color(50,100,0);

class Eagle {
  int x;
  int y;
  int velocityX = -1;
  int count = 0;
  PImage frame1, frame2, frame3, frame4;
  //int speedY = 1;
  // int speedY;
  
  // Alien constructor
  Eagle(int x, int y, int velocityX) {
    this.x = x;
    this.y = y;
    this.velocityX = velocityX;
    frame1 = loadImage("Images/frame1.gif");
    frame2 = loadImage("Images/frame2.gif");
    frame3 = loadImage("Images/frame3.gif");
    frame4 = loadImage("Images/frame4.gif");
    //this.speedY=speedY;
    // this.speedY=speedY;
  }
  
  void update() {
    move();
    render();
  }
  
  void move() {
    x = x+velocityX;  // moves left a bit
    if (x <= 0) {
      // speedX += 1; }
      x = 800; }
    if (x >=screenwidth) {
      velocityX += -1; }
    // float stepY = random(-5,5);
  }
  
  /* void EagleClicked() {
    int distance = int(dist(mouseX, mouseY, this.x, this.y));  // determines if the object is clicked
    if (distance < this.width/2 ) {
      this.eagle[i] = null; }
      // do something
  } */
  /* defining render method   */
  void render() { 
    if (count < 10)
    {
      image(frame1,x,y);
    }
    else if(count < 20) {
      image(frame2,x,y);
    }
    else if (count < 30) {
      image(frame3,x,y);
    }
    else if (count < 40) {
      image(frame4,x,y);
    }
    else
    {
      count = 0;
    }
    count += 1;
  }
    /* fill(AlienColour1);
    ellipse(x,y,30,20);
    fill(AlienColour2);
    ellipse(x,y,50,15); */
  
  /* collision detection   */
  boolean isShot(Player player1)
  {
    // if defender1 is not valid
    if (player1!=null) {
      // detecting defender1 proximity
      if(abs(this.x-player1.x)<10 && abs(this.y-player1.y) <10)
      {
        return true;
      }
    }
    return false;
    
  } // end of boolean isShot collision detection
  
}  // end Alien class
