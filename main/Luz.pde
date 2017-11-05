class Luz{
  Objeto obj;
  Lente lente;
  Objeto img;
  boolean convergente;
  
  Luz(Objeto o){
   obj = o; 
  }
  
  void mostra(){
   if(lente.espelhado){
     if(convergente){
       
     }else{
       
       
     }
     
   }else{ 
     if(convergente){
       propriedadeRaioParalelo();
       propriedadeRaioCentro();
       pontoInterseccaoRaios();
       
       
     }else{
       
       propriedadeRaioCentro();
       propriedadeRaioParaleloAnterior();
     }
     
   }
    
  }
  
  /*ESPELHO DIVERGENTE*/
  void retaParalela(){
   stroke(255,255,0); 
   line(0, obj.posY, calculaPontoEspelho(), obj.posY);
   
   stroke(255);
  }
  
  void configura(Lente l, boolean c){
   lente = l; 
   convergente = c;
  }
  
  int calculaPontoEspelho(){
    double x, x1, y1, y, a, b, temp;
    x1 = lente.posX;
    y1 = lente.posY;
    y = obj.posY;
    a = lente.raio*2;
    b = lente.tam;
    
    temp = a*a * (1 - ((y-y1)*(y-y1) / b*b));
    System.out.println(temp);
    
    temp = Math.pow(a,2) * (1 - Math.pow((y-y1),2) / Math.pow(b,2));
    System.out.println(temp);
   
    x = Math.sqrt(temp)- lente.raio+x1;
    
    System.out.println(x);
    return (int) x;
  }
  
  void propriedadeRaioParalelo(){
    //desenha linha paralela ao objeto
    line(0, height/2 - obj.tamY, lente.posX, height/2-obj.tamY);
    
    /* RETA PELO FOCO */
    float iniX = lente.posX, iniY = height/2-obj.tamY;
    float focoX = lente.posX + lente.foco() + lente.raio, focoY = height/2;
    float fimX, fimY = height;
    float m;
    
    //TESTE1 desenha linha até o foco
    //line(iniX, iniY, focoX, focoY);
    
    m = (focoY - iniY)/(focoX - iniX);
    
    //y-yi = m(x-xi) :: y-yi = mx - mxi :: x = y-yi/m + xi
    fimX = (fimY-iniY)/m + iniX;
    
    if(obj.posX < lente.posX && obj.posX > lente.posX - lente.foco() - lente.raio){
          iniX = 0+obj.tamX/2;
          iniY = fimY - (fimX - iniX)*m;
    }
    
    line(iniX, iniY, fimX, fimY);
    
  }
  
  void propriedadeRaioCentro(){
    float iniX, iniY, fimX, fimY;
    float centroX, centroY;
    float m;
    
    m = height/2-obj.tamY;
    
    iniX = obj.posX + obj.tamX/2;
    iniY = height/2 - obj.tamY ;
    
    centroX = lente.posX;
    centroY = lente.posY;
    
    m = (centroY - iniY)/(centroX - iniX);
    
    fimY = height;
    fimX = (fimY-iniY)/m + iniX;
    
    //(fimX - iniX)m = fimY - iniY
    iniX = 0+obj.tamX/2;
    iniY = fimY - (fimX - iniX)*m;
    
    
    //line(iniX, iniY, fimX, fimY);
    line(iniX, iniY, fimX, fimY);
  }
  
  void propriedadeRaioParaleloAnterior(){
    //desenha linha paralela ao objeto
    line(0, height/2 - obj.tamY, lente.posX, height/2-obj.tamY);
    
    /* RETA PELO FOCO */
    float iniX = lente.posX, iniY = height/2-obj.tamY;
    float focoX = lente.posX - lente.foco() - lente.raio, focoY = height/2;
    float fimX, fimY = height;
    float m;
    
    //TESTE1 desenha linha até o foco
    //line(iniX, iniY, focoX, focoY);
    
    m = (focoY - iniY)/(focoX - iniX);
    
    //y-yi = m(x-xi) :: y-yi = mx - mxi :: x = y-yi/m + xi
    fimX = (fimY-iniY)/m + iniX;
    
    line(iniX, iniY, fimX, fimY);
    
  }
  
  void pontoInterseccaoRaios(){
    float x , y;
    
    y=0;
    
    /* RETA PELO FOCO */
    float iniXFoco = lente.posX, iniYFoco = height/2-obj.tamY;
    float focoX = lente.posX - lente.foco() - lente.raio, focoY = height/2;
    float mFoco;
    
    iniXFoco = lente.posX;
    iniYFoco = height/2 - obj.tamY;
    focoX = lente.posX - lente.foco() - lente.raio;
    focoY = height/2;
    
    //coeficiente angular da reta que passa pelo foco
    mFoco = (focoY - iniYFoco)/(focoX - iniXFoco);
    
    /*RETA PELO CENTRO*/
    float iniXCentro, iniYCentro;
    float centroX, centroY;
    float mCentro;
    
    iniXCentro = obj.posX + obj.tamX/2;
    iniYCentro = height/2 - obj.tamY ;
    
    centroX = lente.posX;
    centroY = lente.posY;
    
    mCentro = (centroY - iniYCentro)/(centroX - iniXCentro);
    
    x = (mFoco*iniXFoco - mCentro*iniXCentro + iniYCentro - iniYFoco) / (mFoco - mCentro);
    
    y = mFoco*(x - iniXFoco) + iniYFoco;
    
    stroke(0,255,0);
    line(iniXCentro, iniYCentro, x, y);
    line(iniXFoco, iniYFoco, x, y);
    stroke(255);
  }
  
}