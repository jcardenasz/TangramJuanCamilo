// Implementar:
// 1. El estilo del shape (i.e., stroke weight, color, etc)
// como se hace con los demás atributos de la clase.
// 2. La seleccion de la pieza mediante la funcion grabsInput(x, y)

// (semi) standard reporting undef
// see: https://standardjs.com/#i-use-a-library-that-pollutes-the-global-namespace-how-do-i-prevent-variable-is-not-defined-errors

/* global color, random, createVector, width, height, TWO_PI,
push, pop, fill, translate, rotate, scale */

class Shape { // eslint-disable-line no-unused-vars
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
    this.drawShape();
    pop();
  }

  // JS doesn't have abstract methods, see:
  // https://medium.com/@yuribett/javascript-abstract-method-with-es6-5dbea4b00027
  drawShape () {
    throw new Error('You have to implement the method drawShape!');
  }

  grabsInput(x, y) {
    throw new Error('You have to implement the method grabsInput!');
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

  setPosition () {
    if (arguments.length === 1 && arguments[0] instanceof p5.Vector) {
      this._position = arguments[0];
    }
    else if (arguments.length === 2 && typeof arguments[0] === 'number' && typeof arguments[1] === 'number') {
      this._position.set(arguments[0], arguments[1]);
    }
  }

  get hue () {
    return this._hue;
  }

  set hue (hue) {
    this._hue = hue;
  }
}