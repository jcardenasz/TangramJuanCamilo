class Rect extends Shape {
  float edge;

  Rect() {
    setEdge(100);
  }

  @Override
  void drawShape() {
    rectMode(CENTER);
    rect(0, 0, edge(), edge());
  }

  public float edge() {
    return edge;
  }

  public void setEdge(float e) {
    edge = e;
  }
}