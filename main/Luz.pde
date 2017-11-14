class Luz{
  Objeto o;
  Lente l;
  Objeto i;
  //int altura;
  
  Luz(Objeto ob, Lente le){
    o = ob;
    l = le;
  //  i = new Objeto(loadImage("darwin3.png"));
    i = new Objeto(null);
  }
  
  void mostra(){
    if(l.espelhado){
      raioEspelho(); 
    }else{
      raioLente();      
    } 
  }
   
  void raioEspelho(){
    float x , y;
   
    float iniXA, iniYA;
    float focoX, focoY;
    float mA;
    
    iniXA = encontraPontoEspelhoX(height/2 - o.altura);
    iniYA = height/2 - o.altura;
    if(l.convergente) focoX = width/2 - l.foco();
    else focoX = width/2 + l.foco()*2;
    focoY = height/2;
    
  //  line(iniXA, iniYA, focoX, focoY);
    
    mA = (iniYA - focoY)/(iniXA - focoX);
    
    //------------------
    
    float iniXB, iniYB;
    float centroX, centroY;
    float mB;
    
    iniXB = o.centroX();
    iniYB = height/2 + o.altura ;
    centroX = l.posX;
    centroY = l.posY;
    
    //line(o.centroX(), o.posY-o.altura, centroX, centroY);

    mB = (iniYB - centroY) / (iniXB - centroX);
    
    iniXB = centroX;
    iniYB = centroY;
    
    x = (iniYB - iniYA - mB*iniXB + mA*iniXA)/(mA - mB);

    y = mB*(x - iniXB) + iniYB;
    
    /*
    img.tamY = (int)y - height/2;
    img.posY = (int)y - img.tamY;
    img.posX = (int)x - img.tamX/2;
    img.mostra();
    */
    
    if((obj.posX != width/2 - l.foco() && l.convergente) || !l.convergente){
      mostraImagem((int) x, (int) y);
    
      styleRaioA();
      line(o.centroX(), height/2 - o.altura, iniXA, iniYA);
      line(iniXA, iniYA, x, y); 
      line(iniXA, iniYA, focoX, focoY);
    
      styleRaioB();
      line(o.centroX(), o.posY-o.altura, centroX, centroY);

      line(centroX, centroY, x, y);
    
  
    } else i.altura = 0;
  }
    
  void raioLente(){
    float x , y;
   
    /* RETA PELO FOCO */
    float iniXFoco, iniYFoco;
    float focoX, focoY;
    float mFoco;
    
    iniXFoco = l.posX;
    iniYFoco = height/2 - o.altura;
    if(l.convergente) focoX = width/2 + l.focoRelativo();
    else focoX = width/2 - l.focoRelativo();
    focoY = height/2;
      
    //coeficiente angular da reta que passa pelo foco
    mFoco = (focoY - iniYFoco)/(focoX - iniXFoco);
    
    /*RETA PELO CENTRO*/
    float iniXCentro, iniYCentro;
    float centroX, centroY;
    float mCentro;
    
    iniXCentro = o.centroX();
    iniYCentro = height/2 - o.altura ;
    
    centroX = lente.posX;
    centroY = lente.posY;
    
    mCentro = (centroY - iniYCentro)/(centroX - iniXCentro);
    
    x = -1*(iniYCentro - iniYFoco - mCentro*iniXCentro + mFoco*iniXFoco)/(mCentro - mFoco);

    y = 1*mFoco*(x - iniXFoco) + iniYFoco; 
    
    if(obj.posX != width/2 - l.focoRelativo()){
      //desenha imagem
      mostraImagem((int)x, (int)y); 
      
      styleRaioA();
      line(iniXCentro, iniYCentro, x, y);
      line(o.centroX(), o.posY-o.altura, centroX, centroY);
      
      styleRaioB();
      line(o.centroX(), o.posY-o.altura, l.posX, o.posY-o.altura);
      line(iniXFoco, iniYFoco, x, y);
      line(iniXFoco, iniYFoco, focoX, focoY);

      
     
    } else i.altura = 0;
  }
 
  
  int encontraPontoEspelhoX(int y){
    //(x-xo)²/a² + (y-yo)²/b² = 1 :: (1 - (y-yo)¹/b²)*a
    int eq = (int) (Math.sqrt(Math.pow(l.raio*10,2) * (1 - Math.pow((y - height/2),2) / Math.pow(l.raio*10,2))))+l.centroX();
    
    if(l.convergente){
      return eq;  
    }else{
      eq = l.centroX() - eq;
      return l.centroX()+eq;
    }
  }
  
  void styleRaioA(){
    stroke(255,20,147);
  }
  
  void styleRaioB(){
    stroke(255,255,0);
  }

  void mostraImagem(int x, int y){

  
      i.altura =height/2 - y;
      //if(i.altura == 0) i.altura = 1;
      
      i.posX = x;
      i.posY = height/2;
      
      System.out.println(x);
 /*     
      if(y > height/2){
        i.posX = width - x;
        translate(width/2*2,height/2*2);
        rotate(PI);         
      }*/
      if(i.altura != 0)
        i.mostra();
       /* 
      if(y > height/2){
        translate(width/2*2,height/2*2);
        rotate(PI);         
      }           */
  }
  
}