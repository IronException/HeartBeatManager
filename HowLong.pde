

public class HowLong extends NumPad{
  
  public HowLong(){
    super();
    
    
    name = new String[]{"how long"}; // set
    unit = new String[]{"mins"}; // set
    length = new int[]{2}; // set
    komma = new int[]{2}; // sey
    
    writeValue = remPoint(howLong);
    
    
    refreshType();
    refreshValText();
  }
  
  
  
  public void keyBack(){
    howLong = Float.parseFloat(writeValue);
    
    super.keyBack();
    
  }
  
  public void keyEnter(){
    howLong = Float.parseFloat(writeValue);
    
    
    nextScreen(new ComTag());
  }
  
  
}