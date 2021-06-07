// Implementar:
// 1. La creación de las siete distintas piezas (por ahora son todas Rect)
// 2. La interacción: selección y manipulación de las piezas (ratón, teclas, touch...)
// 3. La evaluacion de la solucion
// 4. El modo de creacion de nuevos problemas

var shapes = [];
var grid = true;

function setup() {
  const canvas = createCanvas(600, 338);
  for (let i = 0; i < 7; i++) {
    shapes[i] = i < 4 ? new  Rect() : new Term();
  }
}

function draw() {
  background(180);
  if (grid) {
    gridHint(10);
  }
  for (var i = 0; i < shapes.length; i++) {
    shapes[i].draw();
  }
}

function gridHint(scale) {
  push();
  stroke(0, 255, 255);
  strokeWeight(1);
  let i;
  for (i = 0; i <= width / scale; i++) {
    line(i * scale, 0, i * scale, height);
  }
  for (i = 0; i <= height / scale; i++) {
    line(0, i * scale, width, i * scale);
  }
  pop();
}

// De la jerarquia del Shape implementar:
// 1. El estilo  (e.g., stroke, stroke weight).
// 2. La funcion contains(x, y) que diga si un punto de coordenadas
// (x,y) se encuentra o no en su interior. Observe que esta
// funcion puede servir para la seleccion de la pieza con un puntero.
// 3. El resto de shapes que se requieran para el Tangram, como se
// hace con la clase Rect (ver la clase Rect abajo) y la clase Term
// (ver la clase Term abajo).

class Shape {
  constructor(
    position = createVector(random(0, width), random(0, height)),
    rotation = random(0, TWO_PI),
    scaling = random(0.5, 1.5),
    hue = color(random(0, 255), random(0, 255), random(0, 255))
  ) {
    this.position = position;
    this.rotation = rotation;
    this.scaling = scaling;
    this.hue = hue;
  }

  draw() {
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
    throw new Error("You have to implement the method geom!");
  }

  // should return a boolean value
  contains(x, y) {
    throw new Error("You have to implement the method contains!");
  }

  // getters and setters
  // see: https://www.w3schools.com/js/js_object_accessors.asp

  get scaling() {
    return this._scaling;
  }

  set scaling(scaling) {
    this._scaling = scaling;
  }

  get rotation() {
    return this._rotation;
  }

  set rotation(rotation) {
    this._rotation = rotation;
  }

  get position() {
    return this._position;
  }

  set position(position) {
    this._position = position;
  }

  get hue() {
    return this._hue;
  }

  set hue(hue) {
    this._hue = hue;
  }
}

class Rect extends Shape {
  constructor(edge = 100) {
    super();
    this.edge = edge;
  }

  aspect() {
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

class Term extends Shape {
  constructor (elements = 3, scaling = 8) {
    super();
    this.elements = elements;
    this.scaling = scaling;
  }

  aspect() {
    noStroke();
    text(this.elements, 0, 0);
  }

  get elements () {
    return this._term;
  }

  set elements (elements) {
    // see: https://stackoverflow.com/questions/1349404/generate-random-string-characters-in-javascript
    this._term = typeof elements === 'string' ? elements : typeof elements === 'number' ? Math.random().toString(36).slice(-elements) : '👽';
  }
}