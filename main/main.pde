UI ui = new UI();
Objeto obj = new Objeto();
Divergente d = new Divergente();
Convergente c = new Convergente();
Luz luz = new Luz(obj);
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
  if(ui.lente){
    if(ui.convergente){
      c.espelhado = false;
      c.tipo = ui.opcao;
    }else{
      d.espelhado = false;
      d.tipo = ui.opcao;
    }
  }else{
     if(ui.convergente){
       luz.configura(c);
       c.espelhado = true;
       c.tipo = 0;
       luz.retaParalela();
     }else{
       luz.configura(d);
       d.espelhado = true;
       d.tipo = 0;
       luz.retaParalela();
     }
  }
  
  if(ui.convergente) c.mostra();
  else d.mostra();
  
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