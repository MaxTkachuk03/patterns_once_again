void main(List<String> args) {
  ButtonsPrototype buttonsPrototype = Buttons(2, 3, "green");
  ButtonsPrototype buttonsPrototype1 = Buttons(-4, 9, "red");
  ButtonsPrototype buttonsPrototype2 = Buttons(0, 6, "yellow");
  ButtonsPrototype buttonsPrototype3 = Buttons(5, 8, "red");

  ButtonsPrototypeRegystry regystry = ButtonsPrototypeRegystry();

  regystry.addButton(buttonsPrototype);
  regystry.addButton(buttonsPrototype3);
  regystry.addButton(buttonsPrototype1);
  regystry.addButton(buttonsPrototype2);

  ButtonsPrototype newbuttonsPrototype = regystry.getCloneByColor("yellow");
  print("Список потрібних клонів: ");
  //print(regystry.getCloneByColor("red"));
  print(newbuttonsPrototype);

  // print("-----------");
  // print(regystry);
}

abstract class ButtonsPrototype{
  String getColor();
  ButtonsPrototype clone();
}

class Buttons implements ButtonsPrototype{
  int? x,y;
  late String color;

  Buttons(this.x, this.y, this.color);

  Buttons.clonable(Buttons prototype){
    x = prototype.x;
    y = prototype.y;
    color = prototype.color;
  }

  @override
  ButtonsPrototype clone() {
    return Buttons.clonable(this);
  }

  @override
  String getColor() {
    return color;
  }

  @override
  String toString() {
    return "\n${"="*19}"
    "\n| Координата х: $x "
    "\n| Координата у: $y "
    "\n| Колір: $color    "
    "\n${"="*19}";
  }
}

class ButtonsPrototypeRegystry{
  List<ButtonsPrototype> buttons = [];

  void addButton(ButtonsPrototype prototype){
    buttons.add(prototype);
    //clones.addAll({key: prototype});
  }

  ButtonsPrototype getCloneByColor(String color){
    for(ButtonsPrototype value in buttons) {
      if(value.getColor() == color) {
        return value.clone();
      }
    } 
    return Buttons(0, 0, "Немаємо такого кольору!");
  }
  @override
  String toString() {
    return "Cписок клонів:${buttons.toString().replaceAll('[', '').replaceAll(']', '')}";
  }
}