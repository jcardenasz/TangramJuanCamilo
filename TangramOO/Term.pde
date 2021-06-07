class Term extends Shape {
  String _term;

  Term() {
    this(3, 8);
  }

  Term(String term, float scaling) {
    setTerm(term);
    setScaling(scaling);
  }

  Term(int term, float scaling) {
    setTerm(term);
    setScaling(scaling);
  }

  @Override
  void aspect() {
    noStroke();
    text(_term, 0, 0);
  }

  String term() {
    return _term;
  }

  void setTerm(String term) {
    _term = term;
  }

  void setTerm(int term) {
    _term = new String();
    // see: https://discourse.processing.org/t/get-random-letters-and-put-into-a-string/28585/10
    for (int i = 0; i < term; i++) {
      _term += char (int(random (65, 65+24)));
    }
  }
}