float _angle=0;

void setup ()
{
  size(800,600);
}
void draw()
{
  clearScreen();
  translate(width/2,height/2);
 aCircle (0,0,100,255,255,255);
 
 pushMatrix();
   rotate(radians(_angle));
   translate(250,0);
   scale(0.5);
   aCircle(0,0,200,0,100,255);
 popMatrix();
 
  pushMatrix();
    rotate(radians(_angle/2));
   translate(150,0);
   aCircle(0,0,50,255,100,0);
  popMatrix();
  
 pushMatrix();
   rotate(radians(_angle/-6));
   translate(320,0);
   aCircle(0,0,30,55,200,50);
 popMatrix();
 
  pushMatrix();
   rotate(radians(_angle/1));
   translate(70,0);
   aCircle(0,0,10,255,0,0);
 popMatrix();
 
 _angle=_angle+1;
}

void  aPlanet(float size, float speed, float distance,int red, int green, int blue)
{ 
  pushMatrix();
   rotate(radians(_angle/speed));
   translate(100,0);
   aCircle(0,0,size,red,green,blue);
 popMatrix();
}

  
void aCircle(float x, float y, float d, int red, int green, int blue)
{
  noStroke();
  fill(color(red,green,blue));
  circle (x,y,d);
}

void clearScreen()
{
  noStroke();
  fill(color(0,0,0,10));
  rect(0,0,width,height);
}
