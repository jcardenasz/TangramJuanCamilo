// The Parallelogram class allows the creation of parallelogram objects
class Parallelogram extends Shape{
  float _edge, _distance;
  boolean _reflect=false;
  
   Parallelogram(){
     this(50*sqrt(2)/2,25*sqrt(2));
     setHue(#000000);
   }
   
   Parallelogram(float edge, float distance){
     setEdge(edge);
     setDistance(distance);
     setReflect(false);
   }
  
  // In this method there are 2 different parallelograms, one is the reflection of the other one.
  // They are shown if the user presses the key 'm'
  void aspect() {
    if(_reflect==false){
        quad(-edge(),-distance(),edge()+2*distance(),-distance(),edge(),distance(),-edge()-2*distance(),distance());
    }else quad(-edge()-2*distance(),-distance(),edge(),-distance(),edge()+2*distance(),distance(),-edge(),distance()); 
    if (keyPressed && (key=='m' || key=='M')){
      delay(50);
      if(reflect()==false){
         setReflect(true);
      }else setReflect(false);
    }
  }  
  
  //Setters and Getters 
  public float edge() {
    return _edge;
  }
  public void setEdge(float edge) {
    _edge = edge;
  }
    
  public float distance(){
    return _distance;
  }
  public void setDistance(float distance) {
    _distance = distance;
  }
  boolean reflect(){
    return _reflect;
  }
  
  public void setReflect(boolean reflect){
    _reflect = reflect;
  }
  
}
