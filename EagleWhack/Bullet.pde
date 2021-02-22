class Bullet
{
  int x;
  int y;
  int speedX = 1;
  int speedY =-1 ;
  
  Bullet(int x, int y)
  {
    this.x = x;
    this.y = y;
  }
  
  void move()
  {
    x=x+speedX;
  }
  
  void render()
  {
    fill(255,230,0);
    rect(x,y,50,20);
  }
  
}

/* Bullet Defender1Bullet;
void draw()
{
} */
