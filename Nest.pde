class Nest {
  
  PImage imgNest;
  
  Nest() {
    imgNest = loadImage("Images/Nest.gif");
    
  }
  
  void displayNest() {
    image(imgNest,400,300,100,100);
  }
  
}
