class Objeto{
  int posX;
  int posY;
  int tamX;
  int tamY;
  
  boolean edit;
  boolean mov;
  
  public Objeto(){
    tamX = 10;
    tamY = tamX * 5;
    posX = 30;
    posY = 300-tamY;
  }
  
  void mostra(){
    fill(255);
    stroke(255);
    rect(posX, posY, tamX, tamY);
  }
  
  
  void editando(){
    if((mouseX > posX && mouseX < posX+tamX) && (mouseY >= posY && mouseY <= posY+5)){
        edit = true;
    }
  }
  
  void movendo(){
    if((mouseX > posX && mouseX < posX+tamX) && (mouseY > posY+5 && mouseY < posY+tamY)){
        mov = true;
    }
  }
  
  void redimensiona(){
    if(edit){
      if(mouseY < height/2){
       posY = mouseY;
       if(posY < 100) posY = 100;
       tamY = height/2 - posY;
      }

    }
  }
  
  void move(){
    //if((mouseX > posX && mouseX < posX+tamX) && (mouseY > posY+5 && mouseY < posY+tamY)){
    if(mov){
      posX = mouseX-tamX/2;
      if(posX < 0) 
        posX = 0;
      if(posX > width/2 - tamX/2) 
        posX = width/2-tamX-1;
    }
  }
}