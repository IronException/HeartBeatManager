

public class Counted extends NumPad{
  
  public Counted(){
    super();
    
    cool = new Cooldown(frameRate * 2);
    
    name = new String[]{"counted"}; // set
    unit = new String[]{"beats"}; // set
    length = new int[]{2}; // set
    komma = new int[]{0}; // sey
    
    writeValue = presses + "";
    
    refreshType();
    refreshValText();
  }
  
  
  public void refreshValText(){
    String txt = name[setInd] + ": " + writeValue + " " + unit[setInd];
    try{
      int n = (int) Float.parseFloat(writeValue);
      txt += " -> " + (n * 4);
    } catch(Exception e){}
    
    valText = new TextPanel(txt, 0, yButtonSize, width, yButtonSize, width/12);
    // TODO sizes for keyValue()...
    
    valPos[0] = width / 2 - textWidth(txt) / 2; // namePos
    valPos[1] = valPos[0] + textWidth(name[setInd] + ":"); // valPos
    valPos[2] = valPos[1] + textWidth(writeValue + "  "); // unitPos
    valPos[3] = valPos[2] + textWidth(unit[setInd]); // voidPos
    
  }
  
  
  public void keyBack(){
    presses = Integer.parseInt(writeValue);
    
    
    super.keyBack();
  }
  
  
  public void keyEnter(){
    presses = Integer.parseInt(writeValue);
    
    
    nextScreen(new Params());
  }
  
  
}