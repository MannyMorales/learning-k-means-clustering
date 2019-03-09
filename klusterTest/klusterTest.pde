PVector[] points;
int numPoints;

void setup(){
  // sets canvas size
  size(400, 400);
  
  // randomly generate numPoints points around entire canvas
  numPoints = 100;
  points = new PVector[numPoints];
  for(int i=0; i<numPoints; i++){
    points[i] = new PVector((int)random(width), (int)random(height)); 
    ellipse(points[i].x, points[i].y, 4, 4);
  }
  
}

void draw(){
  
}
