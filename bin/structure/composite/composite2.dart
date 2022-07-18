void main(List<String> args) {
  IFile audio = Audio("JBL", 34);
  //IFile audio1 = Audio("FMK", 36);
  IFile text = Text("Flutter", 2);
  IFile media = Media("Jack 2006", 134);

  FileProvider provider = FileProvider();
  FileProvider provider1 = FileProvider();

  provider1.addComponent("Audio",audio);
  provider1.addComponent("Text",text);
  provider1.addComponent("Video",media);
  //provider1.addComponent("Audio",audio1);

  provider.addComponent("Container",provider1);
  
  provider.load();
  print("Загальний розмір каталогу: ${provider.getSize()}");

  print("="*38);

  provider.findComponent("Audio"); 
  /** Чи повинен композит відшукувати елемент по коробках 
  поки не знайде його чи велика коробка не знає, що знаходить у вкладеній в ній меншій коробці
  поки до цієї коробки не звернутись?
  */ 
}

//! Component
abstract class IFile{
  void load();
  int getSize();
}

//# LEaf
class Audio implements IFile{
  int size;
  String name;
  
  Audio(this.name,this.size);

  @override
  void load() {
    print("Аудіофайл \"$name\" розміром $size МБ");
  }
  
  @override
  int getSize() {
    return size;
  }
}

//# Leaf
class Media implements IFile{
  int size;
  String name;
  
  Media(this.name,this.size);

  @override
  void load() {
    print("Відеофайл \"$name\" розміром $size МБ");
  }
  
  @override
  int getSize() {
    return size;
  }
}

//# Leaf
class Text implements IFile{
  int size;
  String name;
  
  Text(this.name,this.size);

  @override
  void load() {
    print("Текстовий файл \"$name\" розміром $size МБ");
  }
  
  @override
  int getSize() {
    return size;
  }
}

//& Composite
class FileProvider implements IFile{
  Map<String, IFile> components = {};

  void addComponent(String value, IFile file){
    components.addAll({value: file});
  }

  void deleteComponent(String value, IFile file){
    components.remove({value: file});
  }

  void findComponent(String component){
    if(components.containsKey(component)){
      components[component]!.load();
      //components.entries;
      //print(components.keys.contains(components));
    }
  }

  @override
  void load() {
    components.forEach((key, value) { 
      value.load();
    });
  }
  
  @override
  int getSize() {
    int sum = 0;
    // ignore: avoid_function_literals_in_foreach_calls
    components.forEach((key,element) { 
      sum+=element.getSize();
    });
    return sum;
  }
}