class Convergente extends Lente{
  int tipo; 
  
  Convergente(){
    super();
  }
  
  void mostra(){
    switch(tipo){
     case 0: //espelho
     
       noFill();
       arc(posX, posY, raio*2, raio*2,-PI/2, PI/2);
     
     
       break;
     case 1: //biconvexo
     
     
     
     
       break;
     case 2: //plano-convexo
     
     
     
     
       break;
     case 3: //concavo-convexo
     
     
      
       break;
    }
    
  }
}