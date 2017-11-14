class UI{
  PFont f;
  
  int opcao;
  boolean lente;
  boolean convergente;
  
  int posX;
  int posY;
    
  int margin = 5, 
        larguraCaixa = 190, 
        larguraBotao = 90, 
        alturaCaixa = 95, 
        alturaBotao = 25, 
        larguraOpcao = 30;  
  UI(PFont fonte){
    f = fonte;
    opcao = 1;
    lente = true;
    convergente = true;
    
    posX = width - 200;
    posY = 10; 
  }

  void mostra(){

    
    if(lente){
      styleCaixaOff();
      rect(posX, posY, larguraCaixa, alturaCaixa);
      
      //lente selecionada
      styleCaixaOn();
      rect(posX+margin, posY+margin, larguraBotao, alturaBotao);
      
      styleFonteOn();
      textSize(21);
      text("LENTE", posX+margin+larguraBotao/2, posY+margin*3+alturaBotao/2);
      
      //espelho
      styleCaixaOff();
      rect(posX+margin+larguraBotao, posY+margin, larguraBotao, alturaBotao);
      
      styleFonteOff();
      textSize(21);
      text("ESPELHO", posX+margin+larguraBotao+larguraBotao/2, posY+margin*3+alturaBotao/2);
      
      if(convergente){
        
        switch(opcao){
          case 1:
            biconvexa(true);
            planoConvexa(false);
            concavaConvexa(false);
            
            break;
          case 2:
            biconvexa(false);
            planoConvexa(true);
            concavaConvexa(false);            
            
            break;
          case 3:
            biconvexa(false);
            planoConvexa(false);
            concavaConvexa(true);            
            break;
        }          
      }else{        
        switch(opcao){
          case 1:
           biconcava(true);
           planoConcava(false);
           convexoConcava(false);            
           break;
          case 2:
            biconcava(false);
            planoConcava(true);
            convexoConcava(false);               
            break;
          case 3:
            biconcava(false);
            planoConcava(false);
            convexoConcava(true);               
            break;      
        }
      }
    }else{
      styleCaixaOff();
      rect(posX, posY, larguraCaixa, alturaCaixa - larguraOpcao - margin);

      //lente
      styleCaixaOff();
      rect(posX+margin, posY+margin, larguraBotao, alturaBotao);

      styleFonteOff();
      textSize(21);
      text("LENTE", posX+margin+larguraBotao/2, posY+margin*3+alturaBotao/2);
      
      //espelho selecionado
      styleCaixaOn();
      rect(posX+margin+larguraBotao, posY+margin, larguraBotao, alturaBotao);      
  
      styleFonteOn();
      textSize(21);
      text("ESPELHO", posX+margin+larguraBotao+larguraBotao/2, posY+margin*3+alturaBotao/2);  
  
    }
    
    if(convergente){
      styleCaixaOn();
      rect(posX+margin, posY+margin+alturaBotao, larguraBotao, alturaBotao);
      
      styleFonteOn();
      textSize(12);
      text("CONVERGENTE", posX+margin+larguraBotao/2, posY+margin*3+alturaBotao/2+alturaBotao-3);      
      
      styleCaixaOff();
      rect(posX+margin+larguraBotao, posY+margin+alturaBotao, larguraBotao, alturaBotao);
      
      styleFonteOff();
      textSize(12);
      text("DIVERGENTE", posX+margin+larguraBotao/2+larguraBotao, posY+margin*3+alturaBotao/2+alturaBotao-3); 
      
    }else{
      styleCaixaOff();
      rect(posX+margin, posY+margin+alturaBotao, larguraBotao, alturaBotao);

      styleFonteOff();
      textSize(12);
      text("CONVERGENTE", posX+margin+larguraBotao/2, posY+margin*3+alturaBotao/2+alturaBotao-3);        
      
      styleCaixaOn();
      rect(posX+margin+larguraBotao, posY+margin+alturaBotao, larguraBotao, alturaBotao);  
      
      styleFonteOn();
      textSize(12);
      text("DIVERGENTE", posX+margin+larguraBotao/2+larguraBotao, posY+margin*3+alturaBotao/2+alturaBotao-3);       
    }
    
    
  }
  
  void controle(){
    if((mouseX > posX+5  && mouseX< posX+5+90) && (mouseY > 10+5 && mouseY< 10+5+25)){ //seleciona lente
     lente = true;
    }else if((mouseX > posX+5+90  && mouseX< posX+5+90+90) && (mouseY > 10+5 && mouseY < 10+5+25)){ //seleciona espelho
     lente = false; 
     }
     
    if((mouseX > posX+5  && mouseX< posX+5+90) && (mouseY > 10+5+25 && mouseY< 10+5+25+25)){ //seleciona convergente
     convergente = true;
    }else if((mouseX > posX+5+90  && mouseX< posX+5+90+90) && (mouseY > 10+5+25 && mouseY < 10+5+25+25)){ //seleciona divergente
     convergente = false; 
    }
    
    if(lente){
       if((mouseX > posX+5+15  && mouseX< posX+5+15+30) && (mouseY > 10+5+25+25 && mouseY< 10+5+25+25+30)){ //bi
         opcao = 1;            
       }else if((mouseX > posX+5+15+30+30  && mouseX< posX+5+15+30+30+30) && (mouseY > 10+5+25+25 && mouseY < 10+5+25+25+30)){ //plano
         opcao = 2; 
       }else if((mouseX > posX+5+15+30+30+30+30  && mouseX< posX+5+15+30+30+30+30+30) && (mouseY > 10+5+25+25 && mouseY < 10+5+25+25+30)){ //mista
         opcao = 3;
       }
     } 
  }
  
  void info(Lente l, Objeto o, Objeto i){
    String info = "Imagem ";
    if(i.altura == 0){
      info = "Sem formação de imagem";
    }else{
       if(abs(i.altura) < abs(o.altura)){
          info = info + "menor, ";
        }else if(abs(i.altura) > abs(o.altura)){
          info = info + "maior, ";
        }else{
          info = info + "igual, "; 
        }
        
      if(l.espelhado){
        if(i.centroX() < width/2){
          info = info + "real, ";
        }else{
          info = info + "virtual, ";
        }
        System.out.println("espelho!!");
      }else{
      
        if(i.centroX() < width/2){
          info = info + "virtual, ";
        }else{
          info = info + "real, ";
        }
        //System.out.println("lente!!");
      }
        
      if(i.altura > 0){
        info = info + "direita."; 
      }else{
        info = info + "invertida."; 
      }     
    }
    text(info, width/2, height-10);
  }
  
  void styleDesenhoOn(){
    noFill();
    stroke(0);    
  }
  
  void styleDesenhoOff(){
    noFill();
    stroke(255);
  }
  
  void styleFonteOn(){
    strokeWeight(1);
    fill(0);
    
  }
  
  void styleFonteOff(){
    strokeWeight(1);
    fill(255);
  }
  
  void styleCaixaOn(){
    strokeWeight(1);
    stroke(255);
    fill(255);
  }
  
  void styleCaixaOff(){
    strokeWeight(1);
    stroke(255);
    noFill();
  }
  
  /*inicio métodos complementares*/
  
    void biconcava(boolean select){
      if(select){
        //fill(255);
        styleCaixaOn();
        //rect(600+5+15, 10+5+25+25+5, 30, 30);
        rect(posX+margin+larguraOpcao/2, posY+margin+alturaBotao*2+margin, larguraOpcao, larguraOpcao);
        
        styleDesenhoOn();
        //noFill();
        //stroke(0); 
       
        line(posX+5+15+5, 10+5+25+25+5+5, posX+5+15+30-5, 10+5+25+25+5+5);
        arc(posX+5+15+5, 10+5+25+25+5+5+10, 15, 20, -PI/2, PI/2);
        arc(posX+5+15+5+20, 10+5+25+25+5+5+10, 15, 20, PI/2, 3*PI/2);
        line(posX+5+15+5, 10+5+25+25+5+5+20, posX+5+15+30-5, 10+5+25+25+5+5+20);
         
        stroke(255);  
        
      }else{
        //noFill();
        //stroke(255);
        styleCaixaOff();
        rect(posX+margin+larguraOpcao/2, posY+margin+alturaBotao*2+margin, larguraOpcao, larguraOpcao);

       // rect(600+5+15, 10+5+25+25+5, 30, 30);
         
        //stroke(255); 
        styleDesenhoOff();
        
        line(posX+5+15+5, 10+5+25+25+5+5, posX+5+15+30-5, 10+5+25+25+5+5);
        arc(posX+5+15+5, 10+5+25+25+5+5+10, 15, 20, -PI/2, PI/2);
        arc(posX+5+15+5+20, 10+5+25+25+5+5+10, 15, 20, PI/2, 3*PI/2);
        line(posX+5+15+5, 10+5+25+25+5+5+20, posX+5+15+30-5, 10+5+25+25+5+5+20);    
      }
    }
       
    void biconvexa(boolean select){
      if(select){
        //fill(255);
        styleCaixaOn();
        //rect(600+5+15, 10+5+25+25+5, 30, 30);  
        rect(posX+margin+larguraOpcao/2, posY+margin+alturaBotao*2+margin, larguraOpcao, larguraOpcao);

        //noFill(); 
        //stroke(0); 
        styleDesenhoOn();
        
        arc(posX+5+15+5+10, 10+5+25+25+5+5+10, 5, 20, -PI/2, PI/2);
        arc(posX+5+15+5+10, 10+5+25+25+5+5+10, 5, 20, PI/2, 3*PI/2);
         
        stroke(255);          
        
      }else{
        //noFill();
        //stroke(255); 
        styleCaixaOff();
        rect(posX+margin+larguraOpcao/2, posY+margin+alturaBotao*2+margin, larguraOpcao, larguraOpcao);
        //rect(600+5+15, 10+5+25+25+5, 30, 30);
        
        styleDesenhoOff();
        arc(posX+5+15+5+10, 10+5+25+25+5+5+10, 5, 20, -PI/2, PI/2);
        arc(posX+5+15+5+10, 10+5+25+25+5+5+10, 5, 20, PI/2, 3*PI/2);
         
      }         
    }
       
    void planoConcava(boolean select){
      if(select){
         //fill(255);
         styleCaixaOn(); 
        // rect(600+5+15+30+30, 10+5+25+25+5, 30, 30);
        rect(posX+margin+larguraOpcao/2+larguraOpcao*2, posY+margin+alturaBotao*2+margin, larguraOpcao, larguraOpcao);
         
        // noFill();
        // stroke(0);
         styleDesenhoOn();
         
         line(posX+5+15+30+30+5+5, 10+5+25+25+5+5, posX+5+15+30+30+30-5-5, 10+5+25+25+5+5);
         arc(posX+5+15+30+30+5+5, 10+5+25+25+5+5+10, 0, 20, -PI/2, PI/2);
         arc(posX+5+15+30+30+5+20-5, 10+5+25+25+5+5+10, 10, 20, PI/2, 3*PI/2);
         line(posX+5+15+30+30+5+5, 10+5+25+25+5+5+20, posX+5+15+30+30+30-5-5, 10+5+25+25+5+5+20);
         
         //stroke(255);
        
      }else{
         styleCaixaOff(); 
        // stroke(255);
        // noFill();
         rect(posX+margin+larguraOpcao/2+larguraOpcao*2, posY+margin+alturaBotao*2+margin, larguraOpcao, larguraOpcao);
        
         
       //  rect(600+5+15+30+30, 10+5+25+25+5, 30, 30);
         
         styleDesenhoOff();
         line(posX+5+15+30+30+5+5, 10+5+25+25+5+5, posX+5+15+30+30+30-5-5, 10+5+25+25+5+5);
         arc(posX+5+15+30+30+5+5, 10+5+25+25+5+5+10, 0, 20, -PI/2, PI/2);
         arc(posX+5+15+30+30+5+20-5, 10+5+25+25+5+5+10, 10, 20, PI/2, 3*PI/2);
         line(posX+5+15+30+30+5+5, 10+5+25+25+5+5+20, posX+5+15+30+30+30-5-5, 10+5+25+25+5+5+20); 
      }         
    }
       
    void planoConvexa(boolean select){
      if(select){
         //fill(255);
         styleCaixaOn();
         //rect(600+5+15+30+30, 10+5+25+25+5, 30, 30);
         
        rect(posX+margin+larguraOpcao/2+larguraOpcao*2, posY+margin+alturaBotao*2+margin, larguraOpcao, larguraOpcao);
         
         styleDesenhoOn();
         //noFill();
         //stroke(0);

         arc(posX+5+15+30+30+5+5+2, 10+5+25+25+5+5+10, 15, 20, -PI/2, PI/2);
         arc(posX+5+15+30+30+5+5+2, 10+5+25+25+5+5+10, 0, 20, PI/2, 3*PI/2);
         
         //stroke(255);
      }else{
        //noFill();
        //stroke(255); 
        styleCaixaOff();
        
       // rect(600+5+15+30+30, 10+5+25+25+5, 30, 30);
        rect(posX+margin+larguraOpcao/2+larguraOpcao*2, posY+margin+alturaBotao*2+margin, larguraOpcao, larguraOpcao);

        styleDesenhoOff();
        arc(posX+5+15+30+30+5+5+2, 10+5+25+25+5+5+10, 15, 20, -PI/2, PI/2);
        arc(posX+5+15+30+30+5+5+2, 10+5+25+25+5+5+10, 0, 20, PI/2, 3*PI/2);
      }         
    }
       
    void convexoConcava(boolean select){
      if(select){
        //fill(255);
        styleCaixaOn();
       // rect(600+5+15+30+30+30+30, 10+5+25+25+5, 30, 30);
        rect(posX+margin+larguraOpcao/2+larguraOpcao*4, posY+margin+alturaBotao*2+margin, larguraOpcao, larguraOpcao);
        
        
        styleDesenhoOn();
        //noFill();
        //stroke(0);
        
        line(posX+5+15+30+30+30+30+5+5+10, 10+5+25+25+5+5, posX+5+15+30+30+30+30+30-5-5-5, 10+5+25+25+5+5);
        arc(posX+5+15+30+30+30+30+5+5+5, 10+5+25+25+5+5+10, 10, 20, PI/2, 3*PI/2);
        arc(posX+5+15+30+30+30+30+5+20-5-5+5, 10+5+25+25+5+5+10, 10, 20, PI/2, 3*PI/2);
        line(posX+5+15+30+30+30+30+5+5+10, 10+5+25+25+5+5+20, posX+5+15+30+30+30+30+30-5-5-5, 10+5+25+25+5+5+20);      
        
      }else{
        //noFill();
        //stroke(255);
        styleCaixaOff();
       // rect(600+5+15+30+30+30+30, 10+5+25+25+5, 30, 30);
        rect(posX+margin+larguraOpcao/2+larguraOpcao*4, posY+margin+alturaBotao*2+margin, larguraOpcao, larguraOpcao);
    
        styleDesenhoOff();
        
        line(posX+5+15+30+30+30+30+5+5+10, 10+5+25+25+5+5, posX+5+15+30+30+30+30+30-5-5-5, 10+5+25+25+5+5);
        arc(posX+5+15+30+30+30+30+5+5+5, 10+5+25+25+5+5+10, 10, 20, PI/2, 3*PI/2);
        arc(posX+5+15+30+30+30+30+5+20-5-5+5, 10+5+25+25+5+5+10, 10, 20, PI/2, 3*PI/2);
        line(posX+5+15+30+30+30+30+5+5+10, 10+5+25+25+5+5+20, posX+5+15+30+30+30+30+30-5-5-5, 10+5+25+25+5+5+20);
            
      }         
    }
       
    void concavaConvexa(boolean select){
      if(select){
       // fill(255);
        styleCaixaOn();
    //    rect(600+5+15+30+30+30+30, 10+5+25+25+5, 30, 30);
        rect(posX+margin+larguraOpcao/2+larguraOpcao*4, posY+margin+alturaBotao*2+margin, larguraOpcao, larguraOpcao);
    
        styleDesenhoOn();
        //noFill();
        //stroke(0);
        
        arc(posX+5+15+30+30+30+30+10, 10+5+25+25+5+5+10, 10, 20, -PI/2, PI/2);
        arc(posX+5+15+30+30+30+30+10, 10+5+25+25+5+5+10,20, 20, -PI/2, PI/2);             
        
      }else{
        //noFill();
        //stroke(255);
        styleCaixaOff();
     //   rect(600+5+15+30+30+30+30, 10+5+25+25+5, 30, 30);
        rect(posX+margin+larguraOpcao/2+larguraOpcao*4, posY+margin+alturaBotao*2+margin, larguraOpcao, larguraOpcao);
    
        styleDesenhoOff();
        arc(posX+5+15+30+30+30+30+10, 10+5+25+25+5+5+10, 10, 20, -PI/2, PI/2);
        arc(posX+5+15+30+30+30+30+10, 10+5+25+25+5+5+10,20, 20, -PI/2, PI/2); 
                    
      }         
    }
  
  /*Fim métodos completementares*/
}