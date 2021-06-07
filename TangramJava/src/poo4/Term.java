package poo4;

import processing.core.PApplet;

class Term extends Shape {
  protected String _term;

  public Term(PApplet parent) {
    this(parent, 3, 8);
  }

  public Term(PApplet parent, String term, float scaling) {
    super(parent);
    setTerm(term);
    setScaling(scaling);
  }

  public Term(PApplet parent, int term, float scaling) {
    super(parent);
    setTerm(term);
    setScaling(scaling);
  }

  @Override
  protected void aspect() {
    _parent.noStroke();
    _parent.text(_term, 0, 0);
  }

  public String term() {
    return _term;
  }

  public void setTerm(String term) {
    _term = term;
  }

  public void setTerm(int term) {
    _term = new String();
    // see: https://discourse.processing.org/t/get-random-letters-and-put-into-a-string/28585/10
    for (int i = 0; i < term; i++) {
      _term += (char)((int)_parent.random(65, 65+24));
    }
  }
}