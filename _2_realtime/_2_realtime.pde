//alt f4
import SimpleOpenNI.*;

//boolean uvzero = true;

SimpleOpenNI context;
PImage img;
//int imageCount = 1627;
int imageCount = 1627;
int i=0;
int gridw = 0;    
int gridh = 0;

int grid_dim = 10;//8;
//int starty = 0;

int closestValue;
int closestX;
int closestY;

gridPoint points = new gridPoint(0);
int dis_min = 0;
int dis_max;
//int dim_min = 10; 4
//int dim_max = 30; 24
int dim_min = 6;
int dim_max = 6;

PImage[] pics = new PImage[imageCount];
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
  
  //int size_w =1024;
  //int size_h =768;
  
  int size_w = 1920;
  int size_h = 1080;
  size(size_w, size_h);
 
  frameRate(36);
  frame.setLocation(0, 0);


  context = new SimpleOpenNI(this);
  context.enableDepth();
  context.enableRGB();
  // disable mirror
  context.setMirror(true);
 
  int maxGridpointw = size_w/(grid_dim*2) + (grid_dim-1) *  size_w/(grid_dim);
  int maxGridpointh = size_h/(grid_dim*2) + (grid_dim-1) *  size_h/(grid_dim);
  
  dis_max = maxGridpointw  + maxGridpointh;
 // dis_max = 980;
  
  println(dis_max);
      
  //img = loadImage("test.JPG");


  //int picWidth = img.width;
  //int picHeight = img.height;
  //size(picWidth,picHeight);

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

  // noLoop();
}

