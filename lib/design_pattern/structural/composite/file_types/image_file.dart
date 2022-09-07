import '../file.dart';

class ImageFile extends File {
  const ImageFile({
    required super.title,
    required super.size,
  }) : super(icon: Icons.image);
}