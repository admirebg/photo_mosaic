

int sortImages(color avC, float avB) {
  float r = red(avC);
  float g = green(avC);
  float b = blue(avC);
  int value = 0;

  if (r > g && r > b) {
    if (avB >=0 && avB <= 42) {
      value = 1;

    } 
    else if (avB > 42 && avB<= 85) {
      value = 2;

    } 
    else if (avB > 85 && avB <= 127){
      value = 3;

    }
    else if (avB > 127 && avB <= 170){
      value = 4;
    }
    else if (avB > 170 && avB <= 210){
      value = 5;
    }
    else if (avB > 210){
      value = 6;
    }

  } 

  else if (g > r && g > b) {
    if (avB >=0 && avB <= 42) {
      value = 7;

    } 
    else if (avB > 42 && avB<= 85) {
      value = 8;

    } 
    else if (avB > 85 && avB <= 127){
      value = 9;

    }
    else if (avB > 127 && avB <= 170){
      value = 10;
    }
    else if (avB > 170 && avB <= 210){
      value = 11;
    }
    else if (avB > 210){
      value = 12;
    }

  } 
  else if (b >r && b > g) {
    if (avB >=0 && avB <= 42) {
      value = 13;

    } 
    else if (avB > 42 && avB<= 85) {
      value = 14;

    } 
    else if (avB > 85 && avB <= 127){
      value = 15;

    }
    else if (avB > 127 && avB <= 170){
      value = 16;
    }
    else if (avB > 170 && avB <= 210){
      value = 17;
    }
    else if (avB > 210){
      value = 18;
    }
  }
  return value;
}

