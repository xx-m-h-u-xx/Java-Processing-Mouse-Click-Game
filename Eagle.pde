/* fliesClass */

final int screenHeight = 400;
/* final color EagleColour1 = color(0,255,0);
final color EagleColour2 = color(50,100,0); */

class Eagle {
  int x;
  int y;
  int velocityX = 1;
  int velocityY = 1;
  int count = 0;
  PImage frame1, frame2, frame3, frame4;
 // PImage[] frames = new PImage[4];
  //int speedY = 1;
  // int speedY;
  
  /* Eagle constructor */
  Eagle(int x, int y, int velocityX) {
    this.x = x;
    this.y =y;
    this.velocityX = velocityX;
    this.velocityY = velocityY;
    
    // for(int i=0; i<frames.length; i++){
      // frames[i] = loadImage("Images/frame"+i+."gif"); }
    frame1 = loadImage("Images/frame1.gif");
    frame1.resize(width/8, height/8);
    
    frame2 = loadImage("Images/frame2.gif");
    frame2.resize(width/8, height/8);
    
    frame3 = loadImage("Images/frame3.gif");
    frame3.resize(width/8, height/8);
    
    frame4 = loadImage("Images/frame4.gif");
    frame4.resize(width/8, height/8);
    //this.speedY=speedY;
    // this.speedY=speedY;
  }
  
  /* Eagle class functionalities */
  void update() {
    move();
    render();
  }
  
  void move() {
    x = x + velocityX;
    y = y + velocityY;  // moves down a bit
   // int(random(0,3));
   /* if (x <= 0) {
      // speedX += 1; }
      x = 0; } */
    /* if (x >= width || y >=screenHeight) {
      // velocityX += -1; }
      x = 0;
      y = 0; } */
      //float stepY = random(-5,5); }
  }
  
  boolean detectScreenBoundary() {
    if(x < 0 || x > width || y < 0 || y > height)
    {
     x = 0;
     y = 0;
     return true;
    }
    return false;
  }
  
  boolean eagleClicked() {
    // determines if the object is clicked using the mouseX/Y position
    int distance = int(dist(mouseX, mouseY, this.x, this.y));
    if (distance < width/6 ) {
      println(">>> Eagle's been clicked!");
    }
    return true;
  }
  
  /* Animating series of sequences in the Eagle object */
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
  
  /* Detects if collided with Player object */
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
