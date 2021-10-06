DotMatrix matrix;

int[][] dot_data;
int rows = 120;
int columns = 120;

void setup() {
  size(1000, 1000);
  randomSeed(0);
  matrix = new DotMatrix(rows, columns);
  dot_data = new int[rows][columns];
}


void draw() {
  background(200);
  
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < columns; j++) {
      dot_data[i][j] = int(random(0, 255));
    }
  }
  
  matrix.loadData(dot_data);
  matrix.draw();
  
}
