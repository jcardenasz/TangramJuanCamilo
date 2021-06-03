package poo4;

import processing.core.PApplet;
import processing.core.PVector;

abstract class Shape {
  protected float _rotation;
  protected float _scaling;
  protected PApplet _parent;
  protected PVector _position;
  int _hue;

  // TODO: estilo
  // implemente el estilo del shape (i.e., stroke weight, color, etc)
  // como se hace con los demás atributos de la clase

  // TODO: modifique o defina los constructores que necesite

  public Shape(PApplet parent) {
    _parent = parent;
    setHue(parent.color(parent.random(0, 255), parent.random(0, 255), parent.random(0, 255)));
    setPosition(new PVector(parent.random(0, parent.width), parent.random(0, parent.height)));
    setRotation(parent.random(0, PApplet.TWO_PI));
    setScaling(parent.random(0.5f, 1.5f));
  }

  public void draw() {
    _parent.push();
    _parent.fill(hue());
    _parent.translate(position().x, position().y);
    _parent.rotate(rotation());
    _parent.scale(scaling(), scaling());
    // TODO aplique el estilo aca
    drawShape();
    _parent.pop();
  }

  // TODO: para la seleccion de la pieza escoja uno de los siguientes prototipos
  // public abstract boolean grabsInput(float x, float y);
  // public boolean grabsInput(float x, float y) {}

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

  public int hue() {
    return _hue;
  }

  public void setHue(int hue) {
    _hue = hue;
  }
}
