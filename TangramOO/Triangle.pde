// The Triangle class allows the creation of triangle objects
class Triangle extends Shape{
  float _distance;
  
  //In this constructor, Triangle distance = 100/sqrt(8)
  //Triangle default color will be black
  Triangle(){
    this(100/sqrt(8));
    setHue(#000000);
  }
  
  Triangle(float distance) {
    setDistance(distance);
 }
  
  //The abstract function aspect is encharged of showing the triangle
  @Override
  void aspect() {
    triangle(0,-distance(),2*distance(),distance(),-2*distance(),distance());
  }
    
  public float distance(){
    return _distance;
  }
  public void setDistance(float distance) {
    _distance = distance;
  }
}
