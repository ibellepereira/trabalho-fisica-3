class Luz{
  Objeto obj;
  Lente lente;
  Objeto img;
  
  Luz(Objeto o){
   obj = o; 
  }
  
  /*ESPELHO DIVERGENTE*/
  void retaParalela(){
   stroke(255,255,0); 
   line(0, obj.posY, calculaPontoEspelho() - lente.raio, obj.posY);
   
   stroke(255);
  }
  
  void configura(Lente l){
   lente = l; 
  }
  
  int calculaPontoEspelho(){
    double x, x1, y1, y, a, b, temp;
    x1 = lente.posX;
    y1 = lente.posY;
    y = obj.posY;
    a = lente.raio*2;
    b = lente.tam;
    
    temp = Math.pow(a,2) * (1 - Math.pow(y-y1,2) / Math.pow(b,2));
    System.out.println(temp);
    
    x = Math.sqrt(temp) + x1;
    //if(x < 0) x*=-1;
    System.out.println(x);
    return (int) x;
  }
  
  
  
}