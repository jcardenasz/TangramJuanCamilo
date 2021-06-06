// Implementar el resto de piezas

package poo4;

import processing.core.PApplet;

class Rect extends Shape {
  protected float _edge;

  public Rect(PApplet parent) {
    this(parent, 100);
  }

  public Rect(PApplet parent, float edge) {
    super(parent);
    setEdge(edge);
  }

  @Override
  protected void geom() {
    _parent.rectMode(PApplet.CENTER);
    _parent.rect(0, 0, edge(), edge());
  }

  public float edge() {
    return _edge;
  }

  public void setEdge(float edge) {
    _edge = edge;
  }
}