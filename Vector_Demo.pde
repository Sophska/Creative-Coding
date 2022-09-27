void setup()
{
  size(800,600);
}

void draw()
{
  background(255);
  PVector m = new PVector(mouseX,mouseY);
  PVector c = new PVector(width/2, height/2);
  stroke(255,0,0);
  line(0,0,c.x,c.y);  circle(c.x,c.y,10);
  stroke(0,0,255);
   line(0,0,m.x,m.y);  circle(m.x,m.y,10);
    
  m.sub(c);
  m.setMag (100);
  
  translate(width/2, height/2);
  stroke(0);
  line(0,0,m.x,m.y);  circle(m.x, m.y,10);
  
}
