class UI{
  int opcao;
  boolean lente;
  boolean convergente;
  
  UI(){
    opcao = 1;
    lente = false;
    convergente = true;
  }
  
  void m(){
    noFill();
    stroke(255);
    rect(600,10,190,95);//contorno
    //lente 
    rect(600+5, 10+5, 90, 25);
    text("LENTE", (600+5+90/2), (10+5+25/2+10));
    //espelho
    rect(600+5+90, 10+5, 90, 25);
    //textFont(f,22);
    text("ESPELHO", 1+600+5+90+90/2, 10+5+25/2+10);
    
    //lente convergente
    rect(600+5, 10+5+25, 90, 25);
    textSize(16);
    text("CONVERGENTE", 600+5+90/2, 10+5+25/2+25+8);
    
    rect(600+5, 10+5+25+25+5, 30, 30);
    rect(600+5+30, 10+5+25+25+5, 30, 30);
    rect(600+5+30+30, 10+5+25+25+5, 30, 30);
    
    //lente divergente
    rect(600+5+90, 10+5+25, 90, 25);
    text("DIVERGENTE", 600+5+90/2+90, 10+5+25/2+25+8);
    
    rect(600+5+30+30+30, 10+5+25+25+5, 30, 30);
    rect(600+5+30+30+30+30, 10+5+25+25+5, 30, 30);
    rect(600+5+30+30+30+30+30, 10+5+25+25+5, 30, 30);
  }
  
  void seleciona(){
    
    if((mouseX > 600+5  && mouseX< 600+5+90) && (mouseY > 10+5 && mouseY< 10+5+25)){ //seleciona lente
     lente = true;
    }else if((mouseX > 600+5+90  && mouseX< 600+5+90+90) && (mouseY > 10+5 && mouseY < 10+5+25)){ //seleciona espelho
     lente = false; 
     }
     
    if((mouseX > 600+5  && mouseX< 600+5+90) && (mouseY > 10+5+25 && mouseY< 10+5+25+25)){ //seleciona convergente
     convergente = true;
    }else if((mouseX > 600+5+90  && mouseX< 600+5+90+90) && (mouseY > 10+5+25 && mouseY < 10+5+25+25)){ //seleciona divergente
     convergente = false; 
    }
    
    if(lente){
       if((mouseX > 600+5+15  && mouseX< 600+5+15+30) && (mouseY > 10+5+25+25 && mouseY< 10+5+25+25+30)){ //bi
         opcao = 1;            
       }else if((mouseX > 600+5+15+30+30  && mouseX< 600+5+15+30+30+30) && (mouseY > 10+5+25+25 && mouseY < 10+5+25+25+30)){ //plano
         opcao = 2; 
       }else if((mouseX > 600+5+15+30+30+30+30  && mouseX< 600+5+15+30+30+30+30+30) && (mouseY > 10+5+25+25 && mouseY < 10+5+25+25+30)){ //mista
         opcao = 3;
       }
     } 
   
   }
   
