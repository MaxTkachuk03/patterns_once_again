void main(List<String> args) {
  ToyPrototype toyoriginal = ConcreteToy("Base Lighter");

  print("Оригінал: ");
  print(toyoriginal);
  print("="*10);

  ToyPrototype toyclone = toyoriginal.clone();

  print("\nКлон: ");
  print(toyclone);
  print("="*10);

  toyclone = SubclassToy("Cowboy",20.99);

  print("\nКлон: ");
  print(toyclone);
  print("="*10);

  print("\nОригінал: ");
  print(toyoriginal);
  print("="*10);

  ToyPrototype toy = SubclassToy("Jack",33.5);

  print("\nОригінал: ");
  print(toy);
  print("="*10);

  ToyPrototype newclone = toy.clone();

  print("\nКлон: ");
  print(newclone);
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

  ConcreteToy.cloneble(ConcreteToy prototype){
    name = prototype.name;
  }

  @override
  ToyPrototype clone() {
    return ConcreteToy.cloneble(this);
  }

  @override
  String toString() {
    return "Name: $name";
  }
}

//$ Subclass Prototype
class SubclassToy extends ConcreteToy{
  double? price;

  SubclassToy(String name, this.price) : super(name);

  SubclassToy.cloneble(SubclassToy prototype) : super.cloneble(prototype){
    name = prototype.name;
    price = prototype.price;
  }

  @override
  ConcreteToy clone() {
    return SubclassToy.cloneble(this);
  }

  @override
  String toString() {
    return "Name: $name" 
    "\nPrice: $price \$";
  }
}