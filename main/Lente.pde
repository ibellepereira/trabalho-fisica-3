class Lente{
 int posX;
 int posY;
 int raio;
 int altura;
 
 boolean espelhado;
 boolean convergente;
 
 int retw;
 int tipo;
 
 Lente(){
   posX = width/2;
   posY = height/2;
   raio = 200;
   altura = 300;
   
   espelhado = true;
   convergente = true;
   
   tipo = 1;
   
   retw = altura/10;
 }
 
 void mostra(){
   style();
   
   if(espelhado){
     if(convergente){
       
    //   arc(centroX(), posY, raio*2, raio*2, -PI/2, PI/2);
         arc(centroX(), posY, raio*20, raio*20, -radians(5), radians(5));
       
     }else{
       
     //  arc(centroX(), posY, raio*2, raio*2, PI/2, 3*PI/2);
         arc(centroX(), posY, raio*20, raio*20, radians(175), radians(185));
       
     }
   }else{
     if(convergente){
       switch(tipo){
         case 1:
           arc(posX, posY, larguraLenteFina()*2, altura, -PI/2, PI/2);
           arc(posX, posY, larguraLenteFina()*2, altura, PI/2, 3*PI/2);
           
           break;
         case 2:
           arc(centroX(), posY, larguraLenteFina()*2, altura, -PI/2, PI/2);
           arc(centroX(), posY, 0, altura, PI/2, 3*PI/2);
         
           break;
           
         case 3:
           arc(centroX(), posY, larguraLenteFina(), altura, -PI/2, PI/2);
           arc(centroX(), posY, larguraLenteFina()*2, altura, -PI/2, PI/2);
         
           break;
       }
     }else{
       switch(tipo){
         case 1:
           line(posX - larguraLenteFina(), posY - altura/2, posX + larguraLenteFina(), posY - altura/2);
           arc(posX - larguraLenteFina(), posY, larguraLenteFina()*2, altura, -PI/2, PI/2);
           arc(posX + larguraLenteFina(), posY, larguraLenteFina()*2, altura, PI/2, 3*PI/2);
           line(posX - larguraLenteFina(), posY + altura/2, posX + larguraLenteFina(), posY + altura/2);
          
           break;
         case 2:
           line(posX - larguraLenteFina(), posY - altura/2, posX + larguraLenteFina(), posY - altura/2);
           arc(posX - larguraLenteFina(), posY, 0, altura, -PI/2, PI/2);
           arc(posX + larguraLenteFina(), posY, larguraLenteFina()*2, altura, PI/2, 3*PI/2);
           line(posX - larguraLenteFina(), posY + altura/2, posX + larguraLenteFina(), posY + altura/2);
         
         
           break;
           
         case 3:
           line(posX, posY - altura/2, posX + larguraLenteFina(), posY - altura/2);
           arc(posX, posY, larguraLenteFina()*2, altura, PI/2, 3*PI/2);
           arc(posX + larguraLenteFina(), posY, larguraLenteFina()*2, altura, PI/2, 3*PI/2);
           line(posX, posY + altura/2, posX + larguraLenteFina(), posY + altura/2);
     
           break;
       }          
     }
   }
   mostraFoco();
 }
 
 void mostraFoco(){
   styleFoco();
   
   if(espelhado){ 
       line(width/2+foco(), posY-5, width/2+foco(), posY+5);
       line(width/2-foco(), posY-5, width/2-foco(), posY+5);

       line(width/2+antiPrincipal(), posY-5, width/2+antiPrincipal(), posY+5);
       line(width/2-antiPrincipal(), posY-5, width/2-antiPrincipal(), posY+5);       

   }else{
     
       line(posX-focoRelativo(), posY-5, posX-focoRelativo(), posY+5);
       line(posX+focoRelativo(), posY-5, posX+focoRelativo(), posY+5);   
       
       line(posX-antiPrincipalRelativo(), posY-5, posX-antiPrincipalRelativo(), posY+5);
       line(posX+antiPrincipalRelativo(), posY-5, posX+antiPrincipalRelativo(), posY+5); 
     
   }
 }
 
 /*Virou relativo também*/
 int foco(){
   return raio/2;
 }
 
 int focoRelativoEspelho(){
   return raio/2; 
 }
 
 int antiPrincipalRelativoEspelho(){
   return focoRelativoEspelho()*2; 
 }
 
 int focoRelativo(){
   return foco();
 }
 
 int antiPrincipal(){
   return foco()*2;
 }
 
 int antiPrincipalRelativo(){
    return focoRelativo()*2; 
 }
 
 int centroX(){
   if(espelhado){
     if(convergente) return posX - raio*10; 
     else return /*posX + raio*/ posX+raio*10;
   }else{
     if(convergente && (tipo == 2 || tipo == 3))
       return posX - larguraLenteFina()/2;
     else 
       return 0;
   }
 }
 
 int larguraLenteFina(){
   if(raio > retw/2) 
     return retw/2;
   return raio;
 }
 
 void style(){
   strokeWeight(2);
   noFill();
   stroke(100,149,237);
 }
 
 void styleFoco(){
   strokeWeight(2);
   noFill();
   stroke(255);
 }

  
}