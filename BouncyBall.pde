PVector location = new PVector(100,100);
PVector speed = new PVector(-1,-2);
float acceleration = 1.001;

void setup()
{
  size(800,600);
}

void draw()
{
  background(0);
  circle(location.x,location.y,50);
  speed.mult(acceleration);
  location.add(speed);
  if(location.x < 0 || location.x > width)
  {
    speed.x = speed.x*(-1);
  }
  if(location.y < 0 || location.y > height)
  {
    speed.y = speed.y*(-1);
  }
}
