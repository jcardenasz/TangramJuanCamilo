// Implementar:
// 1. El estilo del shape (e.g., stroke, stroke weight).
// 2. El método contains(int x, int y) que diga si un punto de coordenadas
// (x,y) se encuentra o no al interior del shape. Observe que esta
// función puede servir para la selección de la pieza con un puntero.
// 3. El resto de shapes que se requieran para el Tangram, como se
// hace con la clase Rect (ver Rect.java).

package poo4;

import processing.core.PApplet;
import processing.core.PVector;

abstract class Shape {
  protected float _rotation;
  protected float _scaling;
  protected PApplet _parent;
  protected PVector _position;
  int _hue;

  public Shape(PApplet parent) {
    this(parent,
         new PVector(parent.random(0, parent.width), parent.random(0, parent.height)),
         parent.random(0, PApplet.TWO_PI),
         parent.random(0.5f, 1.5f),
         parent.color(parent.random(0, 255), parent.random(0, 255), parent.random(0, 255)));
  }

  public Shape(PApplet parent, PVector position, float rotation, float scaling, int hue) {
    _parent = parent;
    setPosition(position);
    setRotation(rotation);
    setScaling(scaling);
    setHue(hue);
  }

  public void draw() {
    _parent.push();
    _parent.fill(hue());
    _parent.translate(position().x, position().y);
    _parent.rotate(rotation());
    _parent.scale(scaling(), scaling());
    contour();
    _parent.pop();
  }

  protected abstract void contour();

  /*
  // Escoja uno solo de los siguientes dos prototipos para la funcion contains:
  public boolean contains(int x, int y) {
    return true;
  }
  
  public abstract boolean contains(int x, int y);
  // */

  public float scaling() {
    return _scaling;
  }

  public void setScaling(float scaling) {
    _scaling = scaling;
  }

  public float rotation() {
    return _rotation;
  }

  public void setRotation(float rotation) {
    _rotation = rotation;
  }

  public PVector position() {
    return _position;
  }

  public void setPosition(PVector position) {
    _position = position;
  }

  public int hue() {
    return _hue;
  }

  public void setHue(int hue) {
    _hue = hue;
  }
}
