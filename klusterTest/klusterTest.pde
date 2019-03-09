PVector[] points;
Centroid[] centroids;
int numPoints;
int numCentroids;

void setup(){
  // sets canvas size
  size(400, 400);
  
  // randomly generate numPoints points around entire canvas
  numPoints = 1000;
  points = new PVector[numPoints];
  
  // TODO:
  // Use a different method for generating points
  // - It's kinda meaningless to find clusters when the points don't actually form clusters
  for(int i=0; i<numPoints; i++){
    points[i] = new PVector((int)random(width), (int)random(height)); 
    // initially draws points in black and white
    ellipse(points[i].x, points[i].y, 4, 4);
  }
  
  // sets each centroid to be in the same position
  // as a randomly selected point and a randomly generated color
  
  // TODO
  // Could be a problem if a random number is repeated
  // let's hope that doesn't happen for now...
  numCentroids = 8;
  centroids = new Centroid[numCentroids];
  for(int i=0; i<numCentroids; i++){
    // range of random ints for colors are limited to allow only relatively bright colors
    // TODO
    // Find smarter way of assigning colors to make sure they're not too similar
    color randCol = color(random(100,255), random(100,255), random(100,255));
    centroids[i] = new Centroid(points[(int)random(numPoints)], randCol); 
  }
  drawCentroids(centroids, 8);
}

void draw(){
  // sleeps a bit so that you can see the difference between each iteration
  delay(250);
  
  // clears all previoous dots to allow canvas to be updated
  background(0);
  
  // finds nearest centroid for each point
  for(int i=0; i<points.length; i++){
     findNearestCentroid(points[i], centroids);
  }
  
  // first draw each Centroid at their current positions
  // Have to draw them before updating as the points are colored
  // based on these positions
  for(int i=0; i<centroids.length; i++){
    centroids[i].drawDot(8);
    centroids[i].updatePosition();
  }
  
}

// function to draw each Centroid in an array of Centroids
// takes an int rad as the size of the dot to draw
void drawCentroids(Centroid[] arr, int rad){
  for(int i=0; i<arr.length; i++){
    arr[i].drawDot(rad);
  }
}

// finds the centroid closest to this point and redraws the point with 
// the centroid's color
void findNearestCentroid(PVector point, Centroid[] arr){
  // sets initial minimum to a big number so that the minimum will (should) be set
  // by a centroid in our set
  float minDist = 999999;
  // keeps track of which centroid is closest
  int centInd = 0;
  for(int i=0; i<arr.length; i++){
    if(point.dist(arr[i].pos) < minDist){
       minDist = point.dist(arr[i].pos);
       centInd = i;
    }
  }
  
  // updates the closest centroid's running totals with the point's x and y values
  arr[centInd].updateRunningTotals(point.x, point.y);
  
  // redraw point with appropriate color
  fill(arr[centInd].colr);
  ellipse(point.x, point.y, 4, 4);
}
