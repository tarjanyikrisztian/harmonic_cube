int OFF_MAX = 700;

void setup() {
  noStroke();
  smooth();
  size(800,800,P3D);
}
float angle = 0.0;

void draw() {
  background(round(map(mouseX+mouseY, 0, 1600, 0, 255)));
  lights();
  translate(width / 2, height / 2, -OFF_MAX);
  rotateX(4);
  rotateZ(7);
  
  float maxD = dist(0,0,400,400);
  
  for (int xo = 0; xo <= OFF_MAX; xo += 50) {
    for (int yo = 0; yo <= OFF_MAX; yo += 50) {
        float d = dist(yo,xo,width/2,height/2);
        float off = map(d, 0, maxD, -PI, PI);
        pushMatrix();
        translate(xo-width/2, yo-height/2, 0);
        float an = angle + off;
        float m = map((float)Math.sin(an), -1, 1, 0, 300);
        box(50,50,50+m);
        ambient(75, round(map(mouseX, 0, 800, 0, 255)), round(map(mouseY, 0, 800, 0, 255)));
        popMatrix();
    }
  }
  angle += 0.05;
  
}
