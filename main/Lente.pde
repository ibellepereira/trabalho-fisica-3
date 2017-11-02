class Lente{
 int posX;
 int posY;
 int raio;
 int tam;
 
 boolean espelhado;
 
 Lente(){
  posX = width/2;
  posY = height/2;
  raio = 30;
  tam = 50;
 }
 
 void move(){
   
 }
 
 void redimensiona(){
   
 }
 
 int foco(){
   return raio/2;
 }
 
 int antiPrincipal(){
   return foco()*2;
 }
  
}