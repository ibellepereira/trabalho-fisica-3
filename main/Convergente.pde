class Convergente extends Lente{
  int tipo; 
  
  Convergente(){
    super();
    tipo = 1;

  }
  
  void mostra(){
    strokeWeight(3);
    stroke(0,191,255);
    retw = tam/10; //largura do retangulo é metade da altura
    switch(tipo){
     case 0: //espelho
       noFill();
       raio = tam/2;
       arc(posX-raio,posY, raio*2, tam, -PI/2, PI/2);
       
       strokeWeight(1);
       
       //foco
       line(posX+raio-foco(), posY-5, posX+raio-foco(), posY+5);
       line(posX-raio+foco(), posY-5, posX-raio+foco(), posY+5);
       //c
       line(posX+raio*2-foco()*2, posY-5, posX+raio*2-foco()*2, posY+5);
       line(posX-raio*2+foco()*2, posY-5, posX-raio*2+foco()*2, posY+5);       
       
       break;
     case 1:  //biconcavo
      
      if(raio > retw/2) raio = retw/2; //impede os arcos de se cruzarem
     // stroke(255);
      noFill();
      arc(posX, posY, raio*2, tam, -PI/2, PI/2);
      arc(posX, posY, raio*2, tam, PI/2, 3*PI/2);

      break;
     case 2: //plano-convexo
     
      if(raio > retw/2) raio = retw/2; //impede os arcos de se cruzarem
      //stroke(255);
      noFill();
      
      arc(posX-raio/2, posY, raio*2, tam, -PI/2, PI/2);
      arc(posX-raio/2, posY, 0, tam, PI/2, 3*PI/2);

       break;
     case 3: //concavo-convexo
      //if(raio > retw/2) raio = retw/2; //impede os arcos de se cruzarem
      //stroke(255);
      noFill();
      arc(posX-raio/2, posY, raio, tam, -PI/2, PI/2);
      arc(posX-raio/2, posY, raio*2, tam, -PI/2, PI/2);
      
       break;
    }
    strokeWeight(1);
    stroke(255);
  }
}