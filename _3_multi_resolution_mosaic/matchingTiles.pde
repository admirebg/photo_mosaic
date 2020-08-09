     
     
     void matchingTiles(int j, int k, int subpixelSizew, int subpixelSizeh){
     
          int subpixelSizeww=  int(subpixelSizew * 640/width);
          int subpixelSizehh =  int(subpixelSizeh * 480/height);
          int jj=  int(j * 640/width);
          int kk =  int(k * 480/height);
          
          //println(subpixelSizeh);
          PImage mosaicPixel = img.get(jj, kk, subpixelSizeww, subpixelSizehh);
          color sampleColor = averageColor(mosaicPixel);
          float sampleBrightness = averageBrightness(mosaicPixel);
          int id = sortImages(sampleColor, sampleBrightness);
          // println(id);


         // fill(sampleColor);
         // noStroke();
         // rect(j, k, subpixelSizew, subpixelSizeh);
          //image(pics[0], 0, 0);  // sub-image road 여부 확인. 
          int col = sampleColor & 0xFF;   
          //int index = (v/subpixelSizeh) + (u/subpixelSizew*dim); // index: 0-255
          // main_avg[index] = col; 
          //println(col);
          
          tint(255,255,255,100);
        
  
  
        //  int  j=int(jj * width/640);
        //  int  k = int(kk * height/480);
          
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
              int tempIndex =randomArrayIndex(aRange);
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
     
 //-----------------------------------------
 
  int randomArrayIndex(int range) {
  int index;
  index = int(random(range));
  return index;
}


