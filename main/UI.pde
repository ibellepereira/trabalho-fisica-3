class UI{
  PFont f;
  
  int opcao;
  boolean lente;
  boolean convergente;
  
  int posX;
  int posY;
  
  UI(){
    opcao = 1;
    lente = false;
    convergente = true;
    
    posX = 600;
    posY = 10;
    
  }

  void mostra(){
    int margin = 5, 
        
        larguraCaixa = 190, 
        larguraBotao = 90, 
        alturaCaixa = 95, 
        alturaBotao = 25, 
        larguraOpcao = 30;
    
    if(lente){
      styleCaixaOff();
      rect(posX, posY, larguraCaixa, alturaCaixa);
      
      //lente selecionada
      styleCaixaOn();
      rect(posX+margin, posY+margin, larguraBotao, alturaBotao);
      
      //espelho
      styleCaixaOff();
      rect(posX+margin+larguraBotao, posY+margin, larguraBotao, alturaBotao);
      
      if(convergente){
        //rect(posX+margin+larguraOpcao/2, posY+margin*2+alturaBotao*2, larguraOpcao, larguraOpcao);
        switch(opcao){
          case 1:
            
            break;
          case 2:
            
            
            break;
          case 3:
            
            break;
        }          
      }else{        
        switch(opcao){
          case 1:
            
            break;
          case 2:
            
            break;
          case 3:
            
            break;      
        }
      }
    }else{
      styleCaixaOff();
      rect(posX, posY, larguraCaixa, alturaCaixa - larguraOpcao - margin);

      //lente
      styleCaixaOff();
      rect(posX+margin, posY+margin, larguraBotao, alturaBotao);
      
      //espelho selecionado
      styleCaixaOn();
      rect(posX+margin+larguraBotao, posY+margin, larguraBotao, alturaBotao);      
      
      if(convergente){
        
      }else{
           
      }  
    }
    
    if(convergente){
      styleCaixaOn();
      rect(posX+margin, posY+margin+alturaBotao, larguraBotao, alturaBotao);
      
      styleCaixaOff();
      rect(posX+margin+larguraBotao, posY+margin+alturaBotao, larguraBotao, alturaBotao);
    }else{
      
    }
    
    
  }
  
  void controle(){
    //seleciona lente ou espelho
    
    //seleciona convergente ou divergente
    
    //seleciona opção
  }
  
  void info(Lente l, Objeto i){
    if(lente){
      
    }else{
      
    }
    
  }
  
  void styleFonteOn(){
    fill(0);
    
  }
  
  void styleFonteOff(){
    fill(255);
  }
  
  void styleCaixaOn(){
    stroke(255);
    fill(255);
  }
  
  void styleCaixaOff(){
    stroke(255);
    noFill();
  }
  
  /*inicio métodos complementares*/
  
  
  /*Fim métodos completementares*/
}