   void mostra(){
     noFill();
     stroke(255);
     
     //desenha box
     if(lente){
       rect(600,10,190,95);
       
       //lente 
       //fill(255,69,0);
       fill(255);
       rect(600+5, 10+5, 90, 25);
       fill(0);
       text("LENTE", (600+5+90/2), (10+5+25/2+10));
       noFill();
       
       //espelho
       rect(600+5+90, 10+5, 90, 25);
       fill(255);
       text("ESPELHO", 1+600+5+90+90/2, 10+5+25/2+10);
       noFill(); 
       
     }else{
       rect(600,10,190,60);
       //lente 
       rect(600+5, 10+5, 90, 25);
       fill(255);
       text("LENTE", (600+5+90/2), (10+5+25/2+10));
       noFill();
       
       //espelho
       //fill(255,69,0);
       fill(255);
       rect(600+5+90, 10+5, 90, 25);
       fill(0);
       text("ESPELHO", 1+600+5+90+90/2, 10+5+25/2+10);
       noFill();
     }
     if(convergente){
       //fill(255,69,0);
       fill(255);
       rect(600+5, 10+5+25, 90, 25);
       textSize(16);
       fill(0);
       text("CONVERGENTE", 600+5+90/2, 10+5+25/2+25+8);
       noFill();
       
       //lente divergente
       rect(600+5+90, 10+5+25, 90, 25);
       fill(255);
       text("DIVERGENTE", 600+5+90/2+90, 10+5+25/2+25+8);
       noFill();
     }else{
       rect(600+5, 10+5+25, 90, 25);
       textSize(16);
       fill(255);
       text("CONVERGENTE", 600+5+90/2, 10+5+25/2+25+8);
       noFill();
       
       //lente divergente
       //fill(255,69,0);
       fill(255);
       rect(600+5+90, 10+5+25, 90, 25);
       fill(0);
       text("DIVERGENTE", 600+5+90/2+90, 10+5+25/2+25+8);
       noFill(); 
     }
     
     if(lente && convergente){
       if(opcao == 1){
         biconvexa(true);
         planoConvexa(false);
         concavaConvexa(false);
         
       }
       
       if(opcao == 2){
         biconvexa(false);
         planoConvexa(true);
         concavaConvexa(false);
         
       }
       
       if(opcao == 3){
         biconvexa(false);
         planoConvexa(false);
         concavaConvexa(true);
         
       }
      
     }else if(lente && !convergente){
       if(opcao == 1){
         biconcava(true);
         planoConcava(false);
         convexoConcava(false);
         
       }
       
       if(opcao == 2){
         biconcava(false);
         planoConcava(true);
         convexoConcava(false);
       }
       
       if(opcao == 3){
         biconcava(false);
         planoConcava(false);
         convexoConcava(true);
       }  
     }
   }
    void biconcava(boolean select){
      if(select){
        fill(255);
        rect(600+5+15, 10+5+25+25+5, 30, 30);
        noFill();
         
        stroke(0); 
        line(600+5+15+5, 10+5+25+25+5+5, 600+5+15+30-5, 10+5+25+25+5+5);
        arc(600+5+15+5, 10+5+25+25+5+5+10, 15, 20, -PI/2, PI/2);
        arc(600+5+15+5+20, 10+5+25+25+5+5+10, 15, 20, PI/2, 3*PI/2);
        line(600+5+15+5, 10+5+25+25+5+5+20, 600+5+15+30-5, 10+5+25+25+5+5+20);
         
        stroke(255);  
        
      }else{
        noFill();
        stroke(255);
        rect(600+5+15, 10+5+25+25+5, 30, 30);
         
        stroke(255); 
        line(600+5+15+5, 10+5+25+25+5+5, 600+5+15+30-5, 10+5+25+25+5+5);
        arc(600+5+15+5, 10+5+25+25+5+5+10, 15, 20, -PI/2, PI/2);
        arc(600+5+15+5+20, 10+5+25+25+5+5+10, 15, 20, PI/2, 3*PI/2);
        line(600+5+15+5, 10+5+25+25+5+5+20, 600+5+15+30-5, 10+5+25+25+5+5+20);    
      }
    }
       
    void biconvexa(boolean select){
      if(select){
        fill(255);
        rect(600+5+15, 10+5+25+25+5, 30, 30);
        noFill();
         
        stroke(0); 
        arc(600+5+15+5+10, 10+5+25+25+5+5+10, 5, 20, -PI/2, PI/2);
        arc(600+5+15+5+10, 10+5+25+25+5+5+10, 5, 20, PI/2, 3*PI/2);
         
        stroke(255);          
        
      }else{
        noFill();
        stroke(255); 
        rect(600+5+15, 10+5+25+25+5, 30, 30);

        arc(600+5+15+5+10, 10+5+25+25+5+5+10, 5, 20, -PI/2, PI/2);
        arc(600+5+15+5+10, 10+5+25+25+5+5+10, 5, 20, PI/2, 3*PI/2);
         
      }         
    }
       
