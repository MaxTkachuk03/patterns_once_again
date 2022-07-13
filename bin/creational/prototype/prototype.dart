void main(List<String> args) {
  ToyPrototype original = ConcreteToy("Jack");
  
  print("Оригінал: ");
  print(original);
  print("="*10);

  ToyPrototype toyclone = original.clone();

  print("\nКлон: ");
  print(toyclone);
  print("="*10);

  ToyPrototype copy = SubclassToy(20.99);

  print("\nОригінал: ");
  print(copy);
  print("="*10);

  ToyPrototype copyprice = copy.clone();

  print("\nКлон: ");
  print(copyprice);
  print("="*10);
}

//@ interface Prototype
abstract class ToyPrototype{
  ToyPrototype clone();
}

//$ concrete Prototype
class ConcreteToy implements ToyPrototype{
  String? name;

  ConcreteToy(this.name);

  ConcreteToy.clone(ConcreteToy prototype){
    name = prototype.name;
  }

  @override
  ToyPrototype clone() {
    return ConcreteToy.clone(this);
  }

  @override
  String toString() {
    return "Name: $name";
  }
}

//$ concrete Prototype
class SubclassToy extends ToyPrototype{
  double? price;

  SubclassToy(this.price);

  SubclassToy.clone(SubclassToy prototype){
    price = prototype.price;
  }

  @override
  ToyPrototype clone() {
    return SubclassToy.clone(this);
  }

  @override
  String toString() {
    return "Price: $price \$";
  }
}