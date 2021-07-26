// Implementar:
// 1. La creación de las siete distintas piezas
// 2. La interacción: selección y manipulación de las piezas (ratón, teclas, touch...)
// 3. La evaluacion de la solucion
// 4. El modo de creacion de nuevos problemas

Shape[] shapes;
Shape[] shadows;
boolean drawGrid = true;
color mousecolor; //Useful for moving the figures
int mode = 0;
int blackpixels = 0;
Table levels;
boolean nextstage = false;
int level=0;
PImage cover, keys,savingimage,returnimage;


void setup() {
  frameRate(60);
  size(1200,700);
  cover = loadImage("TangramCover.png");
  keys = loadImage("KeyBindings.png");
  savingimage = loadImage("saving.png");
  returnimage = loadImage("numbers.png"); 
  levels = loadTable("levels.csv","header"); 
  //There is the creation of an array which contains 7 figures
  shapes= new Shape[7];
  shadows= new Shape[7];
  for(int i=0; i<shapes.length; i++){                     
    if(i<=4) shapes[i] = new Triangle(); //i<4 because there are 4 Triangles, which come from the same class (Triangle)
  }shapes[5]=new Rect();  shapes[6]=new Parallelogram(); //Then the specific square and parallelogram objects
  
  for(int i=0; i<shadows.length; i++){                     
    if(i<=4) shadows[i] = new Triangle(); //i<4 because there are 4 Triangles, which come from the same class (Triangle)
  }shadows[5]=new Rect();  shadows[6]=new Parallelogram();
  
  
  for(int i=0; i<shapes.length; i++){   //Clones from shapes are created and painted black
    shadows[i].setHue(#000000);
  }
  initialFrame(shapes);
  figureScaling(shapes);
  figureScaling(shadows);
  figureColor(shapes); 
  pixelNumberSetting();
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

void draw(){
  background(255, 255, 255);
  //Creation of the grid
  if (drawGrid==true)
    drawGrid(10);
  /* With this for cycle, every figure is shown, 
     after that the movement functions are invoked */
  menu(mode);
  loadPixels();
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
    delay(40);
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
  }delay(30);                  // Delay() is used to prevent a massive 
}                              // spin if the key is not released 

void rotateLeft(Shape a){
  if(key=='e'||key=='E'){
    if(a.scaling()<2){
      a._rotation-=0.05;
    }else a._rotation-=0.01;
  }delay(30);
}

void keyReleased(Shape a){
  if(key=='q' || key=='Q'){
    a._rotation-=PI/4;
    delay(50);
  }
  
  if(key=='w' || key=='W'){
    a._rotation+=PI/4;
    delay(50);
  }
}

//With te 'g' key you can erase the grid
void keyPressed() {
  if (key == 'g' || key == 'G')
    drawGrid = !drawGrid;
}

void mousePos(){
  if(mousePressed){
    int x=mouseX;
    int y=mouseY;
    print(x+", "+y);    
  }
}

//This function is useful for counting the number of pixels in a shape
int figurePixelCounter(Shape a){
  loadPixels();
  int aux=0;
  for(int i=0; i<pixels.length; i++){
    if(pixels[i]==a.hue()){
      aux++;
    }
  }
  return aux;
}

//This functions changes the value pixelnumber of every shape using the number of pixels of the figure
void pixelNumberSetting(){
  for(int i=0; i<shapes.length; i++){
    shapes[i].setPixelNumber(figurePixelCounter(shapes[i]));
    background(255,255,255);
  }
}

void verification(int blackpixels, boolean next){
  loadPixels();
  for(int i=0; i<pixels.length; i++){
    if(pixels[i]==#000000){
      blackpixels++;}
   }
  
  if (blackpixels<2000){next=true;}
    blackpixels=0;

  if(next==true ){  
      level+=7;
      initialFrame(shapes);
      nextstage=false;
      delay(50);
      print(next);
  }
}
  


/*void figuresBlackBorder(){
  loadPixels();
  for(int i=0; i<pixels.length; i++){
     if(pixels[i]==#000000){
       blackpixels++;}
   }print(blackpixels,". ");
  blackPixels=0;
}*/

//Menu function
void menu(int a){
  if(keyPressed){
     if(key=='1') mode = 1;
     if(key=='2') mode = 2;
     if(key=='3') mode = 3;
     if(key==BACKSPACE) mode = 0;
  }
  
      if(a==0) image(cover,0,0,width,height);
        
      if(a==1){ //free+creation
        image(savingimage,0,0,width/4,height/4);
        image(returnimage,0,height-180);
        int savecount=0;
        for (Shape shape : shapes){
          shape.draw();
          figureUsage(currentMouseColor(),shape);
          figureMovement(shape);
          figureRotation(shape);
          
          if(keyPressed && key==ENTER && savecount<7){
            delay(100);
            savecount++;
            TableRow row = levels.addRow();
            row.setInt("positionx",xFromPosition(shape));
            row.setInt("positiony",yFromPosition(shape));
            row.setFloat("rotationv",shape.rotation());
            saveTable(levels,"levels.csv");print(" File saved! -");
          }
        }
        if(savecount>=7)savecount=0;
      }
      if(a==2){ //levels
        image(returnimage,0,height-180);
        for (Shape shadow : shadows){
          shadow.draw();
        }
        for (Shape shape : shapes){
          shape.draw();
          figureUsage(currentMouseColor(),shape);
          figureMovement(shape);
          figureRotation(shape);
          levelReader(level);
          }
        verification(blackpixels, nextstage);
      }
      if(a==3){
      image(keys,0,0,width,height);
      }
        }
        

void levelReader(int level){
  if(level<levels.getRowCount()){
    int shadowarrayposition=0;
    for(int j=level;j<7+level;j++){
        TableRow row = levels.getRow(j);
        float x = row.getInt("positionx");
        float y = row.getInt("positiony");
        float v = row.getFloat("rotationv");
        shadows[shadowarrayposition].setPosition(new PVector (x,y));
        shadows[shadowarrayposition].setRotation(v);     
        shadowarrayposition++;
    }
  }
}

int xFromPosition(Shape a){
    return int((a.position()).x);
  }
int yFromPosition(Shape a){
    return int((a.position()).y);
  }
  
void figureColor(Shape[] a){
  a[0].setHue(-695264);    //orange: #F56420
  a[1].setHue(-11819696);  //green: #4BA550
  a[2].setHue(-9359968);   //purple: #712DA0
  a[3].setHue(-15194511);  //blue: #182671
  a[4].setHue(-1891029);   //red: #E3252B
  a[5].setHue(-1386188);   //yellow: #EAD934
  a[6].setHue(-11031369);  //magenta: #57ACB7
}

void figureScaling(Shape[] a){
   a[0].setScaling(2);
   a[1].setScaling(2);
   a[2].setScaling(1.4);
}

void initialFrame(Shape[] a){
  a[0].setPosition(new PVector(370,260));   
  a[0].setRotation(PI);
  a[1].setPosition(new PVector(440,331)); 
  a[1].setRotation(3*PI/2);
  a[2].setPosition(new PVector(264,436));  
  a[2].setRotation(5*PI/4);
  a[3].setPosition(new PVector(334,330));
  a[3].setRotation(PI/2);
  a[4].setPosition(new PVector(440,436)); 
  a[4].setRotation(2*PI);
  a[5].setPosition(new PVector(369,401));  
  a[5].setRotation(PI/4);
  a[6].setPosition(new PVector(264,295)); 
  a[6].setRotation(PI/2);
}
