Interface graphic = new Interface();
PFont f;
void configure(){
  
}

void setup(){
  background(0);
  size(800, 600);
  f = createFont("Anton-Regular.ttf",21, true);
  textAlign(CENTER);
}

void draw(){
  background(0);
  textFont(f,21);
  
  graphic.mostra();
  
}

void mouseClicked(){
  graphic.seleciona();
  graphic.mostra();
  
 
}

void mousePressed(){
  
  
}

void mouseReleased(){
  
  
 
}