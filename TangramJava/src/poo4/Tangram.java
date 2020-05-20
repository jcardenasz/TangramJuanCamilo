package poo4;

import processing.core.PApplet;

public class Tangram extends PApplet {
  Shape[] _shapes;
  boolean _drawGrid = true;

  // TODO Implemente
  // 1. La manipulacion de las piezas con el mouse y el teclado
  // 2. La evaluacion de la solucion
  // 3. El modo de creacion de nuevos problemas

  @Override
  public void settings() {
    size(800, 800);
  }

  @Override
  public void setup() {
    textSize(20);
    _shapes = new Shape[7];
    // TODO: agregue los shapes del juego
    for (int i = 0; i< _shapes.length; i++)
      _shapes[i] = new Rect(this);
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

  @Override
  public void draw() {
    background(255, 255, 255);
    if (_drawGrid)
      drawGrid(10);
    for (Shape shape : _shapes)
      shape.draw();
  }

  @Override
  public void keyPressed() {
    if (key == 'g' || key == 'G')
      _drawGrid = !_drawGrid;
  }

  public static void main(String[] args) {
    PApplet.main(new String[]{"poo4.Tangram"});
  }
}
