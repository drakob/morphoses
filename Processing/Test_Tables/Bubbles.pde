// bubbles to represent each piece of data

class Bubble{
  float x,y;
  float size;
  
  
  Bubble(float x_, float y_,float size_){
    x = x_;
    y = y_;
    size = size_;
  }
  
  void setSize(float s){
    size = s;
  }
  
  void display(){
    stroke(0);
    strokeWeight(2);
    fill(0,140);
    ellipse(x,y,size,size);
  }
}
