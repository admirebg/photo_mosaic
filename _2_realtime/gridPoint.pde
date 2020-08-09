class gridPoint{
 int num = 100;
 int[] xpos = new int[num];
 int[] ypos = new int[num];
 int[] dis = new int[num];

  gridPoint(int a){
    
    for(int i=0; i<num; i++){
   xpos[i] = a;
   ypos[i] = a;
   dis[i] = a;
    }
    
  }

  void distance(int x2, int y2, int i){

    int dx = abs(x2-xpos[i]);
    int dy = abs(y2-ypos[i]);
    dis[i] = dx+dy;  

  }
}
