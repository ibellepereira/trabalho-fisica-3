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
    altura = 80;
    
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
      if(altura == 0) altura = 1;
      img.resize(0, abs(altura));
      img.filter(THRESHOLD, 0.65);
      
      if(altura < 0){
        translate(width/2*2,height/2*2);
        rotate(PI); 
        
        image(img, width-posX, (altura>0)? centroY() - marcador : centroY()-abs(altura));
       
        translate(width/2*2,height/2*2);
        rotate(PI);         
      }else image(img, posX, (altura>0)? centroY() - marcador : centroY()-abs(altura));
    }
  }
  
  void redimensionando(){
    if((mouseX > centroX()-largura/2 && mouseX < centroX()+largura/2) && ((mouseY >= posY - altura && mouseY <= posY - altura+10))){
      redimen = true;
    }else{ 
      redimen = false;
    }
  }
  
  void redimensiona(){
    if(redimen){
      int tam;
      tam = height/2 - mouseY;
     // if(tam == 0) altura = tam;
      altura = tam;
      if(altura > 150) altura = 150;
      if(altura <= 0) altura = 1;
    }    
  }
  
  void movendo(){
     if((mouseX > centroX()-largura/2 && mouseX < centroX()+largura/2) && ((mouseY >= height/2-altura+10 && mouseY <= height/2) || (mouseY >= height/2 && mouseY <= height/2+altura-10))){
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
        
      if(mouseX > width/2 - largura/2) posX = width/2 - largura/2; 
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