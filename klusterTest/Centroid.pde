/*
/* Centroid is the center of a particular cluster whose position can be updated
*/

public class Centroid{
  PVector pos;
  int colr;
  int runningTotalX;
  int runningTotalY;
  int runningTotalN;
  
  // takes a 2-dimensional PVector containing initial x and y coordinates
  // for the centroid and a color for it to display as
  Centroid(PVector position, int clr){
    pos = position;
    colr = clr;
    
    // initializes running totals to 0
    runningTotalX = 0;
    runningTotalY = 0;
    runningTotalN = 0;
  }
  
  // draws a dot representing the centroid in its c and y positions
  // in a given size for an ellipse
  void drawDot(float rad){
    fill(colr);
    ellipse(pos.x, pos.y, rad, rad);
  }
  
  // updates the centroid's position vector
  void updatePos(PVector newPos){
    pos = newPos;
  }  
  
  // updates the sum of x and y values separately and the number
  // of points that were closer to this centroid than any other
  // This info is collected to update the centroid's position to be the average 
  // position of all points closest to it
  void updateRunningTotals(int x, int y){
    runningTotalX += x;
    runningTotalY += y;
    runningTotalN++;
  }
}
