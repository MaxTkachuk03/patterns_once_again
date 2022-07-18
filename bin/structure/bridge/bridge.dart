void main(List<String> args) {
  HowToMove go = WalkMove("first");
  HowToMove sky = FlyMove(30);
  HowToMove water = SwimMove(3);

  Animal human = Preson(go);
  Animal flyAnimal = Bird(sky);
  Animal fish = Fish(water);

  human.justDoIt();

  print("-"*60);

  flyAnimal.justDoIt();

  print("-"*60);
  
  fish.justDoIt();
}

//! Abstraction
abstract class Animal{
  HowToMove move;

  Animal(this.move);

  void justDoIt();
}

//! Concrete Abstraction
class Preson extends Animal{
  Preson(super.move);

  @override
  void justDoIt() {
    print("Людина ${move.move()}");
  }
}

//! Concrete Abstraction
class Fish extends Animal{
  Fish(super.move);

  @override
  void justDoIt() {
    print("Риба ${move.move()}");
  }
}

//! Concrete Abstraction
class Bird extends Animal{
  Bird(super.move);

  @override
  void justDoIt() {
    print("Пташка ${move.move()}");
  }
}

//# Bridge
abstract class HowToMove{
  String move();
}

//# Concrete Bridge
class WalkMove implements HowToMove{
  String leg;

  WalkMove(this.leg);

  @override
  String move() {
    if(leg == "first"){
      return "йде, рухаючи спочатку ${rightLeg()} потім ${leftLeg()}...";
    }
    else if(leg == "second"){
      return "йде, рухаючи спочатку ${leftLeg()} потім ${rightLeg()}...";
    }
    else{
      return "не з Чорнобиля, в неї тільки дві ноги.";
    }
  }
  String rightLeg(){
    return "правою ногою";
  }
  String leftLeg(){
    return "лівою ногою";
  }
}

//# Concrete Bridge
class SwimMove implements HowToMove{
  int speedd;

  SwimMove(this.speedd);

  @override
  String move() {
    return "пливе, рухаючи плавцями зі швидкістю: ${speed()} км/год...";
  }

  int speed(){
    return speedd;
  }
}

//# Concrete Bridge
class FlyMove implements HowToMove{
  int frq;

  FlyMove(this.frq);

  @override
  String move() {
    return "летить, рухаючи крилами ${frequency()} змахів у хвилину...";
  }

  int frequency(){
    return frq;
  }
}