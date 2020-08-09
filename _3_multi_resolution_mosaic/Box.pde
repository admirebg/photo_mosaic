
void drawBoxGrid(){
  
  b[0] = new Box(1,         1, width/5, height/5);
  b[1] = new Box(1*width/5, 1, 2*width/5, height/5);
  b[2] = new Box(2*width/5, 1, 3*width/5, height/5);
  b[3] = new Box(3*width/5, 1, 4*width/5, height/5);
  b[4] = new Box(4*width/5, 1, 5*width/5, height/5);
  
  b[5] = new Box(1,         height/5, width/5, 2*height/5);
  b[6] = new Box(1*width/5, height/5, 2*width/5, 2*height/5);
  b[7] = new Box(2*width/5, height/5, 3*width/5, 2*height/5);
  b[8] = new Box(3*width/5, height/5, 4*width/5, 2*height/5);
  b[9] = new Box(4*width/5, height/5, 5*width/5, 2*height/5);
  
    b[10] = new Box(1,        2*height/5, width/5, 3*height/5);
  b[11] = new Box(1*width/5, 2*height/5, 2*width/5, 3*height/5);
  b[12] = new Box(2*width/5, 2*height/5, 3*width/5, 3*height/5);
  b[13] = new Box(3*width/5, 2*height/5, 4*width/5, 3*height/5);
  b[14] = new Box(4*width/5, 2*height/5, 5*width/5, 3*height/5);
  
    b[15] = new Box(1,         3*height/5, width/5, 4*height/5);
  b[16] = new Box(1*width/5, 3*height/5, 2*width/5, 4*height/5);
  b[17] = new Box(2*width/5, 3*height/5, 3*width/5, 4*height/5);
  b[18] = new Box(3*width/5, 3*height/5, 4*width/5, 4*height/5);
  b[19] = new Box(4*width/5, 3*height/5, 5*width/5, 4*height/5);
  
    b[20] = new Box(1,         4*height/5, width/5, 5*height/5);
  b[21] = new Box(1*width/5, 4*height/5, 2*width/5, 5*height/5);
  b[22] = new Box(2*width/5, 4*height/5, 3*width/5, 5*height/5);
  b[23] = new Box(3*width/5, 4*height/5, 4*width/5, 5*height/5);
  b[24] = new Box(4*width/5, 4*height/5, 5*width/5, 5*height/5);

}


class Box 
{
  float Xl, Yl;
  float Xh, Yh;
  final static float zero = 1e-20;
  Box(float X_1, float Y_1, float X_2, float Y_2) {
    // Orient so (Xl,Yl) and (Xh,Yh) are min/max extent, respectively
    Xl = min(X_1, X_2);
    Xh = max(X_1, X_2);
    Yl = min(Y_1, Y_2);
    Yh = max(Y_1, Y_2);
  }
  
  boolean pointInside(float x, float y) {
    return x > Xl && x < Xh && y > Yl && y < Yh;
  }
  
  // Compute the intersection of the given ray (where x=R0x+Rdx*t and
  //   y=R0y+Rdy*t) with this box; return two t values, Tnear and Tfar,
  //   which give the entry and exit values of t (> 0)
  float[] intersectRay(float R0x, float R0y, float Rdx, float Rdy) {
    float Tnear = -1e30;
    float Tfar = 1e30;
    
    // First, check slab in X.
    if (abs(Rdx) < zero) {
      // Ray is parallel to X, but starts outside. Fail.
      if (R0x < Xl || R0x > Xh) {
        return null;
      }
    } else {
      float Ta = (Xl-R0x)/Rdx, Tb = (Xh-R0x)/Rdx;
      float T1 = min(Ta,Tb);
      float T2 = max(Ta,Tb);
      if (T1 > Tnear) Tnear = T1;
      if (T2 < Tfar) Tfar = T2;
      if (Tnear > Tfar) return null;
      if (Tfar < 0) return null;
    }
    
    // Then check slab in Y.
    if (abs(Rdy) < zero) {
      // Ray is parallel to X, but starts outside. Fail.
      if (R0y < Yl || R0y > Yh) {
        return null;
      }
    } else {
      float Ta = (Yl-R0y)/Rdy, Tb = (Yh-R0y)/Rdy;
      float T1 = min(Ta,Tb);
      float T2 = max(Ta,Tb);
      if (T1 > Tnear) Tnear = T1;
      if (T2 < Tfar) Tfar = T2;
      if (Tnear > Tfar) return null;
      if (Tfar < 0) return null;
    }
    
    // If we have survived this far, the test passed.
    return new float[] {Tnear, Tfar};
  }
  
  // Divide this box down into 4 quadrants
  Box[] quarter() {
    return quarter(0);
  }
  
  // d = boundary "fuzziness" size
  Box[] quarter(float d) {
    float Xm = 0.5*(Xl+Xh);
    float Ym = 0.5*(Yl+Yh);
    Box[] quads = new Box[4];
    quads[0] = new Box(Xm-d,Yh+d,Xh+d,Ym-d);
    quads[1] = new Box(Xl-d,Yh+d,Xm+d,Ym-d);
    quads[2] = new Box(Xl-d,Ym+d,Xm+d,Yl-d);
    quads[3] = new Box(Xm-d,Ym+d,Xh+d,Yl-d);
    return quads;
  }
  
  void drawMe() {
    //rect(Xl, Yl, Xh-Xl, Yh-Yl);
    matchingTiles(round(Xl), round(Yl), round(Xh-Xl), round(Yh-Yl));
  }
}
