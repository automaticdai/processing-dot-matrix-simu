DotMatrix matrix;

int test_data[][] = {
{0,100,100,100},
{100,0,100,100},
{100,100,0,100},
{100,100,100,0}
};

void setup() {
  size(300, 300);
  matrix = new DotMatrix();
}


void draw() {
  background(0);
  randomSeed(0);
  matrix.loadData(test_data);
  matrix.draw();
}
