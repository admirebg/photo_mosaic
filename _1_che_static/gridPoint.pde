class gridPoint{
 int num = 16;
 int[] xpos0 = new int[num];   //xpos0[1], xpos0[2], xpos0[3], xpos0[4]
 int[] xpos1 = new int[num];
 int[] xpos2 = new int[num];
 int[] xpos3 = new int[num];
 
 int[] ypos0 = new int[num];
 int[] ypos1 = new int[num];
 int[] ypos2 = new int[num];
 int[] ypos3 = new int[num];

 int[] dis0 = new int[num];
 int[] dis1 = new int[num];
 int[] dis2 = new int[num];
 int[] dis3 = new int[num];

  gridPoint(int a){
    
    for(int i=0; i<num; i++){
   
   xpos0[i] = a;
   xpos1[i] = a;
   xpos2[i] = a;
   xpos3[i] = a;

   ypos0[i] = a;
   ypos1[i] = a;
   ypos2[i] = a;
   ypos3[i] = a;

   dis0[i] = a;
   dis1[i] = a;
   dis2[i] = a;
   dis3[i] = a;

    }
    
  }

  void distance(int x2, int y2, int i){

    int dx0 = abs(x2-xpos0[i]);
    int dy0 = abs(y2-ypos0[i]);
    dis0[i] = dx0+dy0;  
    int dx1 = abs(x2-xpos1[i]);
    int dy1 = abs(y2-ypos1[i]);
    dis1[i] = dx1+dy1;  
    int dx2 = abs(x2-xpos2[i]);
    int dy2 = abs(y2-ypos2[i]);
    dis2[i] = dx2+dy2;  
    int dx3 = abs(x2-xpos3[i]);
    int dy3 = abs(y2-ypos3[i]);
    dis3[i] = dx3+dy3;  

  }
}
