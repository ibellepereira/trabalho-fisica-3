class Objeto{
  int posX;
  int posY;
  int largura;
  int altura;
  
  boolean redimen;
  boolean move;
  
  PImage img;
  
  Objeto(PImage img){
    posX = 100;
    posY = height/2;
    
    largura = 5;
    altura = 100;
    
    redimen = move = false;
    this.img = img;
    
    if(img != null) largura = img.width;
  }
  
  void mostra(){
    int marcador = 0;
      
    if(marcador > 0){
      styleMarcador();
      line(posX, posY - marcador, posX, posY);
    }
      
    if(img==null){ //se não houver imagem
      style();
      rect(posX - largura/2, posY - altura - marcador, largura, altura);
      
    }else{ //se tiver imagem
      img = loadImage("darwin3.png");
      img.resize(0, altura);
      img.filter(THRESHOLD, 0.65);
      image(img, posX, centroY() - marcador);
    }
  }
  
  void redimensionando(){
    if((mouseX > centroX()-largura/2 && mouseX < centroX()+largura/2) && (mouseY >= centroY() - altura/2 && mouseY <= centroY() - altura/2 + 10)){
      redimen = true;
    }else{ 
      redimen = false;
    } 
  }
  
  void redimensiona(){
    if(redimen){
      int tam;
      tam = height/2 - mouseY;
      if(tam > 0) altura = tam;
    }    
  }
  
  void movendo(){
     if((mouseX > centroX()-largura/2 && mouseX < centroX()+largura/2) && (mouseY >= centroY() - altura/2+10 && mouseY <= posY)){
      move = true;
    }else{ 
      move = false;
    }    
  }
  
  void move(){
    if(move){
      int desloca;
  
      desloca = mouseX;   
      
      if(img != null) 
        largura = img.width;
      
      if(desloca > largura/2) 
        posX = desloca;
    }    
  }
  
  int centroX(){
    if(img == null)
      return posX+largura/2;
    else
      return posX;
  }
  
  int centroY(){
    return posY - altura/2;
  }
  
  void style(){
    if(img == null){
      stroke(255);
      strokeWeight(1);
      fill(255);
    }
  }
    
  void styleMarcador(){
      stroke(255,0,0);
      strokeWeight(2); 
  }
    
}