class Planet
{
  float dist = 100;
  float angle = 0.0;
  float speed = 1.0;
  float size = 50.0;
  color col = color(255,255,255);
  Planet[] planet = new Planet[20];
  int nPlanet = 0;
  
  Planet (float _dist)
  {
    this.dist = _dist;
}
  
  void makeMoons()
 {
    for (int i = 0; i < this.nPlanet; i= i + 1)
  {
  this.planet[i] = new Planet(random(100,200));
  this.planet[i].speed = random (-1.0, 1.0);
  this.planet[i].col = color(random(255), random(255), random(255));
  this.planet[i].nPlanet = floor(random(5));
  if(nGenerations > 0)
   {
    this.planet[i].size = floor(random(5));
    this.planet[i].makeMoons();
  }  
 }
  nGenerations = nGenerations - 1;
 }
  void show()
 {
   pushMatrix();
   rotate(radians(this.angle));
   translate(this.dist,0);
   noStroke();
   fill(this.col);
   circle(0,0,this.size);
   for (int i = 0; i < nPlanet; i= i + 1)
   {
     this.planet[i].show();
   }
  popMatrix();
  this.angle=this.angle + this.speed;
 }
}
