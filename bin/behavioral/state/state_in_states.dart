void main(List<String> args) {
  TrafficLights light = TrafficLights();

  light.setState(Red());
  int k=0;

  while(k<10){
    if(k%3==0){
      print("="*30);
    }
    light.go();
    k++;
  }
  
}

// Context
class TrafficLights {
  Switcher? light;

  void setState(Switcher traffic){
    light=traffic;
  }

  void go(){
    light?.color(this);
  }
}

// State
abstract class Switcher{
  void color(TrafficLights lights);
}

// Concrete State
class Red implements Switcher{
  @override
  void color(TrafficLights lights) {
    print("На світлофорі червоний колір");
    lights.setState(Yellow());
  }
}

// Concrete State
class Yellow implements Switcher{
  @override
  void color(TrafficLights lights) {
    print("На світлофорі жовтий колір");
    lights.setState(Green());
  }
}

// Concrete State
class Green implements Switcher{
  @override
  void color(TrafficLights lights) {
    print("На світлофорі зелений колір");
    lights.setState(Red());
  }
}