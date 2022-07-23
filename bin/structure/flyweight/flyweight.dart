/*
 Ви можете використовувати шаблон Flyweight, щоб уникнути копіювання однакових даних зображення 
по всій оперативній пам’яті пристрою. 
 У контексті шаблону постійні дані, що поглинають пам’ять, називаються !!!внутрішнім станом!!!, 
даними, до яких кожен об’єкт певного типу потребує доступу в незмінному вигляді. 
 Позиційні дані кожного будинку називають !!!зовнішнім станом!!!, 
оскільки вони часто змінюються подіями, що відбуваються поза екземпляром, 
і можуть бути унікальними для даного екземпляра. 
 За допомогою шаблону Flyweight ви зберігаєте ці типи даних окремо, що дозволяє обробляти їх по-різному.

 внутрішні - спільні об'єкти чи параметри, чи значення
 зовнішні - індивідуальні об'єкти чи параметри, чи значення

 Незмінні дані об’єкта прийнято називати «внутрішнім станом». 
 Всі інші дані — це «зовнішній стан».

 Розділіть поля класу, який стане легковаговиком, на дві частини:

внутрішній стан: значення цих полів однакові для великої кількості об’єктів.
зовнішній стан (контекст): значення полів унікальні для кожного об’єкта.
 */
import 'dart:math';

void main(List<String> args) {
  HouseFactory houses = HouseFactory();

  List<House> factory = [];
  
  factory.add(houses.getHouse("Brick"));
  factory.add(houses.getHouse("Concrete"));
  factory.add(houses.getHouse("Tree"));
  factory.add(houses.getHouse("Brick"));
  factory.add(houses.getHouse("Concrete"));
  factory.add(houses.getHouse("Tree"));
  factory.add(houses.getHouse("Brick"));
  factory.add(houses.getHouse("Concrete"));
  factory.add(houses.getHouse("Tree"));

  print("="*80);

  for(House h in factory){
    int x = Random().nextInt(100)+0;
    int y = Random().nextInt(100)+0;
    h.location(x, y);
  }
  print("="*80);
}
// Flyweight
abstract class House{
  //! Внутрішній, бо спільний для багатьох об'єктів
  int floor;

  House({this.floor = 20});
  
  //! Зовнішній, бо різний для об'єктів
  void location(int x, int y);
}

// Concrete Flyyweights or Contexts: 
class ConcreteHouse extends House{

  @override
  void location(int x, int y) {
    print("Будинок з бетонних блоків; кількість поверхів: $floor; координати: х= $x, у= $y.");
  }
}

class BrickHouse extends House{

  @override
  void location(int x, int y) {
    print("Будинок з цегли; кількість поверхів: $floor; координати: х= $x, у= $y.");
  }
}

class TreeHouse extends House{

  @override
  void location(int x, int y) {
    print("Будинок з дерева; кількість поверхів: $floor; координати: х= $x, у= $y.");
  }
}

// FlyweightFectory
class HouseFactory{
  Map<String,House> houses = {};

  House getHouse(String home){
    House? one = houses[home];
    // ignore: unnecessary_null_comparison
    if(one == null){
      switch(home){
        case "Tree":
          print("Екземпляр дерев'яного будинку створено 1 раз");
          one = TreeHouse();
          break;
        case "Brick":
          print("Екземпляр цегляного будинку створено 1 раз");
          one = BrickHouse();
          break;
        case "Concrete":
          print("Екземпляр бетонного будинку створено 1 раз");
          one = ConcreteHouse();
          break;
        default:
          print("Error");
          break;
      }
        houses.addAll({home:one!});
      }
    return one;
  }
} 
