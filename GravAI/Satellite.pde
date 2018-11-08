class Satellite
{
  final float ACCELERATION_DAMPING_COEFFICIENT = 0.2;
  final int SIZE = 15; // Length of radius
  
  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector thrust;
  
  boolean isCrashed;
  boolean isThrusting;
  
  public Satellite(PVector Location)
  {
    this.location = Location;
    this.velocity = new PVector(0,0);
    this.acceleration = new PVector(0,0);
    this.thrust = new PVector(0.01,0);
    
    this.isThrusting = false;
    this.isCrashed = false;
  }
  
  public void update(Planet P)
  {
    acceleration = PVector.sub(P.location, this.location);
    acceleration.setMag(((P.mass*ACCELERATION_DAMPING_COEFFICIENT) * acceleration.mag()) / pow(PVector.dist(P.location, location), 2));
    //acceleration.setMag(0.1);
    
    // Check for a collision
    if( (location.dist(P.location) - (SIZE-5) )<P.mass/2)
    {
      this.velocity = new PVector();
      this.acceleration = new PVector();
      this.isCrashed = true;
    }
    // Update velocity for force of both the planet, and the thrust
    velocity.add(acceleration);
    if(isThrusting)
      velocity.add(thrust);
      
    location.add(velocity);
    
    
    //line(location.x, location.y, P.location.x, P.location.y);
  }
  
  public void display()
  {
    strokeWeight(2);
    fill(127);
    stroke(0);
    
    ellipse(location.x, location.y, SIZE, SIZE);
  }
  
  public void displayVerbose()
  {
    strokeWeight(2);
    fill(127);
    
    // Lines prepresent Velocity, Thrust, and Gravitational pull int that order
    stroke(0);
    line(location.x, location.y, location.x + (velocity.x * 10), location.y + (velocity.y * 10));
    stroke(0,255,0);
    if(isThrusting)
      stroke(255,0,0);
    line(location.x, location.y, location.x + (thrust.x * 400), location.y + (thrust.y * 400));
    stroke(0,0,255);
    line(location.x, location.y, location.x + (acceleration.x * 400), location.y + (acceleration.y * 400));
    stroke(0);
    
    
    ellipse(location.x, location.y, SIZE, SIZE);
  }
  
  public void turnLeft()
  {
    thrust.rotate(- (HALF_PI/20));
  }
  
  public void turnRight()
  {
    thrust.rotate(HALF_PI/20);
  }
  
  public void increaseThrust()
  {
    thrust.setMag(thrust.mag() + .005);
  }
  
  public void decreaseThrust()
  {
    thrust.setMag(thrust.mag() - .005);
  }
}
