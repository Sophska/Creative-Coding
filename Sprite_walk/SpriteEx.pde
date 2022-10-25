int count = 0;
Sprite s;
void setup()
{
  size(800,600);
  s = new Sprite(50,150,120,200);
  s.velocity.x=2;
  String[] files = {"F1.svg", "F2.svg", "F3.svg"};
  s.addAnimation(new Animation(files));
  String[] files1 = {"FL3.svg", "FL2.svg", "FL1.svg"};
  s.addAnimation(new Animation(files1));
  s.currentAni = 0;
}

void draw()
{
  background(255);
  translate(width/2,height/2);
  s.update();
  s.check();
  s.display();
}
