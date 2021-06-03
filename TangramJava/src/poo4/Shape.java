// Implementar:
// 1. El estilo del shape (i.e., stroke weight, color, etc)
// como se hace con los demás atributos de la clase.
// 2. La seleccion de la pieza mediante uno de los siguientes prototipos:
// public abstract boolean grabsInput(float x, float y);
// public boolean grabsInput(float x, float y) {}

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
    drawShape();
    _parent.pop();
  }

  protected abstract void drawShape();

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

  public void setPosition(float x, float y) {
    _position.set(x, y);
  }

  public int hue() {
    return _hue;
  }

  public void setHue(int hue) {
    _hue = hue;
  }
}
