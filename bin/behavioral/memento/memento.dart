void main(List<String> args) {
  EmploymentCenter employmentCenter = EmploymentCenter();
  PesonInfo pesonInfo = PesonInfo();

  employmentCenter.setInfo("Олег", 34, "Інженер");

  print('Зберігаємо в базу даних...\n');

  pesonInfo.addSave(employmentCenter.setSave());

  print("Змінив професію...\n");

  employmentCenter.setInfo("Олег", 34, "Прибиральник");

  print('Зберігаємо в базу даних...\n');

  pesonInfo.addSave(employmentCenter.setSave());

  print("Змінив ім'я...\n");

  employmentCenter.setInfo("Скотт", 34, "Прибиральник");

  print('Зберігаємо в базу даних...\n');

  pesonInfo.addSave(employmentCenter.setSave());

  print('Повернувся,до старого імені, отже, беремо дані з бази...\n');
  
  employmentCenter.getSave(pesonInfo.getSave(1));

  print('Вся інформація в базі:');

  pesonInfo.allInfo();
}

//! Originator
class EmploymentCenter{
  String _name = "";
  int _age = 0;
  String _profession = "";

  void setInfo(String name,int age,String profession){
    _name = name;
    _age = age;
    _profession = profession;

     print('''
    Ім'я пресони: $_name
    Вік людини: $_age
    Професія: $_profession
    ''');
  }

  Snapshot setSave(){
    return Snapshot(_name, _age, _profession);
  }

  void getSave(Snapshot snapshot){
    _name = snapshot.getName();
    _age = snapshot.getAge();
    _profession = snapshot.getProfession();

    print('''
    Ім'я пресони: $_name
    Вік людини: $_age
    Професія: $_profession
    ''');
  }
}

//# Memento
class Snapshot{
  late final String name;
  late final int age;
  late final String profession;

  Snapshot(this.name,this.age,this.profession);

  String getName(){
    return name;
  }

  int getAge(){
    return age;
  }

  String getProfession(){
    return profession;
  }
}

//& Caretaker
class PesonInfo{
  List<Snapshot> info = [];

  Snapshot getSave(int i){
    return info.elementAt(i);
  }

  void addSave(Snapshot snapshot){
    info.add(snapshot);
  }

  void deleteInfo(Snapshot snapshot){
    info.remove(snapshot);
  }

  void allInfo(){
    if(info.isNotEmpty){
      for(Snapshot s in info){
        print('''
        Ім'я пресони: ${s.name}
        Вік людини: ${s.age}
        Професія: ${s.profession}
        ''');
      }
    }
  }
}

