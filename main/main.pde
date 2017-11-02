Interface ui = new Interface();
Objeto obj = new Objeto();
PFont f;

void setup(){
  background(0);
  size(800, 600);
  f = createFont("Anton-Regular.ttf",21, true);
  textAlign(CENTER);
}



void draw(){
  background(0);
  textFont(f,21);
  
  //linha horizontal
  line(0, height/2, width, height/2);
  //linha vertical
  line(width/2, 0, width/2, height);
  
  ui.mostra();
  obj.mostra();
}


void mouseDragged(){
  obj.move();
  obj.redimensiona();
  
}

void mousePressed(){
  ui.seleciona();
  obj.editando();
  obj.movendo();
}

void mouseReleased(){
  if(obj.edit) obj.edit = false;
  
  if(obj.mov) obj.mov = false;
 
}