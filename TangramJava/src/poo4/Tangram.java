// Implementar:
// 1. La creación de las siete distintas piezas (por ahora son todas Rect) 
// 2. La interacción: selección y manipulación de las piezas (ratón, teclas, touch...)
// 3. La evaluacion de la solucion
// 4. El modo de creacion de nuevos problemas

package poo4;

import processing.core.PApplet;

public class Tangram extends PApplet {
  Shape[] shapes;
  boolean drawGrid = true;

  @Override
  public void settings() {
    size(800, 800);
  }

  @Override
  public void setup() {
    shapes = new Shape[7];
    for (int i = 0; i< shapes.length; i++)
      shapes[i] = i < 4 ? new  Rect(this) : new Term(this);
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
    if (drawGrid)
      drawGrid(10);
    for (Shape shape : shapes)
      shape.draw();
  }

  @Override
  public void keyPressed() {
    if (key == 'g' || key == 'G')
      drawGrid = !drawGrid;
  }

  public static void main(String[] args) {
    PApplet.main(new String[]{"poo4.Tangram"});
  }
}
