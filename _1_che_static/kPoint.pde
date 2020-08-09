class kPoint{
  
  int num = 16;
  int[] avrValue = new int[num]; 
  int[] closestValue = new int[num]; 
  int[] closestX = new int[num];
  int[] closestY = new int[num];
  
  kPoint(int k,int a, int b, int c){
    
    for(int i=0; i<num; i++){
       avrValue[i] = k;
       closestValue[i] = a;
       closestX[i] = b;
       closestY[i] = c;
    }
  }
  
}


