import processing.sound.*;
SoundFile beep;
int count = 0;
Crab s;
Ground[] g;
int nGround = 0;
Boulder[] b;
int nBoulder = 4; 
int gameState = 0;
PImage bg;
int y;

void setup()
{
  size(1200,800);
   bg = loadImage ("Ocean BG.png");
  //fullScreen();
  beep = new SoundFile(this,"beep.wav");
  reset();
}

void draw()
{
  if(gameState == 0) startScreen();
  if(gameState == 1) game();
  if(gameState == 2) endScreen();
}

void reset()
{  
  s = new Crab(100,60,200,120);
  String[] files = {"Scuttle-f1.png","Scuttle-f2.png","Scuttle-f3.png", "Scuttle-f4.png"};
  s.addAnimation(new Animation(files));
  String[] files1 = {"Scuttle-FL1.png","ScuttleFL2.png"};
  s.addAnimation(new Animation(files1));
  String[] files2 = {"CrabUp.png"};
  s.addAnimation(new Animation(files2));
  String[] files3 = {"Fall-f1.png","Fall-f2.png","Fall-f3.png","Fall-f4.png"};
  s.addAnimation(new Animation(files3));
  s.currentAni=0;
  
  nGround = ceil(width/1000.0)+1;
  
  String[] files4 = {"SandyGround1.png"};
  String[] files5 = {"SandyGround2.png"};
  String[] files6 = {"SandyGround3.png"};
  String[] files7 = {"SandyGround1.png"};
  String[] files8 = {"SandyGround2.png"};
  String[] files9 = {"SandyGround3.png"};
  g = new Ground[nGround];
  for(int i = 0; i < nGround; i = i + 1)
  {
    g[i] = new Ground(0,0,1000,350);
    g[i].location.x = (-width/2.0)+(i*1000.0);
    g[i].addAnimation(new Animation(files4));
    g[i].addAnimation(new Animation(files5));
    g[i].addAnimation(new Animation(files6));
    g[i].addAnimation(new Animation(files7));
    g[i].addAnimation(new Animation(files8));
    g[i].addAnimation(new Animation(files9));
  }
  String[] files10 = {"Clam F1.png","Clam F2.png","Clam F3.png","Clam F2.png"};
  String[] files11 = {"Anemone.png"};
  String[] files12 = {"Urchin.png"};
  String[] files13 = {"Snail F1.png","Snail F2.png","Snail F3.png","Snail F2.png"};
  String[] files14 = {"Anemone 2.png"};
  b = new Boulder[nBoulder];
  for(int i = 0; i < nBoulder; i = i + 1)
  {
    b[i] = new Boulder(75,75,150,150);
    b[i].addAnimation(new Animation(files10));
    b[i].addAnimation(new Animation(files11));
    b[i].addAnimation(new Animation(files12));
    b[i].addAnimation(new Animation(files13));
    b[i].addAnimation(new Animation(files14));
  }
}

void endScreen()
{
  noStroke();
  fill(color(0,0,0));
  rect(0,0,width,height);
  fill(255);
  textAlign(CENTER, CENTER);
  text("You made it to Heaven! Press any key to resurrect", width/2, height/2);
}

void startScreen()
{
  noStroke();
  fill(color(255,0,100));
  rect(0,0,width,height);
  fill(255);
  textAlign(CENTER, CENTER);
  text("Press any key to start", width/2, height/2);
}
//game state

void game()
{
  background(bg);
    translate(width/2,height/2);
    for(int i = 0; i < nGround; i = i + 1)
    {
      g[i].update();
      g[i].check();
      g[i].display();
    }
 
    s.update();
    s.check();
    s.display();
  
    for(int i = 0; i < nBoulder; i = i + 1)
    {
      b[i].update();
      b[i].check();
      b[i].display();
    }
}

void keyPressed()
{
  if(gameState == 0) gameState = 1;
  if(gameState == 1) s.jump();;
  if (gameState == 2) 
  {
    reset();
    gameState = 1;
  }
  
}

boolean collision(Sprite s1, Sprite s2)
{
  PVector loc1 = new PVector(s1.location.x,s1.location.y);
  PVector loc2 = new PVector(s2.location.x,s2.location.y);
  PVector d = loc1.sub(loc2);
  float dist = d.mag();
  float limit = (min(s1.boxx,s1.boxy)/2)+(min(s2.boxx,s2.boxy)/2);
  if(dist < limit) return(true);
  return(false);
}
