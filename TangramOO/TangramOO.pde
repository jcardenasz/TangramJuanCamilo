Shape[] shapes;
boolean drawGrid = true;

// TODO Implemente
// 1. La manipulacion de las piezas con el mouse y el teclado
// 2. La evaluacion de la solucion
// 3. El modo de creacion de nuevos problemas

void setup() {
  size(800, 800);
  textSize(20);
  shapes = new Shape[7];
  // TODO: agregue los shapes del juego
  for (int i=0; i<shapes.length; i++)
    shapes[i] = new Rect();
}

void drawGrid(float scale) {
  push();
  strokeWeight(1);
  int i;
  for (i=0; i<=width/scale; i++) {
    stroke(0, 0, 0, 20);
    line(i*scale, 0, i*scale, height);
  }
  for (i=0; i<=height/scale; i++) {
    stroke(0, 0, 0, 20);
    line(0, i*scale, width, i*scale);
  }
  pop();
}

void draw() {
  background(255, 255, 255);
  if (drawGrid)
    drawGrid(10);
  for (Shape shape : shapes)
    shape.draw();
}

void keyPressed() {
  if (key == 'g' || key == 'G')
    drawGrid = !drawGrid;
}
