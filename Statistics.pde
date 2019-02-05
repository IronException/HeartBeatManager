public class Statistics extends UseProc {
  
  
  public Statistics(){
    super();
    
  }
  
  
  public void render(){
    background(255);
    
    new TextManager().setTxt("start").setPosSize(0, 0, width, height).render();
  }
  
  public void tickButtons(){
    
    
    nextScreen(new MessPage());
  }
  
  
  
}