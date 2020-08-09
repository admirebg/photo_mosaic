//alt f4

//boolean uvzero = true;
float xmouse,ymouse;
float rxoffset,ryoffset;
float xoffset,yoffset;


PImage img;
//int imageCount = 1627;
int imageCount = 1627;
int i=0;
int gridw = 0;    
int gridh = 0;
int t=0;
int grid_dim = 40; //60;
//int[] ids = new int[(grid_dim*grid_dim)+]; 
//float xmouse;
//float rxoffset;
boolean gridinit = true;
boolean idinit = true;
//
kPoint kpoints = new kPoint(1600, 4000, 0, 0);  //ave, closestValue, x, y
gridPoint gpoints = new gridPoint(0);
//
int kDim = 4;
int cloGridw = 640/kDim;
int cloGridh = 480/kDim;
int[] cloPoints = new int[kDim*kDim];

//
int avr_min = 0;
int avr_max = 3000;
//int dim_min = 10; 4 1     ,  1(sq v.) , 1(sqrt v.)
//int dim_max = 30; 24 20   ,  5(sq v.) , 200(sqrt v.) 
int dis_min = 0;
int dis_max =150;

int dim_min = 2;
int dim_max = 2;


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
  int size_w =1920;
  int size_h =1080;
  size(size_w, size_h, P3D);
 
   xoffset = width/2;
   yoffset = height/2;
   
  frameRate(36);
  frame.setLocation(0, 0);
 //ortho(-width/2,width/2,-height/2,height/2,-200,200);
  ortho(-width/2,width/2,-height/2,height/2,-200,200);

  // disable mirror

  img = loadImage("che_2.jpg");   
 // img = loadImage("roy1.jpg");   
 //img = loadImage("GirlPearlEarring.jpg");     
  //img = loadImage("manet_3.jpg");

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
//  background(0);
  image(img, 0, 0, width, height); 
  loadPixels();
  gridw = int(width/grid_dim);    
  gridh = int(height/grid_dim);
  
 // println(img.width +", "+ img.height);
     matchingTiles(gridw, gridh);
  
  
// noLoop();
}


void draw() {

 // context.update();

  //PImage img = context.rgbImage();

  
 //PImage depthImage = kinect.depthImage();
 //image(depthImage, 0, 0);
 
//  xmouse = mouseX - width/2;
//  rxoffset = lerp(rxoffset,xmouse/30,0.1);
//
// rotateY(radians(rxoffset));

//////////////////////////////////////

/* for(int y=0; y<480; y+= cloGridh)
{ 
   for(int x=0; x<640; x+= cloGridw)
   {
        if (y==0 && x==0) {  
        i = 0; //0
      } else{      
        i = (x/cloGridw) + kDim*(y/cloGridh); // i: 0-15
     
    }
      
      kpoints.closestValue[i] = 4000;
      kpoints.closestX[i] = 0;
      kpoints.closestY[i] = 0;
      int depthValues[] = context.depthMap(); 
      int sum =0;
      
     for(int yy = y; yy < y+cloGridh; yy++)
     {
       for(int xx = x; xx < x+cloGridw; xx++ )
       {
      
    int p = xx+yy*640;
    sum = sum + depthValues[p];
    int currentDepthValue = depthValues[p];
    
    if(currentDepthValue >0 && currentDepthValue <  kpoints.closestValue[i])
    {
       kpoints.closestValue[i] = currentDepthValue;
       kpoints.closestX[i] = xx;
       kpoints.closestY[i] = yy;
    }
    
       }
     }
     
  //키넥트와 화면해상도 간 좌표값 변환.  
  kpoints.closestX[i] = kpoints.closestX[i] * width/640;
  kpoints.closestY[i] = kpoints.closestY[i] * height/480;
  
 // println(kpoints.closestX[i] +" "+kpoints.closestY[i]);
  
      if(sum == 0){ 
     kpoints.avrValue[i] = 3000;
     }
    else{
    kpoints.avrValue[i] = sum / (cloGridh * cloGridw);
    //println(kpoints.avrValue[i]);
     }
  
    //visualization
   // fill(255,0,0);
  //  int rad = round(map(kpoints.avrValue[i], 30, 3000, 70, 10));
   
   // ellipse(x+80, y+60, rad, rad);  //8x8
    
   }
}
  
   // for(int k=0; k< kpoints.num ; k++){

  //  println("closestValue["+ k+ "]: " + kpoints.closestValue[k] + " ( "+ kpoints.closestX[k] + ", " +kpoints.closestY[k]+ " ) ");

  //  }
    */
//////////////////////////////////////
  //  xmouse = (mouseX - xoffset);
  //   ymouse = mouseY - yoffset;
   //xmouse = xoffset;
  // ymouse = yoffset;
   
 //rxoffset = lerp(rxoffset,xmouse/30,0.1);
 //ryoffset = lerp(ryoffset,ymouse/30,0.1);
// rxoffset = lerp(rxoffset,xmouse/10,0.1);
// ryoffset = lerp(ryoffset,ymouse/10,0.1);
  //loadPixels();
  
 //background(255);
// translate(0,0,0);
 drawImage(gridh, gridw);
 
// pushMatrix();
// translate(0,0,200);
 //fill(0,0,0);
// ellipse(width/2, height/2, 10, 10);  
// popMatrix();
 
 delay(200);
}



int randomArrayIndex(int range) {
  int index;
  index = int(random(range));

  return index;
}

