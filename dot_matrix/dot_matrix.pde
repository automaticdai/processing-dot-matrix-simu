DotMatrix matrix;

int[][] dot_data;
int rows = 16;
int columns = 16;

void setup() {
  randomSeed(0);
  
  matrix = new DotMatrix(rows, columns);
  matrix.setDotSize(32,2);
  matrix.setBgColor(color(200,200,200,100));
  matrix.setDotColor(color(250,1,1));
  
  dot_data = new int[rows][columns];
  
  size(100, 100);
  surface.setResizable(true);
  
}


void draw() {
  background(200);
  surface.setSize(matrix.getMatrixWidth(), matrix.getMatrixHeight());
  
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < columns; j++) {
      dot_data[i][j] = int(random(0, 255));
    }
  }
  
  matrix.loadData(dot_data);
  matrix.draw();
  
}
