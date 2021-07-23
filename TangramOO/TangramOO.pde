// Implementar:
// 1. La creación de las siete distintas piezas
// 2. La interacción: selección y manipulación de las piezas (ratón, teclas, touch...)
// 3. La evaluacion de la solucion
// 4. El modo de creacion de nuevos problemas

Shape[] shapes;
boolean drawGrid = true;
color mousecolor; //Useful for moving the figures

void setup() {
  frameRate(30);
  size(1200,700);
  //There is the creation of an array which contains 7 figures
  shapes= new Shape[7];
  for(int i=0; i<shapes.length; i++){                     
    if(i<=4) shapes[i] = new Triangle(); //i<4 because there are 4 Triangles, which come from the same class (Triangle)
  }shapes[5]=new Rect();  shapes[6]=new Parallelogram(); //Then the specific square and parallelogram objects
  figureColor(); 
  freeGame();
}

//With this function a Grid can be created
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
  //Creation of the grid
  if (drawGrid==true)
    drawGrid(10);
  /* With this for cycle, every figure is shown, 
     after that the movement functions are invoked */
  for (Shape shape : shapes){
    shape.draw();
    figureUsage(currentMouseColor(),shape);
    figureMovement(shape);
    figureRotation(shape);
  }
}

// This function gets the color of the pixel under the mouse
color currentMouseColor(){
  return get(mouseX,mouseY);
}

//This function tells if a figure is selected
void figureUsage(color a,Shape shape){
  mouseReleased(a, shape);
} 

//This function switch the boolean to activate te selected function
void mouseReleased(color a, Shape shape){
  if(mouseButton==LEFT && a==shape.hue()){
    delay(25);
    if(shape.dimmer()==false){
      shape.setDimmer(true);
    }else shape.setDimmer(false);
  }
}

/* This function is encharged of updating the Position 
   of a figure if it's selected */
void figureMovement(Shape a){
  if(a.dimmer()==true){
     a.setPosition(new PVector(mouseX,mouseY));
   }figureUsage(currentMouseColor(),a);
}

/* This function allows the selected figure to rotate
   left with 'e' and right with 'r' */
   
void figureRotation(Shape a){
  if(a.dimmer()==true){ 
    if(keyPressed){
      rotateRight(a);
      rotateLeft(a);
      keyReleased(a);
    }
  }
  figureUsage(currentMouseColor(),a);
}
    
void rotateRight(Shape a){
  if(key=='r'||key=='R'){
    if(a.scaling()<2){
      a._rotation+=0.05;
    }else a._rotation+=0.01;
  }delay(10);                  // Delay() is used to prevent a massive 
}                              // spin if the key is not released 

void rotateLeft(Shape a){
  if(key=='e'||key=='E'){
    if(a.scaling()<2){
      a._rotation-=0.05;
    }else a._rotation-=0.01;
  }delay(10);
}

void keyReleased(Shape a){
  if(key=='q' || key=='Q'){
    a._rotation+=PI/4;
    delay(10);
  }
}

//With te 'g' key you can erase the grid
void keyPressed() {
  if (key == 'g' || key == 'G')
    drawGrid = !drawGrid;
}

/*void mousePos(){
  if(mousePressed){
    int x=mouseX;
    int y=mouseY;
    print(x+", "+y);    
  }
}*/

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

void freeGame(){
  shapes[0].setPosition(new PVector(370,260));   
  shapes[0].setRotation(PI);
  shapes[1].setPosition(new PVector(440,331)); 
  shapes[1].setRotation(3*PI/2);
  shapes[2].setPosition(new PVector(263,438));  
  shapes[2].setRotation(5*PI/4);
  shapes[3].setPosition(new PVector(334,332));
  shapes[3].setRotation(PI/2);
  shapes[4].setPosition(new PVector(440,438)); 
  shapes[5].setPosition(new PVector(369,402));  
  shapes[5].setRotation(PI/4);
  shapes[6].setPosition(new PVector(263,297)); 
  shapes[6].setRotation(PI/2);
}
