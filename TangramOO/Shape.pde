abstract class Shape {
  float _rotation;
  float _scaling;
  PVector _position;

  // TODO: estilo
  // implemente el estilo del shape (i.e., stroke weight, color, etc)
  // como se hace con los demás atributos de la clase

  // TODO: modifique o defina los constructores que necesite

  Shape() {
    this(random(100, width-100), random(100, height-100), 0, 1);
  }

  Shape(float x, float y, float r, float s) {
    _position = new PVector(x, y);
    _rotation = r;
    _scaling = s;
  }

  void draw() {
    push();
    translate(position().x, position().y);
    rotate(rotation());
    scale(scaling(), scaling());
    // TODO aplique el estilo aca
    drawShape();
    pop();
  }

  // TODO: para la seleccion de la pieza escoja uno de los siguientes prototipos
  // public abstract boolean grabsInput(float x, float y);
  // public boolean grabsInput(float x, float y) {}

  abstract void drawShape();

  float scaling() {
    return _scaling;
  }

  void setScaling(float scaling) {
    _scaling = scaling;
  }

  float rotation() {
    return _rotation;
  }

  void setRotation(float rotation) {
    _rotation = rotation;
  }

  PVector position() {
    return _position;
  }

  void setPosition(PVector position) {
    _position = position;
  }
}