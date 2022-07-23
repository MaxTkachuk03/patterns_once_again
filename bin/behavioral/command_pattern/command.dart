void main(List<String> args) {
//! Спосіб без черг і накопичення команд 
  TV tv = TV();
  Channel channel = Channel(tv, "Indigo");
  RemoteControl remote  = RemoteControl();
  channel.setChannel("NLO TV");
  
  remote.setCommand(channel);
  remote.run();
  remote.cancel();

  print("-"*30);

  Sound sound = Sound(tv, 20);

  remote.setCommand(sound);
  remote.run();
  remote.cancel();

  print("-"*30);

//! Спосіб з чергами і накопиченням команд 
  RemoteHistory commandHistory = RemoteHistory();

  commandHistory.addCommand(sound);
  commandHistory.addCommand(channel);
  
  commandHistory.run();

  print("-"*30);

  commandHistory.undo();
}

//! Invoker 
class RemoteControl{
  Command? command;

  void setCommand(Command ch){
    command = ch;
  }

  void run(){
    command!.execute();
  }

  void cancel(){
    command!.undo();
  }
}

//$ Command 
abstract class Command{
  void execute();
  void undo();
}

//$ Concrete Command
class Channel implements Command{
  String nameGo;
  String nameBack = '';
  TV tv;

  Channel(this.tv,this.nameGo){
    nameBack = nameGo;
  }

  void setChannel(String ch){
    nameGo = ch;
  }

  @override
  void execute() {
    tv.channelGo(nameGo);
  }

  @override
  void undo() {
    tv.channelBack(nameBack);
  }
}

//$ Concrete Command
class Sound implements Command{
  int up;
  int down=0;
  TV tv;

  Sound(this.tv, this.up){
    down = up;
  }

  @override
  void execute() {
    int j = up + 5;
    tv.soundUp(j);
  }

  @override
  void undo() {
    tv.soundDown(down);
  }
}

//& Receiver
class TV{
  void soundUp(int i){
    print("Збільшили звук до $i дБ");
  }

  void soundDown(int i){
    print("Зменшили звук до $i дБ");
  }

  void channelGo(String name){
    print("Перемкнули канал на $name");
  }

  void channelBack(String name){
    print("Повернулись до каналу $name");
  }
}

//! Invoker
// CommandHistory
class RemoteHistory{
  List<Command> commands = [];

  void addCommand(Command command){
    commands.add(command);
  }

  void run(){
    for(Command command in commands){
      command.execute();
    }
  }

  void undo(){
    if(commands.isNotEmpty){
      Command command = commands.removeLast();
      command.undo();
    }
  }
}