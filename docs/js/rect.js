class Rect extends Shape {
  constructor () {
    super();
    this.edge = 100;
  }

  drawShape() {
    rectMode(CENTER);
    rect(0, 0, this.edge, this.edge);
  }

  get edge() {
    return this._edge;
  }

  set edge(value) {
    this._edge = value;
  }
}
