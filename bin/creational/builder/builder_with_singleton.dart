void main(List<String> args) {
  HouseBuilder houseBuilder = HouseBuilder();
  houseBuilder.setMainMaterial(MainMaterial.concrete);
  houseBuilder.setPrice(20000000);
  houseBuilder.build();
  
  print(houseBuilder);

  print("+"*50);

  HouseBuilder newhouseBuilder = HouseBuilder();
  newhouseBuilder.setMainMaterial(MainMaterial.concrete);
  newhouseBuilder.setPrice(20000000);
  newhouseBuilder.setSize(Size.large);
  newhouseBuilder.build();

  print(newhouseBuilder);

  print("+"*50);

  print("Перевіримо чи екземпляр дійсно один: ");
  print(identical(houseBuilder, newhouseBuilder));
}

enum Size{ large, small, middle}

enum MainMaterial{ brick, concrete, tree}

class HouseBuilder{
  static HouseBuilder? _house;
  Size size = Size.small;
  MainMaterial? mainMaterial;
  int? price;

  HouseBuilder._init(){
    _house = this;
  }

  factory HouseBuilder() => _house ??= HouseBuilder._init();

  void setMainMaterial(MainMaterial m) {
    mainMaterial = m;
  }

  void setPrice(int p) {
    price = p;
  }

  void setSize(Size s) {
    size = s;
  }

  void build() {
    setSize(size);
    setMainMaterial(mainMaterial!);
    setPrice(price!);
  }

  @override
  String toString() {
    return "Розмір: ${size.toString().split(".")[1]}" 
    "\nМатеріал з якого побудований будинок: ${mainMaterial.toString().split(".")[1]}" 
    "\nЦіна будинку: $price \$";
  }
}
