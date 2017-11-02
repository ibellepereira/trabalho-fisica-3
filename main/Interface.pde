class Interface{
  int opcao;
  boolean lente;
  boolean convergente;
  
  Interface(){
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
       fill(255,69,0);
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
       fill(255,69,0);
       rect(600+5+90, 10+5, 90, 25);
       fill(0);
       text("ESPELHO", 1+600+5+90+90/2, 10+5+25/2+10);
       noFill();
     }
     if(convergente){
       fill(255,69,0);
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
       fill(255,69,0);
       rect(600+5+90, 10+5+25, 90, 25);
       fill(0);
       text("DIVERGENTE", 600+5+90/2+90, 10+5+25/2+25+8);
       noFill(); 
     }
     
     if(lente && convergente){
       if(opcao == 1){
         fill(255,69,0);
         rect(600+5+15, 10+5+25+25+5, 30, 30);
         noFill();
         
         rect(600+5+15+30+30, 10+5+25+25+5, 30, 30);
         rect(600+5+15+30+30+30+30, 10+5+25+25+5, 30, 30);
         
       }
       
       if(opcao == 2){
         rect(600+5+15, 10+5+25+25+5, 30, 30);
         
         fill(255,69,0);
         rect(600+5+15+30+30, 10+5+25+25+5, 30, 30);
         noFill();
         
         rect(600+5+15+30+30+30+30, 10+5+25+25+5, 30, 30);
         
       }
       
       if(opcao == 3){
         rect(600+5+15, 10+5+25+25+5, 30, 30);
         rect(600+5+15+30+30, 10+5+25+25+5, 30, 30);
         
         fill(255,69,0);
         rect(600+5+15+30+30+30+30, 10+5+25+25+5, 30, 30); 
         noFill();
         
       }
      
     }else if(lente && !convergente){
       if(opcao == 1){
         fill(255,69,0);
         rect(600+5+15, 10+5+25+25+5, 30, 30);
         noFill();
         
         rect(600+5+15+30+30, 10+5+25+25+5, 30, 30);
         rect(600+5+15+30+30+30+30, 10+5+25+25+5, 30, 30);
         
       }
       
       if(opcao == 2){
         rect(600+5+15, 10+5+25+25+5, 30, 30);
         
         fill(255,69,0);
         rect(600+5+15+30+30, 10+5+25+25+5, 30, 30);
         noFill();
         
         rect(600+5+15+30+30+30+30, 10+5+25+25+5, 30, 30);
         
       }
       
       if(opcao == 3){
         rect(600+5+15, 10+5+25+25+5, 30, 30);
         rect(600+5+15+30+30, 10+5+25+25+5, 30, 30);
         
         fill(255,69,0);
         rect(600+5+15+30+30+30+30, 10+5+25+25+5, 30, 30); 
         noFill();
         
       }
      
       
     }
     
   }
}