void draw() {

  closestValue = 4000;
  context.update();

  PImage img = context.rgbImage();
  image(img, 0, 0, width, height); 
  
  gridw = int(width/grid_dim);    
  gridh = int(height/grid_dim);

  int depthValues[] = context.depthMap();

  for (int y=0; y<480; y++)
  { 
    for (int x=0; x<640; x++)
    {
      int p=x+y*640; 
      int currentDepthValue = depthValues[p];

      if (currentDepthValue >0 && currentDepthValue < closestValue)
      {
        closestValue = currentDepthValue;
        closestX = x;
        closestY = y;
      }
    }
  }
  closestX = closestX * width/640;
  closestY = closestY * height/480;

  //println("closestValue :" + closestValue + ", closestX :" + closestX + ", closestY :" + closestY );
  //master image

  //test for real-time coordinates value.


  // int pixelSize = int(img.height/80);
  //  image(img, 0, 0);

  //background(55);

  //int[] main_avg = new int[40*40]; 
  loadPixels();

  for (int v = 0; v < height; v += gridh) {
    for (int u = 0; u < width; u += gridw) {

      //println(i);

      if (v==0 && u==0) {  
        i = 0; //0
      }
      else {  
        i = (u/gridw) + grid_dim*(v/gridh); //1-15
      }

      int vv = v/gridh; // 0-3
      int uu = u/gridw; // 0-3

      points.xpos[i] = (gridw/2) + (gridw * uu); 
      points.ypos[i] = (gridh/2) + (gridh * vv); 
      //println(points.xpos[i] + ",  "+ points.ypos[i]);
      points.distance(closestX, closestY, i); 
 
      int dim = round(map(points.dis[i], dis_min, dis_max, dim_min, dim_max)); //map(dis, 140,980,10,30);

      int subpixelSizew = int(gridw/dim); 
      int subpixelSizeh = int(gridh/dim);


      for (int k = v; k < v+gridh; k += subpixelSizeh) {
        for (int j = u; j < u+gridw; j += subpixelSizew) {


          //println(subpixelSizeh);
          PImage mosaicPixel = get(j, k, subpixelSizew, subpixelSizeh);
          color sampleColor = averageColor(mosaicPixel);
          float sampleBrightness = averageBrightness(mosaicPixel);
          int id = sortImages(sampleColor, sampleBrightness);
          // println(id);


          fill(sampleColor);
          noStroke();
          rect(j, k, subpixelSizew, subpixelSizeh);
          //image(pics[0], 0, 0);  // sub-image road 여부 확인. 
          int col = sampleColor & 0xFF;   
          //int index = (v/subpixelSizeh) + (u/subpixelSizew*dim); // index: 0-255
          // main_avg[index] = col; 
          //println(col);

          if (id == 0) {
            int tempIndex = randomArrayIndex(imageCount);
            tint(sampleColor);
            image(pics[tempIndex], j, k, subpixelSizew, subpixelSizeh);
            noTint();
          } 
          else if (id == 1) {
            int aRange = redDark.length;
            if (aRange > 0) {
              int tempIndex = randomArrayIndex(aRange);
              int imageIndex = redDark[tempIndex];
              image(pics[imageIndex], j, k, subpixelSizew, subpixelSizeh);
              noStroke();
              fill(sampleColor, tintValue);
              rect( j, k, subpixelSizew, subpixelSizeh);
            } 
            else {
              int tempIndex = randomArrayIndex(imageCount);
              tint(sampleColor);
              image(pics[tempIndex], j, k, subpixelSizew, subpixelSizeh);
              noTint();
            }
          } 
          else if (id == 2) {
            int aRange = redDark2.length;
            if (aRange > 0) {
              int tempIndex = randomArrayIndex(aRange);
              int imageIndex = redDark2[tempIndex];
              image(pics[imageIndex], j, k, subpixelSizew, subpixelSizeh);
              noStroke();
              fill(sampleColor, tintValue);
              rect( j, k, subpixelSizew, subpixelSizeh);
            } 
            else {
              int tempIndex = randomArrayIndex(imageCount);
              tint(sampleColor);
              image(pics[tempIndex], j, k, subpixelSizew, subpixelSizeh);
              noTint();
            }
          }
          else if (id == 3) {
            int aRange = redMid.length;
            if (aRange > 0) {
              int tempIndex = randomArrayIndex(aRange);
              int imageIndex = redMid[tempIndex];
              image(pics[imageIndex], j, k, subpixelSizew, subpixelSizeh);
              noStroke();
              fill(sampleColor, tintValue);
              rect( j, k, subpixelSizew, subpixelSizeh);
            } 
            else {
              int tempIndex = randomArrayIndex(imageCount);
              tint(sampleColor);
              image(pics[tempIndex], j, k, subpixelSizew, subpixelSizeh);
              noTint();
            }
          } 
          else if (id == 4) {
            int aRange = redMid2.length;
            if (aRange > 0) {
              int tempIndex = randomArrayIndex(aRange);
              int imageIndex = redMid2[tempIndex];
              image(pics[imageIndex], j, k, subpixelSizew, subpixelSizeh);
              noStroke();
              fill(sampleColor, tintValue);
              rect(j, k, subpixelSizew, subpixelSizeh);
            } 
            else {
              int tempIndex = randomArrayIndex(imageCount);
              tint(sampleColor);
              image(pics[tempIndex], j, k, subpixelSizew, subpixelSizeh);
              noTint();
            }
          }
          else if (id == 5) {
            int aRange = redBright.length;
            if (aRange > 0) {
              int tempIndex = randomArrayIndex(aRange);
              int imageIndex = redBright[tempIndex];
              image(pics[imageIndex], j, k, subpixelSizew, subpixelSizeh);
              noStroke();
              fill(sampleColor, tintValue);
              rect(j, k, subpixelSizew, subpixelSizeh);
            }  
            else {
              int tempIndex = randomArrayIndex(imageCount);
              tint(sampleColor);
              image(pics[tempIndex], j, k, subpixelSizew, subpixelSizeh);
              noTint();
            }
          } 
          else if (id == 6) {
            int aRange = redBright2.length;
            if (aRange > 0) {
              int tempIndex = randomArrayIndex(aRange);
              int imageIndex = redBright2[tempIndex];
              image(pics[imageIndex], j, k, subpixelSizew, subpixelSizeh);
              noStroke();
              fill(sampleColor, tintValue);
              rect(j, k, subpixelSizew, subpixelSizeh);
            }  
            else {
              int tempIndex = randomArrayIndex(imageCount);
              tint(sampleColor);
              image(pics[tempIndex], j, k, subpixelSizew, subpixelSizeh);
              noTint();
            }
          } 
          else if (id == 7) {
            int aRange = greenDark.length;
            if (aRange > 0) {
              int tempIndex = randomArrayIndex(aRange);
              int imageIndex = greenDark[tempIndex];
              image(pics[imageIndex], j, k, subpixelSizew, subpixelSizeh);
              noStroke();
              fill(sampleColor, tintValue);
              rect(j, k, subpixelSizew, subpixelSizeh);
            }  
            else {
              int tempIndex = randomArrayIndex(imageCount);
              tint(sampleColor);
              image(pics[tempIndex], j, k, subpixelSizew, subpixelSizeh);
              noTint();
            }
          } 
          else if (id == 8) {
            int aRange = greenDark2.length;
            if (aRange > 0) {
              int tempIndex = randomArrayIndex(aRange);
              int imageIndex = greenDark2[tempIndex];
              image(pics[imageIndex], j, k, subpixelSizew, subpixelSizeh);
              noStroke();
              fill(sampleColor, tintValue);
              rect(j, k, subpixelSizew, subpixelSizeh);
            }  
            else {
              int tempIndex = randomArrayIndex(imageCount);
              tint(sampleColor);
              image(pics[tempIndex], j, k, subpixelSizew, subpixelSizeh);
              noTint();
            }
          } 
          else if (id == 9) {
            int aRange = greenMid.length;
            if (aRange > 0) {
              int tempIndex = randomArrayIndex(aRange);
              int imageIndex = greenMid[tempIndex];
              image(pics[imageIndex], j, k, subpixelSizew, subpixelSizeh);
              noStroke();
              fill(sampleColor, tintValue);
              rect(j, k, subpixelSizew, subpixelSizeh);
            } 
            else {
              int tempIndex = randomArrayIndex(imageCount);
              tint(sampleColor);
              image(pics[tempIndex], j, k, subpixelSizew, subpixelSizeh);
              noTint();
            }
          } 
          else if (id == 10) {
            int aRange = greenMid2.length;
            if (aRange > 0) {
              int tempIndex = randomArrayIndex(aRange);
              int imageIndex = greenMid2[tempIndex];
              image(pics[imageIndex], j, k, subpixelSizew, subpixelSizeh);
              noStroke();
              fill(sampleColor, tintValue);
              rect(j, k, subpixelSizew, subpixelSizeh);
            } 
            else {
              int tempIndex = randomArrayIndex(imageCount);
              tint(sampleColor);
              image(pics[tempIndex], j, k, subpixelSizew, subpixelSizeh);
              noTint();
            }
          }
          else if (id == 11) {
            int aRange = greenBright.length;
            if (aRange > 0) {
              int tempIndex = randomArrayIndex(aRange);
              int imageIndex = greenBright[tempIndex];
              image(pics[imageIndex], j, k, subpixelSizew, subpixelSizeh);
              noStroke();
              fill(sampleColor, tintValue);
              rect(j, k, subpixelSizew, subpixelSizeh);
            } 
            else {
              int tempIndex = randomArrayIndex(imageCount);
              tint(sampleColor);
              image(pics[tempIndex], j, k, subpixelSizew, subpixelSizeh);
              noTint();
            }
          } 
          else if (id == 12) {
            int aRange = greenBright2.length;
            if (aRange > 0) {
              int tempIndex = randomArrayIndex(aRange);
              int imageIndex = greenBright2[tempIndex];
              image(pics[imageIndex], j, k, subpixelSizew, subpixelSizeh);
              noStroke();
              fill(sampleColor, tintValue);
              rect(j, k, subpixelSizew, subpixelSizeh);
            } 
            else {
              int tempIndex = randomArrayIndex(imageCount);
              tint(sampleColor);
              image(pics[tempIndex], j, k, subpixelSizew, subpixelSizeh);
              noTint();
            }
          } 
          else if (id == 13) {
            int aRange = blueDark.length;
            if (aRange > 0) {
              int tempIndex = randomArrayIndex(aRange);
              int imageIndex = blueDark[tempIndex];
              image(pics[imageIndex], j, k, subpixelSizew, subpixelSizeh);
              noStroke();
              fill(sampleColor, tintValue);
              rect(j, k, subpixelSizew, subpixelSizeh);
            } 
            else {
              int tempIndex = randomArrayIndex(imageCount);
              tint(sampleColor);
              image(pics[tempIndex], j, k, subpixelSizew, subpixelSizeh);
              noTint();
            }
          } 
          else if (id == 14) {
            int aRange = blueDark2.length;
            if (aRange > 0) {
              int tempIndex = randomArrayIndex(aRange);
              int imageIndex = blueDark2[tempIndex];
              image(pics[imageIndex], j, k, subpixelSizew, subpixelSizeh);
              noStroke();
              fill(sampleColor, tintValue);
              rect(j, k, subpixelSizew, subpixelSizeh);
            } 
            else {
              int tempIndex = randomArrayIndex(imageCount);
              tint(sampleColor);
              image(pics[tempIndex], j, k, subpixelSizew, subpixelSizeh);
              noTint();
            }
          } 
          else if (id == 15) {
            int aRange = blueMid.length;
            if (aRange > 0) {
              int tempIndex = randomArrayIndex(aRange);
              int imageIndex = blueMid[tempIndex];
              image(pics[imageIndex], j, k, subpixelSizew, subpixelSizeh);
              noStroke();
              fill(sampleColor, tintValue);
              rect(j, k, subpixelSizew, subpixelSizeh);
            }  
            else {
              int tempIndex = randomArrayIndex(imageCount);
              tint(sampleColor);
              image(pics[tempIndex], j, k, subpixelSizew, subpixelSizeh);
              noTint();
            }
          } 
          else if (id == 16) {
            int aRange = blueMid2.length;
            if (aRange > 0) {
              int tempIndex = randomArrayIndex(aRange);
              int imageIndex = blueMid2[tempIndex];
              image(pics[imageIndex], j, k, subpixelSizew, subpixelSizeh);
              noStroke();
              fill(sampleColor, tintValue);
              rect(j, k, subpixelSizew, subpixelSizeh);
            }  
            else {
              int tempIndex = randomArrayIndex(imageCount);
              tint(sampleColor);
              image(pics[tempIndex], j, k, subpixelSizew, subpixelSizeh);
              noTint();
            }
          }
          else if (id == 17) {
            int aRange = blueBright.length;
            if (aRange > 0) {
              int tempIndex = randomArrayIndex(aRange);
              int imageIndex = blueBright[tempIndex];
              image(pics[imageIndex], j, k, subpixelSizew, subpixelSizeh);
              noStroke();
              fill(sampleColor, tintValue);
              rect(j, k, subpixelSizew, subpixelSizeh);
            } 
            else {
              int tempIndex = randomArrayIndex(imageCount);
              tint(sampleColor);
              image(pics[tempIndex], j, k, subpixelSizew, subpixelSizeh);
              noTint();
            }
          }
          else if (id == 18) {
            int aRange = blueBright2.length;
            if (aRange > 0) {
              int tempIndex = randomArrayIndex(aRange);
              int imageIndex = blueBright2[tempIndex];
              image(pics[imageIndex], j, k, subpixelSizew, subpixelSizeh);
              noStroke();
              fill(sampleColor, tintValue);
              rect(j, k, subpixelSizew, subpixelSizeh);
            } 
            else {
              int tempIndex = randomArrayIndex(imageCount);
              tint(sampleColor);
              image(pics[tempIndex], j, k, subpixelSizew, subpixelSizeh);
              noTint();
            }
          }
        }
      }
    }
  }

delay(100);
}



int randomArrayIndex(int range) {
  int index;
  index = int(random(range));

  return index;
}

