color averageColor(PImage picture) {
  float r = 0;
  float g = 0;
  float b = 0;

  for(int i = 0; i < picture.pixels.length; i++){
    r += red(picture.pixels[i]);
    g += green(picture.pixels[i]);
    b += blue(picture.pixels[i]);
  }
  r = r / picture.pixels.length;
  g = g / picture.pixels.length;
  b = b / picture.pixels.length;

  color aColor = color(r,g,b);

  return aColor;
}

float averageBrightness(PImage picture) {
  float b=0;

  for(int i = 0; i < picture.pixels.length; i++){
    b += brightness(picture.pixels[i]);
  }
  b = b/picture.pixels.length;

  return b;
}
