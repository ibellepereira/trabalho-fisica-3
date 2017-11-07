class Luz{
  Objeto obj;
  Lente lente;
  Objeto img = new Objeto();
  boolean convergente;
  
  Luz(Objeto o){
   obj = o; 
  }
  
  void mostra(){
   if(lente.espelhado){
     if(convergente){

       interseccaoEspelhoConvergente();
     }else{
       //calculaPontoEspelho();  
       interseccaoEspelhoDivergente();
     }
     
   }else{ 
     mostraFocoRelativo();
     if(convergente){

       raiosLenteConvergente();
       
     }else{

       raiosLenteDivergente();
     }
   }
  }
  
  void configura(Lente l, boolean c){
   lente = l; 
   convergente = c;
  }
  

  void propriedadeRaioParalelo(){
    //desenha linha paralela ao objeto
    line(0, height/2 - obj.tamY, lente.posX, height/2-obj.tamY);
    
    /* RETA PELO FOCO */
    float iniX = lente.posX, iniY = height/2-obj.tamY;
    float focoX = lente.posX + lente.foco() + lente.raio, focoY = height/2;
    float fimX, fimY = height;
    float m;
    
    if(!convergente) focoX = lente.posX - lente.foco()*10 - lente.raio;
    else focoX = lente.posX + lente.foco()*10 + lente.raio;
    
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
  
  void propriedadeRaioParaleloDivergente(){
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
  
  
  
  
  
  
  
  
  
  
  
  void raiosLenteConvergente(){
    float x , y;
   
    /* RETA PELO FOCO */
    float iniXFoco, iniYFoco;
    float focoX, focoY;
    float mFoco;
    
    iniXFoco = lente.posX;
    iniYFoco = height/2 - obj.tamY;
    focoX = lente.posX + lente.foco()*10 + lente.raio;
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
    
    x = -1*(iniYCentro - iniYFoco - mCentro*iniXCentro + mFoco*iniXFoco)/(mCentro - mFoco);

    y = 1*mFoco*(x - iniXFoco) + iniYFoco; 
    
    if(obj.posX != lente.posX - lente.foco()*10 - lente.raio - obj.tamX/2){
      strokeWeight(2);
      stroke(255,255,0);
      //linhas completas
      propriedadeRaioParalelo();
      propriedadeRaioCentro(); 
       
      line(obj.posX+obj.tamX/2, obj.posY, lente.posX, obj.posY);
      line(iniXCentro, iniYCentro, x, y);
      line(iniXFoco, iniYFoco, x, y);

      //desenha imagem
      mostraImagem((int)x, (int)y);
      
      stroke(255);
      strokeWeight(1);      
    } else img.tamY = 0;
  }
  
  
  
  
  
    void raiosLenteDivergente(){
    float x , y;
   
    /* RETA PELO FOCO */
    float iniXFoco, iniYFoco;
    float focoX, focoY = height/2;
    float mFoco;
    
    iniXFoco = lente.posX;
    iniYFoco = height/2 - obj.tamY;
    focoX = lente.posX - lente.foco()*10 - lente.raio;
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
    
    x = -1*(iniYCentro - iniYFoco - mCentro*iniXCentro + mFoco*iniXFoco)/(mCentro - mFoco);

    y = 1*mFoco*(x - iniXFoco) + iniYFoco;
    
    
    //if(obj.posX != lente.posX - lente.foco() - lente.raio- lente.raio){
      strokeWeight(2);
      stroke(255,255,0);
      //linhas completas
      propriedadeRaioParalelo();
      propriedadeRaioCentro();      
     
      line(obj.posX+obj.tamX/2, obj.posY, lente.posX, obj.posY);
      line(iniXCentro, iniYCentro, x, y);
      line(iniXFoco, iniYFoco, x, y);

      mostraImagem((int)x, (int)y);
      

      stroke(255);
      strokeWeight(1);      
   // }
  }
  
  
  
  
  
  
  
  
  
  
  
  
   int calculaPontoEspelho(){
    int x, y, a, b, temp, xc, yc, n;
    xc = lente.posX;
    yc = lente.posY;
    y = obj.posY;
    a = lente.raio;
    b = lente.tam/2; 
    
    //x^2 / a^2 + y^2 / b^2 = 1
    temp = (int) (Math.pow(a,2) * (1 - Math.pow((y - yc),2) / Math.pow(b,2)));
    //System.out.println(temp);
   //Math.sqrt(Math.pow(lente.raio,2) * (1 - Math.pow((obj.posY - lente.posY),2) / Math.pow(lente.tam/2,2)));
    x = (int) Math.sqrt(temp) + xc;
    
    n = lente.posX - x;
    
    if(convergente){
      
      line(obj.posX, obj.posY, /*lente.posX +*/ x-lente.raio /*n*/, obj.posY);
      
      return x-lente.raio;
    }else{
      
      line(obj.posX, obj.posY, lente.posX+lente.raio+n, obj.posY);
      
      return lente.posX+lente.raio+n ;
    }
  }
  
  void interseccaoEspelhoConvergente(){
    float x , y;
   
    /* RETA PARALELA PELO FOCO */
    float iniXA, iniYA;
    float focoX, focoY;
    float mA;
   
    
    strokeWeight(2);
    stroke(255,255,0);    
    /*iniA ponto em que a reta paralela encontra o espelho 
    foco coordenadas do foco do espelho*/
    iniXA = calculaPontoEspelho();
    iniYA = height/2 - obj.tamY;
    focoX = lente.posX - lente.foco();
    focoY = height/2;
    

    
    line(iniXA, iniYA, focoX, focoY);
    
    //coeficiente angular da reta que passa pelo foco
    mA = (iniYA - focoY)/(iniXA - focoX);
    
    /*RETA PELO FOFO*/
    float iniXB, iniYB;
    float centroX, centroY;
    float mB;
    
    /*
    iniB ponto inverso da reta do foco
    */
    iniXB = obj.posX + obj.tamX/2;
    iniYB = height/2 + obj.tamY ;
   // iniXB = (lente.posX + lente.raio) - 1/(1/focoX - 1/((lente.posX + lente.raio) - obj.posX));
    
    centroX = lente.posX;
    centroY = lente.posY;
    
    line(obj.posX, obj.posY, centroX, centroY);

    mB = (iniYB - centroY) / (iniXB - centroX);
    
    iniXB = centroX;
    iniYB = centroY;
    
    x = (iniYB - iniYA - mB*iniXB + mA*iniXA)/(mA - mB);
    //x = (lente.posX + lente.raio) - 1/(1/focoX - 1/((lente.posX + lente.raio) - obj.posX));

    y = mB*(x - iniXB) + iniYB;
    
    /*
    img.tamY = (int)y - height/2;
    img.posY = (int)y - img.tamY;
    img.posX = (int)x - img.tamX/2;
    img.mostra();
    */

    
    System.out.println(x + " "+y);
    
    
    line(focoX, focoY, x, y);
    line(centroX, centroY, x, y);
    
    mostraImagem((int) x, (int) y);  
    
    stroke(255);
    strokeWeight(1);
  }
  
    void interseccaoEspelhoDivergente(){
    float x , y;
   
    /* RETA PARALELA PELO FOCO */
    float iniXA, iniYA;
    float focoX, focoY;
    float mA;
    
    strokeWeight(2);
    stroke(255,255,0);
    /*iniA ponto em que a reta paralela encontra o espelho 
    foco coordenadas do foco do espelho*/
    iniXA = calculaPontoEspelho();
    iniYA = height/2 - obj.tamY;
    focoX = lente.posX + lente.foco()*2 ;
    focoY = height/2;
    
    line(iniXA, iniYA, focoX, focoY);
    
    //coeficiente angular da reta que passa pelo foco
    mA = (iniYA - focoY)/(iniXA - focoX);
    
    /*RETA PELO FOFO*/
    float iniXB, iniYB;
    float centroX, centroY;
    float mB;
    
    /*
    iniB ponto inverso da reta do foco
    */
    iniXB = obj.posX + obj.tamX/2;
    iniYB = height/2 + obj.tamY ;
   // iniXB = (lente.posX + lente.raio) - 1/(1/focoX - 1/((lente.posX + lente.raio) - obj.posX));
    
    centroX = lente.posX;
    centroY = lente.posY;
    
    line(obj.posX, obj.posY, centroX, centroY);

    mB = (iniYB - centroY) / (iniXB - centroX);
    
    iniXB = centroX;
    iniYB = centroY;
    
    x = (iniYB - iniYA - mB*iniXB + mA*iniXA)/(mA - mB);
    //x = (lente.posX + lente.raio) - 1/(1/focoX - 1/((lente.posX + lente.raio) - obj.posX));

    y = mB*(x - iniXB) + iniYB;
    
    /*
    img.tamY = (int)y - height/2;
    img.posY = (int)y - img.tamY;
    img.posX = (int)x - img.tamX/2;
    img.mostra();
    */
    

    
    //stroke(0,255,0);
    line(focoX, focoY, x, y);
    line(centroX, centroY, x, y);
    
    mostraImagem((int) x, (int) y);
    
    stroke(255);
    strokeWeight(1);
  }
  

  void mostraImagem(int x, int y){
    img.tamY = (int)abs(y - height/2);
    
    if(y > height/2) img.posY = (int)y - img.tamY;
    else img.posY = (int)y;
    
    img.posX = (int)x - img.tamX/2;
    img.mostra();    
  }
  
  void mostraFocoRelativo(){
     line(lente.posX - lente.foco()*10 - lente.raio, height/2 - 5, lente.posX - lente.foco()*10 - lente.raio, height/2+5);
     line(lente.posX + lente.foco()*10 + lente.raio, height/2 - 5, lente.posX + lente.foco()*10 + lente.raio, height/2+5);
     
     line(lente.posX +(- lente.foco()*10 - lente.raio)*2, height/2 - 5, lente.posX +(- lente.foco()*10 - lente.raio)*2, height/2+5);
     line(lente.posX + (lente.foco()*10 + lente.raio)*2, height/2 - 5, lente.posX + (lente.foco()*10 + lente.raio)*2, height/2+5);
  }
}