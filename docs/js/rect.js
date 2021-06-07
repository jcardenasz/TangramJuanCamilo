class Rect extends Shape {
  constructor (edge = 100) {
    super();
    this.edge = edge;
  }

  aspect() {
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
