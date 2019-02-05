

public class MessPage extends UseProc{
  
  public MessPage(){
    
    buts = new Button[]{
      new TimeCounter(),
      new Button(),
      new Button(),
      new Button()
      
    };
    
    ((TimeCounter) buts[0]).setToWait(new Time(0, 0, 15, 0));
    ((TimeCounter) buts[0]).start();
    startTime = new Time();
    
    presses = -1;
    updatePresses();
    
    buts[2].setTxt("cancel");
    buts[3].setTxt("stop");
    
    
    float ySize = height / (buts.length - 1.0);
    
    for(int i = 0; i < buts.length; i ++){
      buts[i].setPosSize(0, i * ySize, width, ySize);
      
    }
    
    float xSize = width / 2.0;
    int len = buts.length - 2;
    buts[len].setXSize(xSize);
    buts[len + 1].setPosSize(xSize, len * ySize, xSize, ySize);
    
  }
  
  
  Button[] buts;
  //int presses;
  
  /*
    counter
    presses
    cancel/save
    
  */
  
  public void updatePresses(){
    
    presses ++;
    buts[1].setTxt("counted: " + presses);
    
    doRender(); // ?
  }
  
  public void render(){
    
    for(int i = 0; i < buts.length; i ++){
      buts[i].render();
      
    }
    
    
    
  }
  
  
  public void tickButtons(){
    for(int i = 0; i < buts.length; i ++){
      if(buts[i].tickButton()){
        
        if(i == 0 || i == 1){
        //if(buts[i].getTxt().split(": ")[0].equals("counted")){
          updatePresses();
        } else if(buts[i].getTxt().equals("cancel")){
          
          backScreen();
        } else if(buts[i].getTxt().equals("stop")){
          
          
          next();
        }
        
        
      }
      
    }
    
    
  }
  
  
  public void tick(){
    ((TimeCounter) buts[0]).tick();
    
    if(!((TimeCounter) buts[0]).isCounting()){
      next();
    }
  }
  
  
  public void next(){
    
    nextScreen(new Counted());
  }
  
  
  
}