class Term extends Shape {
    constructor (term = 3, scaling = 8) {
      super();
      this.term = term;
      this.scaling = scaling;
    }
  
    geom() {
      noStroke();
      text(this.term, 0, 0);
    }
  
    get term () {
      return this._term;
    }
  
    set term (term) {
      if (typeof term === 'string') {
        this._term = term;
      }
      else if (typeof term === 'number') {
        // see ideas here: https://stackoverflow.com/questions/1349404/generate-random-string-characters-in-javascript
        this._term = Math.random().toString(36).slice(-term);
      }
    }
  }