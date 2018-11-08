public class Planet
{
  final int RANDOM_BOUNDING = 200;
  final int MIN_SIZE = 25;
  final int MAX_SIZE = 200;
  PVector location;
  float mass;
  
  public Planet(PVector Location, float Mass)
  {
    this.location = Location;
    this.mass = Mass;
  }
  
  public float getMass()
  {
    return this.mass;
  }
  
  public void display()
  {
    fill(255);
    ellipse(this.location.x, this.location.y, this.mass, this.mass);
  }
  
  public void randomizePlanet()
  {
    int newX = (int) random(RANDOM_BOUNDING, width - RANDOM_BOUNDING);
    int newY = (int) random(RANDOM_BOUNDING, height - RANDOM_BOUNDING);
    
    location = new PVector(newX, newY);
    mass = (int) random(MIN_SIZE, MAX_SIZE);
  }
}
