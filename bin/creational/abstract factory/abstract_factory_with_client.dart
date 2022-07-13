void main(List<String> args) {
  Client client = Client(MercedesFactory());
  
  print("="*47);
  
  client.doing();

  print("${"="*47}\n");
}

//! Abstract Factory
abstract class AbstractFactory{
  String name();
  EngineProduct createEngine();
  CarBodyProduct createBody();
  WheelProduct createWheels();
  void wellDone(){
    print("Прекрасну машину ${name()} зібрано!            |");
  }
}

//# Concrete factory
class MercedesFactory extends AbstractFactory{
  @override
  CarBodyProduct createBody() {
    return MercedesCarBodyProduct();
  }

  @override
  EngineProduct createEngine() {
    return MercedesEngineFactory();
  }

  @override
  WheelProduct createWheels() {
    return MercedesWheelProduct();
  }

  @override
  String name() {
    return "Mercedes";
  }
}

//# Concrete factory
class LamborghiniFactory extends AbstractFactory{
  @override
  CarBodyProduct createBody() {
    return LamborghiniCarBodyProduct();
  }

  @override
  EngineProduct createEngine() {
    return LamborghiniEngineProduct();
  }

  @override
  WheelProduct createWheels() {
    return LamborghiniWheelProduct();
  }
  
  @override
  String name() {
    return "Lamborghini";
  }
}

//* Product
abstract class EngineProduct{
  String name();
  void bestEngine(){
    print("Виготовлення потужного ${name()}-двигуна...    |");
  }
}

//$ Concrete product
class MercedesEngineFactory extends EngineProduct{
  
  @override
  String name() {
    return "Mercedes";
  }
}

//$ Concrete product
class LamborghiniEngineProduct extends EngineProduct{
  @override
  String name() {
    return "Lamborghini";
  }
}

//* Product
abstract class CarBodyProduct{
  String name();
  void bestBody(){
    print("Виготовлення оптимального ${name()}-корпусу... |");
  }
}

//$ Concrete product
class MercedesCarBodyProduct extends CarBodyProduct{

  @override
  String name() {
    return "Mercedes";
  }
}

//$ Concrete product
class LamborghiniCarBodyProduct extends CarBodyProduct{

  @override
  String name() {
    return "Lamborghini";
  }
}

//* Product
abstract class WheelProduct{
  String name();
  void bestWheels(){
    print("Виготовлення унікальних ${name()}-коліс...     |");
  }
}

//$ Concrete product
class MercedesWheelProduct extends WheelProduct{

  @override
  String name() {
    return "Mercedes";
  }
}

//$ Concrete product
class LamborghiniWheelProduct extends WheelProduct{

  @override
  String name() {
    return "Lamborghini";
  }
}
//@ Перший спосіб
class Client{
  AbstractFactory car;

  Client(this.car);

  void doing(){
  car.createEngine().bestEngine();
  car.createBody().bestBody();
  car.createWheels().bestWheels();
  car.wellDone();
  }
}

//@ Другий спосіб
// class Client{
//   AbstractFactory car;
//   EngineProduct? engine;
//   late CarBodyProduct body;
//   WheelProduct? wheels;

//   Client(this.car){
//     engine = car.createEngine();
//     body = car.createBody();
//     wheels = car.createWheels();
//   }

//   void doing(){
//   engine!.bestEngine();
//   body.bestBody();
//   wheels!.bestWheels();
//   car.wellDone();
//   }
// }