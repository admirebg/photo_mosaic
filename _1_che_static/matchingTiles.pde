int[] ids = new int[8000]; //dim_max*dim_max*8*8; id:0~18.
int[] z = new int[8000]; 
//boolean a = true; 

void matchingTiles( int w, int h){

     int gridw = w;
     int gridh = h;
     //int i = 0;
     int e =0;
         for (int k = 0; k < height; k += gridh) {
           for (int j = 0; j < width; j += gridw) {
          
          //println(gridh);
          PImage mosaicPixel = get(j, k, gridw, gridh);
          color sampleColor = averageColor(mosaicPixel);
          float sampleBrightness = averageBrightness(mosaicPixel);
          int id = sortImages(sampleColor, sampleBrightness);
         ids[e] = id;
         // println(e);
          e++;  
           } 
            
      }
    }  


void drawImage(int gridhh, int gridww){

  int gridh = gridhh;
  int gridw = gridww;
  int e = 0;
  
         for (int k = 0; k < height; k += gridh) {
           for (int j = 0; j < width; j += gridw) {
             
                int id = ids[e];
                
               /* if(e % 2 != 0){
                   z[e] = 0;
                }

                else{
                z[e] = 0; }
                */
                
            pushMatrix();
            translate(j+(gridw/2),k+(gridh/2),0);      
            //rotateY(radians(rxoffset));
            //rotateX(radians(ryoffset*2));
            
            if(j > width/2 && k > height/2){ 
             //rotateY(radians(30));
             rotateY(radians(rxoffset));
             rotateX(radians(ryoffset));
            }
             else if(j < width/2 && k > height/2){ 
             //rotateY(radians(30));
             rotateY(-radians(rxoffset));
             rotateX(radians(ryoffset));
            }
            else if(j < width/2 && k < height/2){ 
             //rotateY(radians(30));
             rotateY(-radians(rxoffset));
             rotateX(-radians(ryoffset));
            }
             else{ 
             //rotateY(radians(30));
             rotateY(radians(rxoffset));
             rotateX(-radians(ryoffset));
            }
           //rotateX(radians(30));
          
           imageMode(CENTER);
           
          if (id == 0) {
            int tempIndex = randomArrayIndex(imageCount);
          //  tint(sampleColor);
            image(pics[tempIndex], 0, 0, gridw, gridh);
            noTint();
          } 
          else if (id == 1) {
            int aRange = redDark.length;
            if (aRange > 0) {
              int tempIndex = randomArrayIndex(aRange);
              int imageIndex = redDark[tempIndex];
               image(pics[tempIndex], 0, 0, gridw, gridh);

             // noStroke();
             // fill(sampleColor, tintValue);
             // rect( j, k, gridw, gridh);
            } 
            else {
              int tempIndex = randomArrayIndex(imageCount);
            //  tint(sampleColor);
            image(pics[tempIndex], 0, 0, gridw, gridh);
              noTint();
            }
          } 
          else if (id == 2) {
            int aRange = redDark2.length;
            if (aRange > 0) {
              int tempIndex = randomArrayIndex(aRange);
              int imageIndex = redDark2[tempIndex];
              image(pics[imageIndex], 0, 0, gridw, gridh);

             // noStroke();
             // fill(sampleColor, tintValue);
             // rect( j, k, gridw, gridh);
            } 
            else {
              int tempIndex = randomArrayIndex(imageCount);
             // tint(sampleColor);
              image(pics[tempIndex], 0, 0, gridw, gridh);
           
              noTint();
            }
          }
          else if (id == 3) {
            int aRange = redMid.length;
            if (aRange > 0) {
              int tempIndex = randomArrayIndex(aRange);
              int imageIndex = redMid[tempIndex];
              image(pics[imageIndex], 0, 0, gridw, gridh);

             // noStroke();
             // fill(sampleColor, tintValue);
             // rect( j, k, gridw, gridh);
            } 
            else {
              int tempIndex = randomArrayIndex(imageCount);
             // tint(sampleColor);
              image(pics[tempIndex], 0, 0, gridw, gridh);

              noTint();
            }
          } 
          else if (id == 4) {
            int aRange = redMid2.length;
            if (aRange > 0) {
              int tempIndex = randomArrayIndex(aRange);
              int imageIndex = redMid2[tempIndex];
              image(pics[imageIndex], 0, 0, gridw, gridh);

             // noStroke();
             // fill(sampleColor, tintValue);
             // rect(j, k, gridw, gridh);
            } 
            else {
              int tempIndex = randomArrayIndex(imageCount);
              //tint(sampleColor);
              image(pics[tempIndex], 0, 0, gridw, gridh);
              noTint();
            }
          }
          else if (id == 5) {
            int aRange = redBright.length;
            if (aRange > 0) {
              int tempIndex = randomArrayIndex(aRange);
              int imageIndex = redBright[tempIndex];
              image(pics[imageIndex], 0, 0, gridw, gridh);

              //noStroke();
              //fill(sampleColor, tintValue);
              //rect(j, k, gridw, gridh);
            }  
            else {
              int tempIndex = randomArrayIndex(imageCount);
              //tint(sampleColor);
              image(pics[tempIndex], 0, 0, gridw, gridh);

              noTint();
            }
          } 
          else if (id == 6) {
            int aRange = redBright2.length;
            if (aRange > 0) {
              int tempIndex = randomArrayIndex(aRange);
              int imageIndex = redBright2[tempIndex];
              image(pics[imageIndex], 0, 0, gridw, gridh);

              //noStroke();
              //fill(sampleColor, tintValue);
              //rect(j, k, gridw, gridh);
            }  
            else {
              int tempIndex = randomArrayIndex(imageCount);
              //tint(sampleColor);
              image(pics[tempIndex], 0, 0, gridw, gridh);

              noTint();
            }
          } 
          else if (id == 7) {
            int aRange = greenDark.length;
            if (aRange > 0) {
              int tempIndex = randomArrayIndex(aRange);
              int imageIndex = greenDark[tempIndex];
              image(pics[imageIndex], 0, 0, gridw, gridh);

              //noStroke();
              //fill(sampleColor, tintValue);
              //rect(j, k, gridw, gridh);
            }  
            else {
              int tempIndex = randomArrayIndex(imageCount);
              //tint(sampleColor);
              image(pics[tempIndex], 0, 0, gridw, gridh);

              noTint();
            }
          } 
          else if (id == 8) {
            int aRange = greenDark2.length;
            if (aRange > 0) {
              int tempIndex = randomArrayIndex(aRange);
              int imageIndex = greenDark2[tempIndex];
              image(pics[imageIndex], 0, 0, gridw, gridh);

              //noStroke();
              //fill(sampleColor, tintValue);
              //rect(j, k, gridw, gridh);
            }  
            else {
              int tempIndex = randomArrayIndex(imageCount);
            //  tint(sampleColor);
              image(pics[tempIndex], 0, 0, gridw, gridh);

              noTint();
            }
          } 
          else if (id == 9) {
            int aRange = greenMid.length;
            if (aRange > 0) {
              int tempIndex = randomArrayIndex(aRange);
              int imageIndex = greenMid[tempIndex];
              image(pics[imageIndex], 0, 0, gridw, gridh);

             // noStroke();
             // fill(sampleColor, tintValue);
             // rect(j, k, gridw, gridh);
            } 
            else {
              int tempIndex = randomArrayIndex(imageCount);
             // tint(sampleColor);
              image(pics[tempIndex], 0, 0, gridw, gridh);


            }
          } 
          else if (id == 10) {
            int aRange = greenMid2.length;
            if (aRange > 0) {
              int tempIndex = randomArrayIndex(aRange);
              int imageIndex = greenMid2[tempIndex];
              image(pics[imageIndex], 0, 0, gridw, gridh);

            //  noStroke();
            //  fill(sampleColor, tintValue);
            //  rect(j, k, gridw, gridh);
            } 
            else {
              int tempIndex = randomArrayIndex(imageCount);
            //  tint(sampleColor);
              image(pics[tempIndex], 0, 0, gridw, gridh);

            }
          }
          else if (id == 11) {
            int aRange = greenBright.length;
            if (aRange > 0) {
              int tempIndex = randomArrayIndex(aRange);
              int imageIndex = greenBright[tempIndex];
              image(pics[imageIndex], 0, 0, gridw, gridh);

             // noStroke();
            //  fill(sampleColor, tintValue);
           //   rect(j, k, gridw, gridh);
            } 
            else {
              int tempIndex = randomArrayIndex(imageCount);
           //   tint(sampleColor);
              image(pics[tempIndex], 0, 0, gridw, gridh);

            }
          } 
          else if (id == 12) {
            int aRange = greenBright2.length;
            if (aRange > 0) {
              int tempIndex = randomArrayIndex(aRange);
              int imageIndex = greenBright2[tempIndex];
              image(pics[imageIndex], 0, 0, gridw, gridh);

            //  noStroke();
            //  fill(sampleColor, tintValue);
            //  rect(j, k, gridw, gridh);
            } 
            else {
              int tempIndex = randomArrayIndex(imageCount);
             // tint(sampleColor);
              image(pics[tempIndex], 0, 0, gridw, gridh);

            }
          } 
          else if (id == 13) {
            int aRange = blueDark.length;
            if (aRange > 0) {
              int tempIndex = randomArrayIndex(aRange);
              int imageIndex = blueDark[tempIndex];
              image(pics[imageIndex], 0, 0, gridw, gridh);

             // noStroke();
             // fill(sampleColor, tintValue);
            //  rect(j, k, gridw, gridh);
            } 
            else {
              int tempIndex = randomArrayIndex(imageCount);
            //  tint(sampleColor);
              image(pics[tempIndex], 0, 0, gridw, gridh);

            }
          } 
          else if (id == 14) {
            int aRange = blueDark2.length;
            if (aRange > 0) {
              int tempIndex = randomArrayIndex(aRange);
              int imageIndex = blueDark2[tempIndex];
              image(pics[imageIndex], 0, 0, gridw, gridh);

            //  noStroke();
            //  fill(sampleColor, tintValue);
            //  rect(j, k, gridw, gridh);
            } 
            else {
              int tempIndex = randomArrayIndex(imageCount);
            //  tint(sampleColor);
              image(pics[tempIndex], 0, 0, gridw, gridh);

            }
          } 
          else if (id == 15) {
            int aRange = blueMid.length;
            if (aRange > 0) {
              int tempIndex = randomArrayIndex(aRange);
              int imageIndex = blueMid[tempIndex];
              image(pics[imageIndex], 0, 0, gridw, gridh);

            //  noStroke();
            //  fill(sampleColor, tintValue);
           //   rect(j, k, gridw, gridh);
            }  
            else {
              int tempIndex = randomArrayIndex(imageCount);
           //   tint(sampleColor);
              image(pics[tempIndex], 0, 0, gridw, gridh);
  
            }
          } 
          else if (id == 16) {
            int aRange = blueMid2.length;
            if (aRange > 0) {
              int tempIndex = randomArrayIndex(aRange);
              int imageIndex = blueMid2[tempIndex];
              image(pics[imageIndex], 0, 0, gridw, gridh);

             // noStroke();
            //  fill(sampleColor, tintValue);
           //   rect(j, k, gridw, gridh);
            }  
            else {
              int tempIndex = randomArrayIndex(imageCount);
           //   tint(sampleColor);
              image(pics[tempIndex], 0, 0, gridw, gridh);

            }
          }
          else if (id == 17) {
            int aRange = blueBright.length;
            if (aRange > 0) {
              int tempIndex = randomArrayIndex(aRange);
              int imageIndex = blueBright[tempIndex];
              image(pics[imageIndex], 0, 0, gridw, gridh);

            //  noStroke();
            //  fill(sampleColor, tintValue);
            //  rect(j, k, gridw, gridh);
            } 
            else {
              int tempIndex = randomArrayIndex(imageCount);
           //   tint(sampleColor);
              image(pics[tempIndex], 0, 0, gridw, gridh);

            }
          }
          else if (id == 18) {
            int aRange = blueBright2.length;
            if (aRange > 0) {
              int tempIndex = randomArrayIndex(aRange);
              int imageIndex = blueBright2[tempIndex];

              image(pics[imageIndex], 0, 0, gridw, gridh);

             // noStroke();
            //  fill(sampleColor, tintValue);
           //   rect(j, k, gridw, gridh);
            } 
            else {
              int tempIndex = randomArrayIndex(imageCount);
           //   tint(sampleColor);

              image(pics[tempIndex], 0, 0, gridw, gridh);
                          

            }   
           }
           e++;
            popMatrix();
              }  
           }
           
      }
              
