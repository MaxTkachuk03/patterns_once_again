void main(List<String> args) {
  PepoleBirthdays birthdays = PepoleBirthdays();
  Iterator iterator = ConcreteIterator(birthdays);

  while(iterator.hasMore()){
    iterator.next();
  }

  print("="*20);
  birthdays.addBirthday("Michel", "18.06.2010");
  birthdays.addBirthday("Chloe", "4.08.2017");
  birthdays.addBirthday("Lionel", "24.06.1987");

  while(iterator.hasMore()){
    iterator.next();
  }

  print("="*20);
  iterator.findDate("Cristiano");
}

abstract class Iterator{
  bool hasMore();
  void next();
  void findDate(String name);
}

class ConcreteIterator implements Iterator{
  PepoleBirthdays people;
  int i=0;

  ConcreteIterator(this.people);
  
  @override
  bool hasMore() {
    if(i < people.happy.length){
      return true;
    }
    return false;
  }
  
  @override
  void next() {
      people.happy.forEach((key, value) {
        print("$key: $value");
        i++;
      });
  }

  @override
  void findDate(String name){
    people.happy.forEach((key, value) { 
      if(name==key){
        print("$key: $value");
    }});
  }
}

// Aggregte
abstract class People{
  Iterator createIterator();
}

// ConcreteAggregate
class PepoleBirthdays implements People{
  Map<String,String> happy = {
    "Daniel": "23.07.1992",
    "Jan": "11.04.1998",
    "Cristiano": "05.02.1985",
    "Jack": "08.11.1957",
    "Brad": "29.12.1986"
  };

  void addBirthday(String name,String date){
    happy.addAll({name: date});
  }

  void deleteBirthday(String name,String date){
    happy.remove({name: date});
  }

  @override
  Iterator createIterator() {
    return ConcreteIterator(this);  
  }
}