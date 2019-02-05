




void setup(){
  fullScreen();
  //accSetup();
  appName = this + ""; // preferably act appName... cuz the hex at end changes stimes
  frameRate(60);
  init();
  nextScreen(new Statistics());
  thread("loadAutoSave");
}

String appName;

/*
FAQ
doRender();
backScreen();

*/

int presses;
Time startTime;

String place;

float after;
String type;

float howLong;

public void autoSave(){
  thread("actAutoSave");
}

public void actAutoSave(){
  String rV = "";
  String bar = ":";
  
  //rV += events.autoSave();
  rV += bar;
  
  new FileManager(new String[]{"autoSave", appName, "autoSave.txt"}).setStrings(new String[]{rV});
}

public void loadAutoSave(){
  String[] info = new FileManager(new String[]{"autoSave", appName, "autoSave.txt"}).getStrings();
  if(info.length != 1){
    // WARNING: RETURNS IF !1
    return;
  }
  
  // how is it saved?
  try{
    String[] sp = info[0].split(":");
    int ind = 0;
    
    ind ++;
    
  
  } catch(Exception e){
    
  }
  useProc.doRender();
}



public void init(){
  howLong = 5;
  
  place = "LHals";
  
  FileManager values = new FileManager(
  new String[]{// to set:...
    "Dia",
    "health",
    "puls.txt"
  });//.getStrings();
  String last = values.getStrings(new String[]{
    "20180926-39WEMI1620.06:1619.50:17:"
  })[0];
  String[] sp = last.split(":");
  String cur, c1;
  String ty = "";
  float af = 0;
  for(int i = 0; i < sp.length; i ++){
    cur = sp[i];
    c1 = cur.split(" ")[0];
    if(c1.equals("type")){
      ty = cur.split(" ")[1];
    } else if(c1.equals("after")){
      af = Float.parseFloat(cur.split(" ")[1]);
    }
    
  }
  
  if(!sp[0].equals("ruhe")){
    // after = now - (last - lAfter)
    
    Time aft = new Time(0, 0, 0, 0, (int) af, (int) ((af * 100) % 100));
    //aft.min = (int) af;
    //aft.sec = 0;
    aft = new Time().subTime(new Time().setStringDate(sp[0]).addTime(aft.negate()));
    
    after = aft.min;
    after += aft.sec / 100;
  }
  
  // <= cuz in beginning everything is 0;
  if(after <= 0 || after > 10){
    after = 3;
  }
  
}




