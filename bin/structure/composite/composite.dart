void main(List<String> args) {
  IFile audio = Audio("JBL", 34);
  IFile text = Text("Flutter", 2);
  IFile media = Media("Jack 2006", 134);

  FileProvider provider = FileProvider();
  FileProvider provider1 = FileProvider();

  provider1.addComponent(audio);
  provider1.addComponent(text);
  provider1.addComponent(media);

  provider.addComponent(provider1);
  
  provider.load();
  print("Загальний розмір каталогу: ${provider.getSize()}");
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
  List<IFile> components = [];

  void addComponent(IFile file){
    components.add(file);
  }

  void deleteComponent(IFile file){
    components.remove(file);
  }
  
  @override
  void load() {
    for (int i=0;i<components.length;i++) {
      components[i].load();
    }
    // for (var element in components) {
    //   element.load();
    // }
  }
  
  @override
  int getSize() {
    int sum = 0;
    // ignore: avoid_function_literals_in_foreach_calls
    components.forEach((element) { 
      sum+=element.getSize();
    });
    return sum;
  }
}