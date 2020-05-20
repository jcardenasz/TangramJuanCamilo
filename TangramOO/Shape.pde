abstract class Shape {
  float rot;
  float scl;
  PVector trans;

  // TODO: estilo
  // implemente el estilo del shape (i.e., stroke weight, color, etc)
  // como se hace con los demás atributos de la clase

  // TODO: modifique o defina los constructores que necesite

  Shape() {
    this(random(100, width-100), random(100, height-100), 0, 1);
  }

  Shape(float x, float y, float r, float s) {
    trans = new PVector(x, y);
    rot = r;
    scl = s;
  }

  void draw() {
    push();
    translate(translation().x, translation().y);
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
    return scl;
  }

  void setScaling(float s) {
    scl = s;
  }

  float rotation() {
    return rot;
  }

  void setRotation(float r) {
    scl = r;
  }

  PVector translation() {
    return trans;
  }

  void setTranslation(float x, float y) {
    trans.x = x;
    trans.y = y;
  }
}