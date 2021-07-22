// Implementar:
// 1. La creación de las siete distintas piezas
// 2. La interacción: selección y manipulación de las piezas (ratón, teclas, touch...)
// 3. La evaluacion de la solucion
// 4. El modo de creacion de nuevos problemas

Shape[] shapes;
boolean drawGrid = true;
color mousecolor;

void setup() {
  frameRate(30);
  size(1200,700);
  shapes= new Shape[7];
  for(int i=0; i<shapes.length; i++){
    if(i<=4) shapes[i] = new Triangle();
  }shapes[5]=new Rect();  shapes[6]=new Parallelogram();
  figureColor(); 
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
  if (drawGrid==true)
    drawGrid(10);
  for (Shape shape : shapes){
    shape.draw();
    figureMovement(currentMouseColor());
    figureRotation(currentMouseColor());
  }
}

color currentMouseColor(){
  return get(mouseX,mouseY);
}

void figureMovement(color currentmousecolor){
  if(mousePressed){
    for(Shape shape : shapes){
      if(shape._hue==currentmousecolor){
        shape.setPosition(new PVector(mouseX,mouseY));
      }
    }
  }
}

void figureRotation(color currentmousecolor){
  if(mousePressed && (currentmousecolor<0)){
    for(Shape shape : shapes){
      if(shape.hue()==currentmousecolor && keyPressed){
        rotateRight(shape);
        rotateLeft(shape);
      }
    }
  }
}

void rotateRight(Shape a){
  if(key=='r'||key=='R'){
    if(a.scaling()<2){
      a._rotation+=0.01;
    }else a._rotation+=0.005;
  }
}

void rotateLeft(Shape a){
  if(key=='e'||key=='E'){
    if(a.scaling()<2){
      a._rotation-=0.01;
    }else a._rotation-=0.005;
  }
}

void keyPressed() {
  if (key == 'g' || key == 'G')
    drawGrid = !drawGrid;
}

void figureColor(){
  shapes[0].setHue(-695264);    //orange: #F56420
  shapes[0].setScaling(2);
  shapes[1].setHue(-11819696);  //green: #4BA550
  shapes[1].setScaling(2);
  shapes[2].setHue(-9359968);   //purple: #712DA0
  shapes[2].setScaling(1.4);
  shapes[3].setHue(-15194511);  //blue: #182671
  shapes[4].setHue(-1891029);   //red: #E3252B
  shapes[5].setHue(-1386188);   //yellow: #EAD934
  shapes[6].setHue(-11031369);  //magenta: #57ACB7
}
