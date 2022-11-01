class Boulder extends Sprite
{
  Boulder(float xreg, float yreg, float bx, float by)
  {
    super(xreg, yreg, bx, by);
    this.velocity.x = -8;
    this.location.y = (height/2) - (boxx*2);
  }


  void check()
  {
  if(this.location.x <= -boxx-(width/2))
    {
      this.boxx = this.ani[nAnimation].frames[0].width;
      this.boxy = this.ani[nAnimation].frames[0].height;
      this.reg.x = boxx/2.0;
      this.reg.y = boxy/2.0;
      this.location.x =(width/2.0)+random(1000);
      this.location.y = (height/2) - (boxx*2) - random(80);
    }
    if(collisison(this, s))
    {
      //beep.play();
    }
  }
}
