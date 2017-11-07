class Lente{
 int posX;
 int posY;
 int raio;
 int tam;
 
 boolean espelhado;
 int retw;
 
 Lente(){
  posX = 400;
  posY = 300;
  raio = 300;
  tam = 300;
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