void main(List<String> args) {
  ConcreteMediator mediator = ConcreteMediator();
  Components admin = Admin(mediator);
  Components user  = User(mediator);
  Components developer = Developer(mediator);

  mediator.addComponent(developer);
  mediator.addComponent(admin);
  mediator.addComponent(user);
  //mediator.notify("Всі неполадки виправлено", developer);

  //developer.sendMessage("Всі неполадки виправлено!");
  print("="*20);
  admin.sendMessage("Чат відкрито...");
  print("="*20);
  user.sendMessage("Привіт!");
}

abstract class Mediator{
  void notify(String message, Components component);
}

class ConcreteMediator implements Mediator{
  List<Components> comp = [];
  void addComponent(Components component){
    comp.add(component);
  }
  // Admin admin = Admin(ConcreteMediator());
  // User user = User(ConcreteMediator());
  // Developer developer = Developer(ConcreteMediator());

  @override
  void notify(String message, Components component) {
    for(Components c in comp){
      if(c!= component){
        c.getMessage(message);
      }
    }
    //component.getMessage(message);

    // if(Admin(this) == component){
    //   User(this).getMessage(message);
    // }
    // if(Developer(this) == component){
    //   Admin(this).getMessage(message);
    //   User(this).getMessage(message);
    // }
    // if(component == User(this)){
    //   User(this).getMessage(message);
    // }
  }
}

abstract class Components{
  Mediator mediator;

  Components(this.mediator);

  void sendMessage(String message){
    mediator.notify(message, this);
  }

  void getMessage(String message);
}

class Admin extends Components{
  // Mediator mediator;
  // Admin(this.mediator);
  Admin(super.mediator);

  @override
  void getMessage(String message) {
    print("Адмін отримав повідомлення: $message");
  }
  
  // @override
  // void sendMessage(String message) {
  //   mediator.notify(message, this);
  // }
}

class User extends Components{
  // Mediator mediator;
  // User(this.mediator);
  User(super.mediator);

  @override
  void getMessage(String message) {
    print("Користувач отримав повідомлення: $message");
  }
  
  // @override
  // void sendMessage(String message) {
  //   mediator.notify(message, this);
  // }
}

class Developer extends Components{
  // Mediator mediator;
  // Developer(this.mediator);
  Developer(super.mediator);

  @override
  void getMessage(String message) {
    print("Розробник отримав повідомлення: $message");
  }
  
  // @override
  // void sendMessage(String message) {
  //   mediator.notify(message, this);
  // }
}