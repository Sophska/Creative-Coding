float _angle= 0;
int nPlanets= 0;
int maxPlanets = 100;

float[] distance = new float[maxPlanets];
float[] size = new float[maxPlanets];
float[] speed = new float[maxPlanets];
color[] col= new color[maxPlanets];

void setup()
{
  size(800,600,P3D);
}

void draw()
{
  clearScreen();
  translate(width/2,height/2);
 aCircle (0,0,100,color(255,255,255));

  for(int i = 0; i < nPlanets; i = i + 1)
{
  aPlanet(size[i], speed[i], distance[i], col[i]);
}
 
 _angle=_angle+1;
}

void mouseClicked()
{
  if (nPlanets < maxPlanets)
 { 
   float dist = dist(mouseX,mouseY,(width/2), (width/2));
   createPlanet(nPlanets,dist);
  nPlanets = nPlanets + 1;
}
else
 {
   println("No more planets avaialable");
 }
}

void createPlanet(int i,float dist)
{  
   distance[i]= dist;
   size[i]=random(30,100);
   speed[i]=random(-2.0,2.0);
   col[i]=color(random(255),random(255),random(255),50);
}
void  aPlanet(float size, float speed, float distance, color col)
{ 
  pushMatrix();
   rotate(radians(_angle/speed));
   translate(distance,0);
   aCircle(0,0,size,col);
 popMatrix();
}

  
void aCircle(float x, float y, float d, color col)
{
  noStroke();
  fill(color(col));
  circle (x,y,d);
}

void clearScreen()
{
  noStroke();
  fill(color(0,0,0,10));
  rect(0,0,width,height);
}
