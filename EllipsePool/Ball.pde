class Ball {
  //p is the position (vector)
  //v is the velocity (vector)
  PVector p, v;
  Ball(PVector location) {
    this(location.x, location.y);
  }
  Ball(float x, float y) {
    this.p = new PVector(x, y);
    this.v = new PVector(0, 0);
  }

  void launch(float x, float y) {
    v.x = x;
    v.y = y;
  }
  void collision(float a, float b) {
    if ((((p.x*p.x)/(a*a)) + ((p.y*p.y)/(b*b))) >= 1) {
      /* DO THE PHYSICS FOR THE COLLISION*/
      //http://www.3dkingdoms.com/weekly/weekly.php?a=2
      //https://math.stackexchange.com/questions/1673378/determining-the-normal-of-an-ellipse
      PVector normal = new PVector();
      normal.x = -1*p.x;
      normal.y = (a/b)*(a/b)*p.y;
      normal.normalize();
      PVector bounce = new PVector(normal.x, normal.y);
      bounce.mult(-2*(v.dot(normal)));
      bounce.add(v);
      v = bounce;
    }
  }

  boolean inHole(PVector[] holes, float fociStroke) {
    for (PVector hole : holes) {
      if (p.dist(hole) <= fociStroke) {
        return true;
      }
    }
    return false;
  }
  void update() {
    p.x += v.x;
    p.y -= v.y;
  }
  void show() {
    stroke(255,0,0);
    strokeWeight(10);
    point(p.x, p.y);
  }
}
