// Constants
int Y_AXIS = 1;
int X_AXIS = 2;
color b1 = color(42,11,88);
color b2 = color(51,0,102);
color b3 = color(255, 102, 0);
color [] colores ={
  color(42,11,88), // el que llega
  color(255, 102, 0), // el que se va
  //
  color(0, 0, 0),
  color(255, 102, 100),  
  //
  color(255),    
  color(255, 0, 100)  
};
float v= 2;
float corte1 = 0;
float corte2 = height;
int color_index = 0;
//,corte2,corte3;

void setup() {
  size(1200, 700);
  frameRate(60);
  // Define colors 
  noFill();
}
color set_color(int index) {
//  println(index+"-"+red(colores[index])+","+green(colores[index]));
  return(colores[index]);

}

color average_color (color c1,color c2){
    color c3 = lerpColor(c1, c2, .5);
    return(color(c3));
}

void draw() {
  if (color_index != colores.length){

    //setGradient(0,1, width, corte1, set_color(color_index), set_color(color_index+1), Y_AXIS);
    //setGradient(0,int(corte1), width, height-corte1, set_color(color_index+1),set_color(color_index+2),Y_AXIS);    

    setGradient(0,1, width, corte1, set_color(color_index), average_color(set_color(color_index),set_color(color_index+1)), Y_AXIS);
    setGradient(0,int(corte1), width, height-corte1, average_color(set_color(color_index),set_color(color_index+1)),set_color(color_index+1),Y_AXIS);    

//guides
//    rect(0,0, width, corte1);
//    rect(0,corte1,width,height-corte1);

    // check gradient size
    //print(color_index);
    if(corte1>height+height/2){
      corte1= 0;
      corte2= 0;
      color_index += 2;              
    
    }else{
      corte1+= v;
      corte2-= v;
    }
  }else{
    color_index = 0;
  }  



}
void setGradient(int x, int y, float w, float h, color c1, color c2, int axis ) {
  noFill();
  if (axis == Y_AXIS) {  // Top to bottom gradient
    for (int i = y; i <= y+h; i++) {
      float inter = map(i, y, y+h, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(x, i, x+w, i);
    }
  }  
  else if (axis == X_AXIS) {  // Left to right gradient
    for (int i = x; i <= x+w; i++) {
      float inter = map(i, x, x+w, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(i, y, i, y+h);
    }
  }
}