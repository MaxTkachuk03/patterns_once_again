// ignore_for_file: file_names
void main(List<String> args) {
  //IIconAdapter adapt1 = ImageJPEGAdapter();
  IIconAdapter bit = ImagePNGAdapter();
  print(bit.getImage());
}

class ImageBITMAP{
    String whichFormat;
    String name;
    String height,width;

    ImageBITMAP({
      required this.whichFormat,
      required this.name,
      required this.height,
      required this.width
    });

    @override
    String toString() {
      return'''
      З якого форматуємо: $whichFormat,
      Назва картинки: $name,
      Висота: $height,
      Ширина: $width
      ''';
    }
}

abstract class IIconAdapter{
  ImageBITMAP getImage();
}

class ImageJPEGAdapter implements IIconAdapter{
  ImageJPEG icon = ImageJPEG();
  
  
  @override
  ImageBITMAP getImage() {
    String imagelist = icon.iconJPEGFormat();
    return ImageBITMAP(
      whichFormat: imagelist.substring(8,12),//.split("format:")[1].toString(),
      name: imagelist.substring(24,32),
      height: imagelist.substring(46,49), 
      width: imagelist.substring(62,65));//imagelist);
  }
  
}

class ImagePNGAdapter implements IIconAdapter{
  ImagePNG icon = ImagePNG();
  
  @override
  ImageBITMAP getImage() {
    String imagelist = icon.iconPNGFormat();
    return ImageBITMAP(
      whichFormat: imagelist.substring(8,11),//.split("format:")[1].toString(),
      name: imagelist.substring(23,26),
      height: imagelist.substring(40,43), 
      width: imagelist.substring(56,59));//imagelist);
  }
}

class ImageJPEG{
  String iconJPEGFormat(){
    return '''format: JPEG,
    name: Football,
    height: 100,
    width: 100,
    ''';
  }
}

class ImagePNG{
  String iconPNGFormat(){
    return '''format: PNG,
    name: UFC,
    height: 354,
    width: 256,
    ''';
  }
}