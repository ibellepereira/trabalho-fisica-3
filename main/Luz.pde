class Luz{
  Objeto o;
  Lente l;
  Objeto i;
  
  Luz(Objeto ob, Lente le){
    o = ob;
    l = le;
  }
  
  void mostra(){
    if(l.espelhado){
      //linha paralela até o espelho
      line(o.posX, o.posY-o.altura, encontraPontoEspelhoX(o.posY-o.altura), o.posY-o.altura);
      //linha do objeto ao centro
      line(o.posX, o.posY-o.altura, l.posX, l.posY);
      //linha do espelho à imagem passando pelo foco
      
      //linha do centro até a imagem
      line(l.posX, l.posY, leiGauss(l.foco()), aumentoTransversal(leiGauss(l.foco())));
    }else{
      raioLente();
        
    }
    
  }
  
  void raioEspelho(){
    //linha paralela até o espelho
    line(o.posX, o.posY-o.altura, encontraPontoEspelhoX(o.posY-o.altura), o.posY-o.altura);
    //linha do objeto ao centro
    line(o.posX, o.posY-o.altura, l.posX, l.posY);    
  }
  
  void raioLente(){
    if(o.centroX() != l.posX-l.focoRelativo()){
      int x, y;
      
     // x = encontroRetaX(
    }
  }
  
  float coeficienteAngular(int iniX, int iniY, int fimX, int fimY){
    return (fimY - iniY)/(fimX - iniX);
  }
  
  int encontroRetasX(int iniXA, int iniYA, int fimXA, int fimYA, 
                     int iniXB, int iniYB, int fimXB, int fimYB){
    float angA, angB;
    
    angA = coeficienteAngular(iniXA, iniYA, fimXA, fimYA);
    angB = coeficienteAngular(iniXB, iniYB, fimXB, fimYB);
    
    //mA(x-xiA)+yiA = mB(x-xiB)+yiB :: x = (yiB - yiA - mB*xiB + mA*xiA)/(mA - mB)

    return (int) ((iniYB - iniYA - angB*iniXB +angA*iniXA)/(angA - angB));                   
  }
  
  int encontroRetasY(int iniXA, int iniYA, int fimXA, int fimYA, 
                     int iniXB, int iniYB, int fimXB, int fimYB){
    float angA;
    
    angA = coeficienteAngular(iniXA, iniYA, fimXA, fimYA);

    
    return (int) (angA*(encontroRetasX(iniXA, iniYA, fimXA, fimYA, iniXB, iniYB, fimXB, fimYB) - iniXA) + iniYA);                   
  }
  
  /**retorna posição da imagem em relação à lente ou espelho*/
  int leiGauss(int foco){
    // 1/f = 1/p + 1/p' :: 1/f - 1/p = 1/p'
    float temp;
    
    temp = 1/foco - 1/(l.posX-o.centroX());
    
    return (int) (1/temp);
  }
  
  float aumentoTransversal(int tam){
    
    return tam/(l.posX - o.centroX());
  }
  
  int encontraPontoEspelhoX(int y){
    //(x-xo)²/a² + (y-yo)²/b² = 1 :: (1 - (y-yo)¹/b²)*a
    int eq = (int) (Math.sqrt(Math.pow(l.raio,2) * (1 - Math.pow((y - l.posY),2) / Math.pow(l.raio,2))))+l.centroX();
    if(l.convergente){
      return eq;  
    }else{
      eq = l.centroX() - eq;
      return l.centroX()+eq;
    }
  }
  
  void styleRaioA(){
    
  }
  
  void styleRaioB(){
    
  }
  
  void style(){
    
  }

}