public class Place extends UseProc{
  
  
  public Place(){
    
    String[] pl = new String[]{
      "LHals",
      "RHals",
      "LArm",
      "RArm"
      
    };
    
    places = new Button[pl.length];
    float ySize = height / (pl.length + 1);
    for(int i = 0; i < pl.length; i ++){
      places[i] = new Button();
      places[i].setTxt(pl[i]);
      places[i].setPosSize(0, i * ySize, width, ySize);
      
    }
    
    sace = new Button[]{
      new Button().setTxt("<"),
      new Button().setTxt("change"),
      new Button().setTxt("save")
      
      
    };
    
    yPos = height - ySize;
    float xSize = width / sace.length;
    for(int i = 0; i < sace.length; i ++){
      sace[i].setPosSize(i * xSize, yPos, xSize, ySize);
      
    }
    
    
    body = new FileManager(new String[]{
      
    }).getImg();
    
    xP = width / 2.0;
    yP = yPos / 2.0;
    
  }
  
  Button[] sace;
  
  boolean bod;
  
  float yPos;
  PImage body;
  
  Button[] places;
  
  
  float xP, yP;
  
  
  public void render(){
    
    if(bod){
      image(body, 0, 0, width, yPos);
      
      float spriS = width / 24.0;
      
      stroke(255, 0, 0);
      line(xP - spriS, yP - spriS, xP + spriS, yP + spriS);
      line(xP - spriS, yP + spriS, xP + spriS, yP - spriS);
      stroke(0);
      
      
    } else {
      for(int i = 0; i < places.length; i ++){
        places[i].render();
        
      }
    }
    
    for(int i = 0; i < sace.length; i ++){
      sace[i].render();
      
    }
    
  }
  
  public void tickButtons(){
    if(!bod){
      
      for(int i = 0; i < places.length; i ++){
        if(places[i].tickButton()){
          place = places[i].getTxt();
          backScreen();
        }
        
      }
    }
    
    for(int i = 0; i < sace.length; i ++){
      if(sace[i].tickButton()){
        if(sace[i].getTxt().equals("<")){
          next();
        } else if(sace[i].getTxt().equals("change")){
          bod = !bod;
          doRender();
        } else if(sace[i].getTxt().equals("save")){
          
          next();
        }
        
      }
      
    }
    
  }
  
  public void next(){
    if(bod){
      place = xP + " " + yP;
    }
    backScreen();
  }
  
  public void tickPress(){
    if(bod){
      
      xP = mouseX;
      yP = mouseY;
      
      if(yP > yPos){
        yP = yPos;
      }
      
      doRender();
    }
  }
  
  
  
  
  
  
  
}