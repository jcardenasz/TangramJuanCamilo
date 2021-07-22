class Triangle extends Shape{
  float _distance;

  Triangle(){
    this(100/sqrt(8));
    setHue(#000000);
  }
  Triangle(float distance) {
    setDistance(distance);
 }
  
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
