void main(List<String> args) {
  PresonPrototype person = PresonPrototype(
    name: "Сергій", 
    age: 34, 
    liveplace: "Оттава");

  print("Оригінал: ");
  print("="*25);
  print(person);
  print("="*25);

  PresonPrototype personClone = person.clone();

  print("\nКлон: ");
  print("="*25);
  print(personClone);
  print("="*25);

  person = PresonPrototype(name: "Ольга", age: 40, liveplace: "Гамбург");

  print("\nОригінал: ");
  print("="*25);
  print(person);
  print("="*25);

  print("\nКлон: ");
  print("="*25);
  print(personClone);
  print("="*25);

  personClone = PresonPrototype(name: "Кирило", age: 24, liveplace: "Бірмінгем");

  print("\nКлон: ");
  print("="*25);
  print(personClone);
  print("="*25);

  print("\nОригінал: ");
  print("="*25);
  print(person);
  print("="*25);
}


class PresonPrototype{
  String name;
  int age;
  String liveplace;

  PresonPrototype({
    required this.name,
    required this.age, 
    required this.liveplace});

  PresonPrototype clone(){
    return PresonPrototype(name: name, age: age, liveplace: liveplace);
  }

  @override
  String toString() {
    return "Ім'я: $name"
    "\nВік: $age"
    "\nМісце проживання: $liveplace";
  }
}