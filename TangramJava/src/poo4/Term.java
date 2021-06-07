package poo4;

import processing.core.PApplet;

class Term extends Shape {
  protected String _elements;

  public Term(PApplet parent) {
    this(parent, 3, 8);
  }

  public Term(PApplet parent, String elements, float scaling) {
    super(parent);
    setElements(elements);
    setScaling(scaling);
  }

  public Term(PApplet parent, int elements, float scaling) {
    super(parent);
    setElements(elements);
    setScaling(scaling);
  }

  @Override
  protected void aspect() {
    _parent.noStroke();
    _parent.text(_elements, 0, 0);
  }

  public String elements() {
    return _elements;
  }

  public void setElements(String elements) {
    _elements = elements;
  }

  public void setElements(int elements) {
    _elements = new String();
    // see: https://discourse.processing.org/t/get-random-letters-and-put-into-a-string/28585/10
    for (int i = 0; i < elements; i++) {
      _elements += (char)((int)_parent.random(65, 65+24));
    }
  }
}