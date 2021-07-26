// Implementar:
// 1. El estilo del shape (e.g., stroke, stroke weight).
// 2. El método contains(int x, int y) que diga si un punto de coordenadas
// (x,y) se encuentra o no al interior del shape. Observe que esta
// función puede servir para la selección de la pieza con un puntero.
// 3. El resto de shapes que se requieran para el Tangram, como se
// hace con la clase Rect (ver Rect.pde).

abstract class Shape {
  float _rotation;
  float _scaling;
  PVector _position;
  color _hue;
  boolean _dimmer;
  int _pixelnumber;

  Shape() {
    this(new PVector(random(100,width-400),random(100,height-100)),
         0,
         1,
         color(random(0,255)),
         1);
  }
  
  Shape(PVector position, float rotation, float scaling, color hue, int pixelnumber) {
    setPosition(position);
    setRotation(rotation);
    setScaling(scaling);
    setHue(hue);
    setDimmer(false);
    setPixelNumber(pixelnumber);
  }

  void draw() {
    push();
    fill(hue());
    translate(position().x, position().y);
    rotate(rotation());
    scale(scaling(), scaling());
    noStroke();
    aspect();
    pop();
  }
  //The abstract method aspect is encharged of showing each figure
  abstract void aspect();

  boolean contains(int x, int y, Shape shape) {
    int varX; int varY;
    boolean ok = false;
    if(mousePressed && mouseButton==LEFT){
      varX = x; varY = y;
      color mouseColor=get(varX,varY);
      if(mouseColor==shape.hue()){
         return true;
      }else return false;
    }if (ok==true){ return true;}
    else return false;
  }
  
  /*
  abstract boolean contains(int x, int y);
  // */
  
  //Theese are setters and getters of every atribute in Shape class
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

  color hue() {
    return _hue;
  }

  void setHue(color hue) {
    _hue = hue;
  }
  
  boolean dimmer(){
    return _dimmer;
  }
  
  void setDimmer(boolean a){
    _dimmer = a;
  }
  
  int pixelNumber(){
    return _pixelnumber;
  }
  
  void setPixelNumber(int pixelnumber){
    _pixelnumber = pixelnumber;
  }
  
}
