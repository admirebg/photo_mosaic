/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/10795*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
// Basic quadtree demo.
// Click inside a quad to subdivide it.

// AA is off for speed reasons and framerate is limited to 10fps, but these
// are easily changed.
// This isn't optimized particularly well. The entire quadtree is drawn in full
// on every single frame, when I only need to be drawing new divisions as they're
// created.

import SimpleOpenNI.*;
SimpleOpenNI kinect;

int kDim = 5;
int cloGridw = 640/kDim;
int cloGridh = 480/kDim;
int[] cloPoints = new int[kDim*kDim];
int i =0;

kPoint kpoints = new kPoint(4000, 0);
int datanum = 10;
int datacount = 0;


Box[] b = new Box[25];
QuadTree[] q = new QuadTree[25];

int imageCount = 1627;
PImage[] pics = new PImage[imageCount];
PImage img;

int tintValue = 30;
//setup the general color ranges.
int[] greenDark = new int[0];
int[] greenMid = new int[0];
int[] greenBright = new int[0];
int[] redDark = new int[0];
int[] redMid = new int[0];
int[] redBright = new int[0];
int[] blueDark = new int[0];
int[] blueMid = new int[0];
int[] blueBright = new int[0];
int[] greenDark2 = new int[0];
int[] greenMid2 = new int[0];
int[] greenBright2 = new int[0];
int[] redDark2 = new int[0];
int[] redMid2 = new int[0];
int[] redBright2 = new int[0];
int[] blueDark2 = new int[0];
int[] blueMid2 = new int[0];
int[] blueBright2 = new int[0];

void setup() {
  
  //size(640, 480);  // (640, 480)
  size(1920, 1080); 
  frameRate(10);
  
  kinect = new SimpleOpenNI(this);
  kinect.enableDepth();
  kinect.enableRGB();
  kinect.setMirror(true);
  
 drawBoxGrid();
  
  for(int i=0; i<kpoints.num; i++){   
  q[i] = new QuadTree(b[i]); 
}
  //smooth();
  
     //load sub images
  for (int j = 0; j<imageCount; j++) {
    if (j < 10) {
      pics[j] = loadImage("000" + j + ".jpg");
    } 
    else if (j < 100) {
      pics[j] = loadImage("00" + j + ".jpg");
    } 
    else if (j < 1000) {
      pics[j] = loadImage("0" + j + ".jpg");
    } 
    else if (j < 10000) {
      pics[j] = loadImage(j + ".jpg");
    }
  }

  //identify subs-images.
  for (int i = 0; i < pics.length; i++) {

    color avColor = averageColor(pics[i]);
    float avBright = averageBrightness(pics[i]);
    int tag = sortImages(avColor, avBright);

    if (tag == 1) {
      redDark = append(redDark, i);
    } 
    else if (tag == 2) {
      redDark2 = append(redDark2, i);
    }
    else if (tag == 3) {
      redMid = append(redMid, i);
    }
    else if (tag == 4) {
      redMid2 = append(redMid2, i);
    }  
    else if (tag == 5) {
      redBright = append(redBright, i);
    } 
    else if (tag == 6) {
      redBright2 = append(redBright2, i);
    } 
    else if (tag == 7) {
      greenDark = append(greenDark, i);
    } 
    else if (tag == 8) {
      greenDark2 = append(greenDark2, i);
    } 
    else if (tag == 9) {
      greenMid = append(greenMid, i);
    } 
    else if (tag == 10) {
      greenMid2 = append(greenMid2, i);
    }
    else if (tag == 11) {
      greenBright = append(greenBright, i);
    } 
    else if (tag == 12) {
      greenBright2 = append(greenBright2, i);
    }
    else if (tag == 13) {
      blueDark = append(blueDark, i);
    } 
    else if (tag == 14) {
      blueDark2 = append(blueDark2, i);
    } 
    else if (tag == 15) {
      blueMid = append(blueMid, i);
    } 
    else if (tag == 16) {
      blueMid2 = append(blueMid2, i);
    } 
    else if (tag == 17) {
      blueBright = append(blueBright, i);
    } 
    else if (tag == 18) {
      blueBright2 = append(blueBright2, i);
    }
  }
  
  //noLoop();
}


