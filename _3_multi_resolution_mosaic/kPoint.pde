
class kPoint{
  
  int num = 25;
  int[] closestValue = new int[num]; 
  int[] closestX = new int[num];
  int[] closestY = new int[num];
  
  int[] data = new int[num];
  int[] dataX = new int[num];
  int[] dataY = new int[num];

  int[] avgZ = new int[num];
  int[] avgX = new int[num];
  int[] avgY = new int[num];

  kPoint(int a, int b){
    
    for(int i=0; i<num; i++){
       closestValue[i] = a;
       closestX[i] = b;
       closestY[i] = b;
       
       data[i] = b;
       dataX[i] = b;
       dataY[i] = b;
       
       avgZ[i] = b;
       avgX[i] = b;
       avgY[i] = b;
    }
  }
  
}

//----------------------------------------------------------

void drawkPoints()
{
  
  kinect.update();

 for(int y=0; y<480; y+= cloGridh)
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
      int depthValues[] = kinect.depthMap(); 
       
       
     for(int yy = y+40; yy < y+cloGridh-40; yy++)
     {
       for(int xx = x+40; xx < x+cloGridw-40; xx++ )
       {
   
      
    int p = xx+yy*640;
    int currentDepthValue = depthValues[p];
    
    if(currentDepthValue >0 && currentDepthValue <  kpoints.closestValue[i])
    {
       kpoints.closestValue[i] = currentDepthValue;
       kpoints.closestX[i] = xx;
       kpoints.closestY[i] = yy;
    }
              
    
       }
     }
     
          
   }
}

  
//----------------------------------------------- 스크린 한번 돌았음.

   for(int i=0; i<kpoints.num; i++){
     kpoints.data[i] = kpoints.data[i]+kpoints.closestValue[i];
        kpoints.dataX[i] = kpoints.dataX[i]+kpoints.closestX[i];
        kpoints.dataY[i] = kpoints.dataY[i]+kpoints.closestY[i];
     //  println(kpoints.closestValue[i]);
   }
   
     datacount++;
     
         if(datacount == datanum){
         
         //println("reset!");
         for(int i=0; i<kpoints.num; i++){
         kpoints.avgZ[i] = kpoints.data[i]/10;  
         kpoints.avgX[i] = kpoints.dataX[i]/10;  
         kpoints.avgY[i] = kpoints.dataY[i]/10;  
         

  
         kpoints.data[i]= 0;
         kpoints.dataX[i] =0;
         kpoints.dataY[i] =0;
         }
         
         datacount = 0;
       }
    
 //   PImage depthImage = kinect.depthImage();
 //   image(depthImage, 0, 0);

  
  //  for(int k=0; k< kpoints.num ; k++){
   // ellipse(closestX, closestY, 400 - (closestValue/10), 400  - (closestValue/10));
    
    
    //fill(0,255,0);
    //int rad = round(map(round(kpoints.avgZ[k]), 800, 3400, 50, 10));
    
    //ellipse(kpoints.avgX[k], kpoints.avgY[k], rad, rad);
    
   // textAlign(LEFT, TOP);
   // textSize(10);
   // noStroke();
  
      //String c = kpoints.avgZ[k] +", " +k;
      //fill(255);
      //rect(kpoints.avgX[k], kpoints.avgY[k], textWidth(c) + 3, textAscent() + textDescent() + 3);
     // fill(255,0,0);
     // text(c, kpoints.avgX[k]+2, kpoints.avgY[k]+2);
      
 //  println("kpoints.avgZ["+ k+ "]: " + kpoints.avgZ[k] + " ( "+ kpoints.avgX[k] + ", " +kpoints.avgY[k]+ " ) ");
    //println("kpoints.avgZ["+ k+ "]: " + kpoints.avgZ[k]);
 //   }

   
   
    
  // for(int k=0; k< kpoints.num ; k++){
   // ellipse(closestX, closestY, 400 - (closestValue/10), 400  - (closestValue/10));
    //fill(0,255,0);
    //int rad = round(map(round(kpoints.closestValue[k]), 800, 1700, 50, 10));
    //ellipse(kpoints.closestX[k], kpoints.closestY[k], rad, rad);
    
  //  println("closestValue["+ k+ "]: " + kpoints.closestValue[k] + " ( "+ kpoints.closestX[k] + ", " +kpoints.closestY[k]+ " ) ");

  //  } 
    
}



