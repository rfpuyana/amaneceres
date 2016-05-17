//The lerpColor() function is useful for interpolating between two colors.


// Constants
int Y_AXIS = 1;
int X_AXIS = 2;

color b1 = color(42,11,88);
color b2 = color(51,0,102);
color b3 = color(255, 102, 0);



color [] colores ={
  color(42,11,88), // new arriving
  color(51,0,102),  // line moving in the middle  
  color(255, 102, 0) // el que se va
  //
  color(255, 102, 0),
  color(0,0,20),
  color(42,11,88)
  //
  color(42,11,88),
  color(42,11,88),
  color(42,11,88),  
  
};



float v= 1;
float corte1 = 0;
float corte2 = height;
int color_index = 0;
//,corte2,corte3;

void setup() {
  size(640, 360);
  frameRate(60);
  // Define colors 
  noFill();
}

color set_color(int index) {
  return(colores[index]);
}

void draw() {
  // 2 gradients    
  setGradient(0,0, width, corte1, set_color(0), set_color(color_index+1), Y_AXIS);
  setGradient(0,int(corte1), width, height-corte1, set_color(color_index+1),set_color(color_index+2),Y_AXIS);
  //guides
  rect(0,0, width, corte1);
  rect(0,corte1,width,height-corte1);
  // check gradient size
  if(corte1>height){
    corte1= 0;
    corte2= 0;
    color_index += 3;
  }else{
    corte1+= v;
    corte2-= v;
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