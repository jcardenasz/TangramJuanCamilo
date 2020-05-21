// (semi) standard reporting undef
// see: https://standardjs.com/#i-use-a-library-that-pollutes-the-global-namespace-how-do-i-prevent-variable-is-not-defined-errors

/* global color, random, createVector, width, height, TWO_PI,
push, pop, fill, translate, rotate, scale */

class Shape { // eslint-disable-line no-unused-vars
  constructor () {
    this.hue = color(random(0, 255), random(0, 255), random(0, 255));
    this.position = createVector(random(0, width), random(0, height));
    this.rotation = random(0, TWO_PI);
    this.scaling = random(0.5, 1.5);
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

  // getters and setter
  // see: https://www.w3schools.com/js/js_object_accessors.asp

  get scaling () {
    return this._scl;
  }

  set scaling (s) {
    this._scl = s;
  }

  get rotation () {
    return this._rot;
  }

  set rotation (r) {
    this._rot = r;
  }

  get position () {
    return this._trans;
  }

  set position (t) {
    this._trans = t;
  }

  get hue () {
    return this._hue;
  }

  set hue (h) {
    this._hue = h;
  }
}
