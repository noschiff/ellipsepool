float a, b, c;
PVector foci1, foci2;
Ball ball;

void setup() {
  size(700, 500);
  a = width/2;
  b = height/2;
  c = sqrt(a*a - b*b);
  foci1 = new PVector(-c, 0);
  foci2 = new PVector(c, 0);
  ball = new Ball(foci1);
}

void draw() {
  background(255);
  stroke(0);
  translate(width/2, height/2);
  strokeWeight(1);
  fill(230);
  ellipse(0, 0, a*2, b*2);
  strokeWeight(5);
  point(foci1.x, foci1.y);
  point(foci2.x, foci2.y);
  ball.collision(a,b);
  ball.update();
  ball.show();
}

//test the launch
void mousePressed() {
  float x = map(mouseX, 0, width, -5, 5);
    float y = -map(mouseY, 0, height, -5, 5);
  ball.launch(x, y);
}
