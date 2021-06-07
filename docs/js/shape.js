// Implementar:
// 1. El estilo del shape (e.g., stroke, stroke weight).
// 2. La funcion contains(x, y) que diga si un punto de coordenadas
// (x,y) se encuentra o no al interior del shape. Observe que esta
// función puede servir para la selección de la pieza con un puntero.
// 3. El resto de shapes que se requieran para el Tangram, como se
// hace con la clase Rect (ver rect.js) y la clase Term (ver term.js).

class Shape {
  constructor (position = createVector(random(0, width), random(0, height)),
               rotation = random(0, TWO_PI),
               scaling = random(0.5, 1.5),
               hue = color(random(0, 255), random(0, 255), random(0, 255))) {
    this.position = position;
    this.rotation = rotation;
    this.scaling = scaling;
    this.hue = hue;
  }

  draw () {
    push();
    fill(this.hue);
    translate(this.position.x, this.position.y);
    rotate(this.rotation);
    scale(this.scaling, this.scaling);
    this.aspect();
    pop();
  }

  // JS doesn't have abstract methods, see:
  // https://medium.com/@yuribett/javascript-abstract-method-with-es6-5dbea4b00027
  aspect() {
    throw new Error('You have to implement the method aspect!');
  }

  // should return a boolean value
  contains(x, y) {
    throw new Error('You have to implement the method contains!');
  }

  // getters and setters
  // see: https://www.w3schools.com/js/js_object_accessors.asp

  get scaling () {
    return this._scaling;
  }

  set scaling (scaling) {
    this._scaling = scaling;
  }

  get rotation () {
    return this._rotation;
  }

  set rotation (rotation) {
    this._rotation = rotation;
  }

  get position () {
    return this._position;
  }

  set position (position) {
    this._position = position;
  }

  get hue () {
    return this._hue;
  }

  set hue (hue) {
    this._hue = hue;
  }
}