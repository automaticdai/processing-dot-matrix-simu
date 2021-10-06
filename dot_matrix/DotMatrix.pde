class DotMatrix {
  int columns = 8;
  int rows = 8;
  int dot_size = 2;
  int dot_gap = 0;
  color dot_color = color(255,1,1);
  color bg_color = color(200,200,200,100);
  int matrix_width;
  int matrix_height;
  int data[][];
  
  DotMatrix(int _rows, int _columns) {
    if (_rows < 1) {
      _rows = 1;
    }
    
    if (_columns < 1) {
      _columns = 1;
    }
    
    rows = _rows;
    columns = _columns;
    data = new int[rows][columns];
    
    matrix_width = (dot_size + dot_gap) * columns + dot_gap;
    matrix_height = (dot_size + dot_gap) * rows + dot_gap;
  }
  
  void setDotColor(color newColor) {
    dot_color = newColor;
  }
  
  void setBgColor(color newBgColor) {
    bg_color = newBgColor;
  }
  
  void setDotSize(int _dot_size, int _dot_gap) {
    if (_dot_size < 2) {
      _dot_size = 2;
    }
    
    if (_dot_gap < 0) {
      _dot_gap = 0;
    }
    
    dot_size = _dot_size;
    dot_gap = _dot_gap;
    
    matrix_width = (dot_size + dot_gap) * columns + dot_gap;
    matrix_height = (dot_size + dot_gap) * rows + dot_gap;
  }
  
  int getMatrixWidth() {
    return matrix_width;
  }
  
  int getMatrixHeight() {
    return matrix_height;
  }
  
  /* the dimension of data should match exactly of the matrix dimension */
  void loadData(int[][] data) {
    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < columns; j++) {
        this.data[i][j] = data[i][j];
      }
    }
  }
  
  /* set a single pixel */
  void setPixel(int i, int j, int data) {
    this.data[i][j] = data;
  }
  
  void draw() {
    pushMatrix();
    
    int x = 0;
    int y = 0;
  
    int temp_x = x; 
    int temp_y = y;
     
    // draw the borader
    PGraphics pg;
    pg = createGraphics(matrix_width + 20, matrix_height + 20);
    
    pg.beginDraw();
    pg.fill(0);
    pg.rect(temp_x, temp_y, matrix_width, matrix_height);
    
    temp_y += dot_gap;
    for (int i = 0; i < rows; i++) {
      temp_x += dot_gap;
      for (int j = 0; j < columns; j++) {
        if (data[i][j] > 0) {
          pg.fill(dot_color, data[i][j]);
        } else {
          pg.fill(bg_color);
        }
        pg.square(temp_x, temp_y, dot_size);
        temp_x += (dot_size + dot_gap);
      }
      temp_x = x;
      temp_y += (dot_size + dot_gap);
    }

    //pg.filter(BLUR, 6);
    pg.endDraw();
    
    image(pg, 0, 0);
    
    popMatrix();
  }
}
