package poo4;

import processing.core.PApplet;
import processing.core.PVector;

abstract class Shape {
  protected float _rotation;
  protected float _scaling;
  protected PApplet _parent;
  protected PVector _position;

  // TODO: estilo
  // implemente el estilo del shape (i.e., stroke weight, color, etc)
  // como se hace con los demás atributos de la clase

  // TODO: modifique o defina los constructores que necesite

  public Shape(PApplet parent) {
    this(parent, parent.random(100, parent.width-100), parent.random(100, parent.height-100), 0, 1);
  }

  public Shape(PApplet parent, float x, float y, float r, float s) {
    _parent = parent;
    _position = new PVector(x, y);
    _rotation = r;
    _scaling = s;
  }

  public void draw() {
    _parent.push();
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

  public void setPosition(float x, float y) {
    _position.x = x;
    _position.y = y;
  }
}
