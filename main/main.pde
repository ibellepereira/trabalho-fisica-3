UI ui;
Objeto obj; 
Lente lente;
Luz luz;

void setup(){
  background(0);
  // size(800, 600);
  size(1280, 720);
  
  //obj = new Objeto(loadImage("darwin3.png"));
  obj = new Objeto(null);
  PFont f = createFont("Anton-Regular.ttf",21, true);
  ui = new UI(f);
  lente = new Lente();
  luz = new Luz(obj, lente);
  
  imageMode(CENTER);
  textAlign(CENTER);
}

void draw(){  
  update();
  background(0);
  stroke(255);
  strokeWeight(1);
  //linha horizontal
  line(0, height/2, width, height/2);
  
  //linha vertical
  //line(width/2, 0, width/2, height);
  ui.mostra();
  obj.mostra();
  lente.mostra();
  luz.mostra();
  ui.info(lente, obj, luz.i);

}

void mouseDragged(){
  obj.redimensiona();
  obj.move();
}

void mousePressed(){
  obj.redimensionando(); 
  obj.movendo();
}

void mouseClicked(){
 ui.controle(); 
}

void update(){
 lente.convergente = ui.convergente;
 lente.espelhado = !ui.lente;
 lente.tipo = ui.opcao;
  
}