void main(List<String> args) {
  TrafficLights light = TrafficLights();

  light.setState(Red());
  int k=0;

  while(k<10){
    if(k%3==0){
      print("="*30);
    }
    light.switching();
    light.nextColor();
    k++;
  }
  
}

// Context
class TrafficLights {
  Switcher? light;

  void setState(Switcher traffic){
    light=traffic;
  }

  void nextColor(){
    if(light is Red){
      light = Yellow();
    }
    else if(light is Yellow){ 
      light = Green();
    }
    else if(light is Green){ 
      light = Red();
    }
  }
  
  void switching(){
    light?.color();
  }
}

// State
abstract class Switcher{
  void color();
}

// Concrete State
class Red implements Switcher{
  @override
  void color() {
    print("На світлофорі червоний колір");
  }
}

// Concrete State
class Yellow implements Switcher{
  @override
  void color() {
    print("На світлофорі жовтий колір");
  }
}

// Concrete State
class Green implements Switcher{
  @override
  void color() {
    print("На світлофорі зелений колір");
  }
}
