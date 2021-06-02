
// (semi) standard reporting undef
// see: https://standardjs.com/#i-use-a-library-that-pollutes-the-global-namespace-how-do-i-prevent-variable-is-not-defined-errors

/* global Shape, rectMode, rect, CENTER */

class Rect extends Shape { // eslint-disable-line no-unused-vars
  constructor (edge = 100) {
    super();
    this.edge = edge;
  }

  drawShape () {
    rectMode(CENTER);
    rect(0, 0, this.edge, this.edge);
  }

  get edge () {
    return this._edge;
  }

  set edge (value) {
    this._edge = value;
  }
}