void draw() {
  
    kinect.update();
    drawkPoints();
  
    img = kinect.rgbImage();
    //image(img, 0, 0, width, height); 
  
    for(int i=0; i<kpoints.num; i++){   
      q[i].drawMe();
    }
    
  //if (mousePressed) {
  //  if (mouseButton == LEFT) {
      for(int i=0; i<kpoints.num; i++){   
      q[i] = new QuadTree(b[i]);
      }
      
      for(int i=0; i<kpoints.num; i++){   
        
       for(int k=0; k< kpoints.num ; k++){  
        // QuadTree isect = q[i].getSmallestIntersect(mouseX, mouseY);
        
        //println(kpoints.avgZ[k]);
        //   int klevel = round(map(kpoints.avgZ[k], 1000, 4100, 3, 4));
        //   klevel = 4-klevel;
        
        // 900 1500 2000
           int klevel = 0;
           if(kpoints.avgZ[k] > 2100 && kpoints.avgZ[k] < 3000){
           klevel = 1;
           }else if(kpoints.avgZ[k] >= 1500 && kpoints.avgZ[k] < 2100){
            klevel = 2;
           }else if(kpoints.avgZ[k] >= 1100 && kpoints.avgZ[k] < 1500){
            klevel =3;
           }else if(kpoints.avgZ[k] >= 800 && kpoints.avgZ[k] < 1100){
            klevel = 4;
           }
           else{
           klevel = 0;
           }
           
           if(klevel != 0)
           {
             
             for(int j=0; j<klevel; j++){
            
            
  
      
          //println(kpoints.avgX[i]*2 +", "+ kpoints.avgY[i]*2);   
          
            QuadTree isect = q[i].getSmallestIntersect(kpoints.avgX[k]*width/640, kpoints.avgY[k] * height/480);

            QuadTree isectleft = q[i].getSmallestIntersect(kpoints.avgX[k]*width/640-96, kpoints.avgY[k] * height/480);
            QuadTree isectright = q[i].getSmallestIntersect(kpoints.avgX[k]*width/640+96, kpoints.avgY[k] * height/480);
            QuadTree isectup = q[i].getSmallestIntersect(kpoints.avgX[k]*width/640, kpoints.avgY[k] * height/480-54);
            QuadTree isectdown = q[i].getSmallestIntersect(kpoints.avgX[k]*width/640, kpoints.avgY[k] * height/480+54);
            
            QuadTree isectleftup = q[i].getSmallestIntersect(kpoints.avgX[k]*width/640-96, kpoints.avgY[k] * height/480-54);
            QuadTree isectrightup = q[i].getSmallestIntersect(kpoints.avgX[k]*width/640+96, kpoints.avgY[k] * height/480-54);
            QuadTree isectleftdown = q[i].getSmallestIntersect(kpoints.avgX[k]*width/640-96, kpoints.avgY[k] * height/480+54);
            QuadTree isectrightdown = q[i].getSmallestIntersect(kpoints.avgX[k]*width/640+96, kpoints.avgY[k] * height/480+54); 

            QuadTree isectleft2 = q[i].getSmallestIntersect(kpoints.avgX[k]*width/640-96*2, kpoints.avgY[k] * height/480);
            QuadTree isectright2 = q[i].getSmallestIntersect(kpoints.avgX[k]*width/640+96*2, kpoints.avgY[k] * height/480);
            //QuadTree isectup = q[i].getSmallestIntersect(kpoints.avgX[k], kpoints.avgY[k]-24);
           // QuadTree isectdown = q[i].getSmallestIntersect(kpoints.avgX[k], kpoints.avgY[k]+24);
            
          //  QuadTree isectleftup = q[i].getSmallestIntersect(kpoints.avgX[k]-50, kpoints.avgY[k]-24);
          //  QuadTree isectrightup = q[i].getSmallestIntersect(kpoints.avgX[k]+50, kpoints.avgY[k]-24);
          //  QuadTree isectleftdown = q[i].getSmallestIntersect(kpoints.avgX[k]-50, kpoints.avgY[k]+24);
          //  QuadTree isectrightdown = q[i].getSmallestIntersect(kpoints.avgX[k]+50, kpoints.avgY[k]+24); 
            
           
           if (isect != null) {
            isect.divide();
             }   
            if (isectleft != null) {
            isectleft.divide();
             }
             if (isectright != null) {
            isectright.divide();
             }
             if (isectup != null) {
            isectup.divide();
             }
            if (isectdown != null) {
            isectdown.divide();
             }
             
             if (isectleftup != null) {
            isectleftup.divide();
             }
             if (isectrightup != null) {
            isectrightup.divide();
             }
             if (isectleftdown != null) {
            isectleftdown.divide();
             }
            if (isectrightdown != null) {
            isectrightdown.divide();
             } 
            if (isectleft2 != null) {
            isectleft2.divide();
             }
            if (isectright2 != null) {
            isectright2.divide();
             } 
             
             
            }
           
          }
   
   }
     
     }
      
    //}
  /*  else if (mouseButton == RIGHT) {
      
      for(int i=0; i<16; i++){   
      q[i] = new QuadTree(b[i]);
      }
      
    } */
  //}
  stroke(0);
  delay(70);
}



