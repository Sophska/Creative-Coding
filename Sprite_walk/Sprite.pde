class Sprite
{
  Animation[] ani;     //array of animation classic
  int nAni = 0;           // number of animations in the sprite
  int currentAni = 0;     // current animation
  PVector location = new PVector(0,0);     // current sprite location
  PVector velocity = new PVector(0,0);     // current sprite speed
  PVector reg = new PVector(0,0);         // registration point
  float boxx = 10;         //bounding box width
  float boxy = 30;         //bounding box height
  
  Sprite(float xreg, float yreg, float bx, float by)
  {
    this.ani = new Animation[10];
    this.reg.x=xreg;
    this.reg.y=yreg;
    this.boxx = bx;
    this.boxy = by;
  }
  
void addAnimation(Animation a)
  {
    if(this.nAni < 10)
    {
    this.ani[this.nAni] = a;
    this.ani[this.nAni].w = this.boxx;
    this.ani[this.nAni].h = this.boxy;
    this.nAni = this.nAni + 1;
    }
  }
  void update()
  {
    this.location.add(this.velocity);
  }
  
  void display()
  {
    pushMatrix();
      translate(this.location.x,this.location.y);
      //noStroke();
    //  fill(0,200,255);
     // circle(0,0,10);
     // translate(-this.reg.x,-this.reg.y);
     // fill(color(0,100,250,20));
     // rect(0,0,boxx,boxy);
      if(this.nAni > 0) this.ani[this.currentAni].display();
    popMatrix();
  }
  
  void check()
  {
    if(this.location.x > (width/2)+this.reg.x)
    {
        this.velocity = this.velocity.mult(-1);
        this.currentAni= 1;
    }
    if(this.location.x < -((width/2)+this.reg.x))
    {
      this.velocity = this.velocity.mult(-1);
      this.currentAni = 0;
    }
  
  } 
}
