class Ball {
  //p is the position (vector)
  //v is the velocity (vector)
  PVector p, v;
  Ball(PVector location) {
    this(location.x, location.y);
  }
  Ball(float x, float y) {
    this.p = new PVector(x,y);
    this.v = new PVector(0,0);
    println(p);
  }
  
  void launch(float x, float y) {
    v.x = x;
    v.y = y;
  }
  void collision(float a, float b, float c) {
    if ((((p.x*p.x)/(a*a)) + ((p.y*p.y)/(b*b))) >= 1) {
      /* DO THE PHYSICS FOR THE COLLISION*/
      
      //PVector tangent = new PVector(-p.y, p.x);
      //PVector tangent = new PVector(b*b*p.x, a*a*p.y);
      //float costheta = tangent.dot(p) / (tangent.mag() * p.mag());
      //float angle = acos(costheta);
      //float top = (a*a*p.y*p.y) + (b*b*p.x*p.x) + (b*b*p.x*c);
      //float bottom = ((a*a - b*b)*p.x*p.y) + (a*a*p.y*c);
      //float angle = atan(top / bottom);
      float angle = atan(b*b/(c*p.y));
      println(angle);
      int xMult, yMult;
      if (v.x > 0) {
        xMult = 1;
      } else {
        xMult = -1;
      }
      if (v.y > 0) {
        yMult = 1;
      } else {
        yMult = -1;
      }
      v.x *= xMult * cos(angle);
      v.y *= yMult * sin(angle);
      println(v);
      for (int i = 0; i < 100; i++) {
        //update();
      }
    }
  }
  void update() {
    p.x += v.x;
    p.y -= v.y;
  }
  void show() {
    stroke(255, 0, 0);
    println(p);
    point(p.x, p.y);
  }
}
