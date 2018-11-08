final int RESET_COUNTER = 180;

Satellite s1;
Planet p1;

void setup()
{
  background(255);
  size(800,800);
  frameRate(60);
  s1 = new Satellite(new PVector(200, 100));
  p1 = new Planet(new PVector(width/2, height/2), 100);
  p1.randomizePlanet();
}

void draw()
{
  background(255);
  s1.update(p1);
  s1.displayVerbose();
  p1.display();
  
  if(s1.isCrashed){
    p1.randomizePlanet();
    s1.isCrashed = false;
  }
  
  if(keyPressed)
    {
      if(keyCode == RIGHT) s1.turnRight();
      if(keyCode == LEFT) s1.turnLeft();
      if(keyCode == UP) s1.increaseThrust();
      if(keyCode == DOWN) s1.decreaseThrust();
      if(key == ' ') s1.isThrusting = true;
      if(keyCode == CONTROL)
      {
        s1.location = new PVector(30,30);
        s1.thrust = new PVector(0,0.01);
        s1.velocity = new PVector(0,0);
        s1.acceleration = new PVector(0,0);
      }
      //s1.increaseThrust();
    }
}

void keyReleased()
{
  if(key == ' ') s1.isThrusting = false;
}