    void planoConcava(boolean select){
      if(select){
         fill(255);
         rect(600+5+15+30+30, 10+5+25+25+5, 30, 30);
         noFill();
         
         stroke(0);
         line(600+5+15+30+30+5+5, 10+5+25+25+5+5, 600+5+15+30+30+30-5-5, 10+5+25+25+5+5);
         arc(600+5+15+30+30+5+5, 10+5+25+25+5+5+10, 0, 20, -PI/2, PI/2);
         arc(600+5+15+30+30+5+20-5, 10+5+25+25+5+5+10, 10, 20, PI/2, 3*PI/2);
         line(600+5+15+30+30+5+5, 10+5+25+25+5+5+20, 600+5+15+30+30+30-5-5, 10+5+25+25+5+5+20);
         stroke(255);
        
      }else{
         stroke(255);
         noFill();
         rect(600+5+15+30+30, 10+5+25+25+5, 30, 30);
         
         line(600+5+15+30+30+5+5, 10+5+25+25+5+5, 600+5+15+30+30+30-5-5, 10+5+25+25+5+5);
         arc(600+5+15+30+30+5+5, 10+5+25+25+5+5+10, 0, 20, -PI/2, PI/2);
         arc(600+5+15+30+30+5+20-5, 10+5+25+25+5+5+10, 10, 20, PI/2, 3*PI/2);
         line(600+5+15+30+30+5+5, 10+5+25+25+5+5+20, 600+5+15+30+30+30-5-5, 10+5+25+25+5+5+20); 
      }         
    }
       
    void planoConvexa(boolean select){
      if(select){
         fill(255);
         rect(600+5+15+30+30, 10+5+25+25+5, 30, 30);
         noFill();
         
         stroke(0);

         arc(600+5+15+30+30+5+5+2, 10+5+25+25+5+5+10, 15, 20, -PI/2, PI/2);
         arc(600+5+15+30+30+5+5+2, 10+5+25+25+5+5+10, 0, 20, PI/2, 3*PI/2);
         stroke(255);
      }else{
        noFill();
        stroke(255); 
        rect(600+5+15+30+30, 10+5+25+25+5, 30, 30);

        arc(600+5+15+30+30+5+5+2, 10+5+25+25+5+5+10, 15, 20, -PI/2, PI/2);
        arc(600+5+15+30+30+5+5+2, 10+5+25+25+5+5+10, 0, 20, PI/2, 3*PI/2);
      }         
    }
       
    void convexoConcava(boolean select){
      if(select){
        fill(255);
        rect(600+5+15+30+30+30+30, 10+5+25+25+5, 30, 30);
        noFill();
        
        stroke(0);
        line(600+5+15+30+30+30+30+5+5+10, 10+5+25+25+5+5, 600+5+15+30+30+30+30+30-5-5-5, 10+5+25+25+5+5);
        arc(600+5+15+30+30+30+30+5+5+5, 10+5+25+25+5+5+10, 10, 20, PI/2, 3*PI/2);
        arc(600+5+15+30+30+30+30+5+20-5-5+5, 10+5+25+25+5+5+10, 10, 20, PI/2, 3*PI/2);
        line(600+5+15+30+30+30+30+5+5+10, 10+5+25+25+5+5+20, 600+5+15+30+30+30+30+30-5-5-5, 10+5+25+25+5+5+20);      
        
      }else{
        noFill();
        stroke(255);
        rect(600+5+15+30+30+30+30, 10+5+25+25+5, 30, 30);

        line(600+5+15+30+30+30+30+5+5+10, 10+5+25+25+5+5, 600+5+15+30+30+30+30+30-5-5-5, 10+5+25+25+5+5);
        arc(600+5+15+30+30+30+30+5+5+5, 10+5+25+25+5+5+10, 10, 20, PI/2, 3*PI/2);
        arc(600+5+15+30+30+30+30+5+20-5-5+5, 10+5+25+25+5+5+10, 10, 20, PI/2, 3*PI/2);
        line(600+5+15+30+30+30+30+5+5+10, 10+5+25+25+5+5+20, 600+5+15+30+30+30+30+30-5-5-5, 10+5+25+25+5+5+20);
            
      }         
    }
       
    void concavaConvexa(boolean select){
      if(select){
        fill(255);
        rect(600+5+15+30+30+30+30, 10+5+25+25+5, 30, 30);
        noFill();
        
        stroke(0);
        arc(600+5+15+30+30+30+30+10, 10+5+25+25+5+5+10, 10, 20, -PI/2, PI/2);
        arc(600+5+15+30+30+30+30+10, 10+5+25+25+5+5+10,20, 20, -PI/2, PI/2);             
        
      }else{
        noFill();
        stroke(255);
        rect(600+5+15+30+30+30+30, 10+5+25+25+5, 30, 30);

        arc(600+5+15+30+30+30+30+10, 10+5+25+25+5+5+10, 10, 20, -PI/2, PI/2);
        arc(600+5+15+30+30+30+30+10, 10+5+25+25+5+5+10,20, 20, -PI/2, PI/2); 
                    
      }         
    }
}