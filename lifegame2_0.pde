float d = 10;
int maxX = 0;
int maxY = 0;

Sq[][] mySquare = new Sq[1000][1000];

void setup()
{
  size(800,600);
  d = width / 100;
  maxX = floor(width / d);
  maxY = floor(height / d);
  for(int y = 0; y < maxY; y = y + 1) 
  {
    for(int x = 0; x < maxX; x = x + 1)
    {
      mySquare[x][y] = new Sq(x*d,y*d,d);
    }
  }  
}


void draw()
{

   
  for(int y = 0; y < maxY; y = y + 1) 
  {
    for(int x = 0; x < maxX; x = x + 1)
    {
      mySquare[x][y].show();
    }
  }  
}

void mousePressed()
{
  for(int y = 0; y < maxY; y = y + 1) 
  {
    for(int x = 0; x < maxX; x = x + 1)
    {
      mySquare[x][y].clicked(mouseX,mouseY);
    }
  }  
}
