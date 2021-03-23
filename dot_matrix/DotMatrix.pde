class DotMatrix {
  int dot_size = 32;
  int dot_gap = 5;
  color dot_color = color(250,1,1);
  color bg_color = color(200,200,200,100);
  int columns = 4;
  int rows = 4;
  int data[][];
  int x = 20;
  int y = 20;
  
  DotMatrix() {
    data = new int[rows][columns];
  }
  
  void loadData(int[][] data) {
    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < columns; j++) {
        this.data[i][j] = data[i][j];
      }
    }
  }
  
  void setPixel(int i, int j, int data) {
    this.data[i][j] = data;
  }
  
  void draw() {
    pushMatrix();
    
    int temp_x = x; 
    int temp_y = y;
    
    rect(temp_x, temp_y, 
      (dot_size + dot_gap) * columns + dot_gap, 
      (dot_size + dot_gap) * rows + dot_gap);
    
    for (int i = 0; i < rows; i++) {
      temp_x += dot_gap;
      temp_y += dot_gap;
      for (int j = 0; j < columns; j++) {
        float r = random(1);
        if (data[i][j] > 0) {
          fill(dot_color, data[i][j]);
        } else {
          fill(bg_color);
        }
        square(temp_x, temp_y, dot_size);
        temp_x += (dot_size + dot_gap);
      }
      temp_x = x;
      temp_y += (dot_size + dot_gap);
    }
    
    
    
    popMatrix();
  }
}
