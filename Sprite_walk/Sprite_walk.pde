class Animation
{
  PShape[] frames;
  int nFrames = 0;
  int counter = 0;
  int speedcount = 0;
  int speed = 10;
  float w = 10;
  float h = 10;
  
  Animation(String[] files)
  {
    this.nFrames = files.length;
    this.frames = new PShape[nFrames];
    for(int i = 0; i < this.nFrames; i = i + 1)
    {
      this.frames[i]=loadShape(files[i]);
    }
  }
  
  void display()
  {
    
    if(this.counter > this.nFrames-1) this.counter = 0;
    shape(frames[counter],0,0,115,185);
    this.speedcount = this.speedcount+1;
    if(this.speedcount > this.speed)
    {
      this.counter = this.counter + 1;
      this.speedcount=0;
    }  
  }
}
