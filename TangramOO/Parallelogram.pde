class Parallelogram extends Shape{
  float _edge, _distance;
  boolean _switch=false;
  
   Parallelogram(){
     this(50*sqrt(2)/2,25*sqrt(2));
     setHue(#000000);
   }
   
   Parallelogram(float edge, float distance){
     setEdge(edge);
     setDistance(distance);
   }

 /* void aspect(){
    if((keyPressed) && (key=='m'||key=='M') && (_switch==false)){_switch=true;}
    if((keyPressed) && (key=='m'||key=='M') && (_switch==true)) {_switch=false;}
    if(_switch==false){
       quad(-edge()-2*distance(),-distance(),edge(),-distance(),edge()+2*distance(),distance(),-edge(),distance());
    }else quad(-edge(),-distance(),edge()+2*distance(),-distance(),edge(),distance(),-edge()-2*distance(),distance());
  }*/
  
  void aspect() {
    if(keyPressed && (key=='m' || key=='M')){
        quad(-edge(),-distance(),edge()+2*distance(),-distance(),edge(),distance(),-edge()-2*distance(),distance());
    }else  quad(-edge()-2*distance(),-distance(),edge(),-distance(),edge()+2*distance(),distance(),-edge(),distance());
  }  
 
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
    
}
