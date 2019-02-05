

public class Params extends UseProc{
  
  
  public Params(){
    
    int len = 6;
    
    buts = new Button[len];
    
    len --;
    float ySize = height / len;
    float xSize = width / 2.0;
    
    int ind = 0;
    
    buts[ind] = new Button();
    buts[ind].setTxt("place: " + place); // -> <-
    buts[ind].setPosSize(0, 0, width, ySize);
    buts[ind].setCol(220);
    ind ++;
    
    
    buts[ind] = new Button();
    buts[ind].setTxt("ruhe"); // -> <-
    buts[ind].setPosSize(0, ySize, width, ySize);
    ind ++;
    
    
    buts[ind] = new Button();
    buts[ind].setTxt("direct after"); // -> <-
    buts[ind].setPosSize(0, 2.0 * ySize, width, ySize);
    ind ++;
    
    // radioPannel
    radio = ind;
    initRadio(ySize);
    ind ++;
    
    
    
    buts[ind] = new Button();
    buts[ind].setTxt("<"); // -> <-
    buts[ind].setPosSize(0, 4.0 * ySize, xSize, ySize);
    ind ++;
    
    buts[ind] = new Button();
    buts[ind].setTxt("save"); // -> <-
    buts[ind].setPosSize(xSize, 4.0 * ySize, xSize, ySize);
    ind ++;
    
    
    
  }
  
  /*
    
    before?
    
    ran: time
    
    how long after
    -> time finished (last saved (if !before)|| app started)
    -> time till now
    
    
    
  */
  
  
  int radio;
  
  Button[] buts;
  
  public void render(){
    
    for(int i = 0; i < buts.length; i ++){
      buts[i].render();
      
    }
    
    
    ((RadioButton) buts[radio]).afterRender();
    
    
  }
  
  
  public void tickButtons(){
    for(int i = 0; i < buts.length; i ++){
      if(buts[i].tickButton()){
        
        if(buts[i].getTxt().equals("ruhe")){
          // TODO save sth
          type = "ruhe";
          nextScreen(new ComTag());
        } else if(buts[i].getTxt().equals("direct after")){
          // TODO save sth
          type = "dAfter";
          after = 0;
          nextScreen(new HowLong());
        } else if(i == radio){
          // I think 0
          
        } else if(buts[i].getTxt().equals("<")){
          // TODO autoSave
          backScreen();
        } else if(buts[i].getTxt().equals("save")){
          // TODO save radioInfo
          type = "after";
          nextScreen(new HowLong());
        } else if(buts[i].getTxt().split(": ")[0].equals("place")){
          // TODO save radioInfo
          //type = "after";
          nextScreen(new Place());
        }
        
        
      }
      
    }
    
    
  }
  
  
  public void initRadio(float ySize){
    
    // TODO what time to set (get info from kast post)
    // -> did in asketch
    
    buts[radio] = new RadioButton();
    buts[radio].setTxt("how long after: " + remPoint(after) + " mins"); // -> <-
    buts[radio].setPosSize(0, 3.0 * ySize, width, ySize);
    buts[radio].setCol(240);
    
    ((RadioButton) buts[radio]).setLine(after * 100.0 / 10.0);
    
    
    
  }
  
  public void tickPress(){
    ((RadioButton) buts[radio]).tickPress();
    
    
    float line = ((RadioButton) buts[radio]).getLine();
    after = line * 10.0 / 100.0;
    buts[radio].setTxt(remPoint(after) + " mins after sp"); // -> <-
    
  }
  
  
  public void tickRelease(){
    ((RadioButton) buts[radio]).tickRelease();
    // maybe tickRelease too
  }
  
  public void onBackScreen(){
    
    buts[0].setTxt("place: " + place);
    super.onBackScreen();
  }
  
}