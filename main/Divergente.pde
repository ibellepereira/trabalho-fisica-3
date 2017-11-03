class Divergente extends Lente{
  int tipo; 
  
  Divergente(){
    super(); 
    tipo = 1;

  }
  
  void mostra(){
    strokeWeight(3);
    int retw = tam/5; //largura do retangulo é metade da altura
    switch(tipo){
     case 0: //espelho
       noFill();
       arc(posX+raio, posY, raio*2, raio*2, PI/2, 3*PI/2);
     
     
       break;
     case 1:  //biconcavo
      
      if(raio > retw/2) raio = retw/2; //impede os arcos de se cruzarem
      stroke(255);
      noFill();
      line(posX - retw/2, posY-tam/2, posX + retw/2, posY-tam/2);
      arc(posX - retw/2, posY, raio*2, tam, -PI/2, PI/2);
      arc(posX + retw/2, posY, raio*2, tam, PI/2, 3*PI/2);
      line(posX - retw/2, posY+tam/2, posX + retw/2, posY+tam/2);

      break;
     case 2: //plano-concavo
     
      if(raio > retw/2) raio = retw/2; //impede os arcos de se cruzarem
      stroke(255);
      noFill();
      line(posX - retw/2, posY-tam/2, posX + retw/2, posY-tam/2);
      arc(posX - retw/2, posY, 0, tam, -PI/2, PI/2);
      arc(posX + retw/2, posY, raio*2, tam, PI/2, 3*PI/2);
      line(posX - retw/2, posY+tam/2, posX + retw/2, posY+tam/2);
     
     
       break;
     case 3: //convexo-concavo
      if(raio > retw/2) raio = retw/2; //impede os arcos de se cruzarem
      stroke(255);
      noFill();
      line(posX - retw/2, posY-tam/2, posX + retw/2, posY-tam/2);
      arc(posX - retw/2, posY, raio*2, tam, PI/2, 3*PI/2);
      arc(posX + retw/2, posY, raio*2, tam, PI/2, 3*PI/2);
      line(posX - retw/2, posY+tam/2, posX + retw/2, posY+tam/2);
     
      
       break;
    }
    strokeWeight(1);
  }
}