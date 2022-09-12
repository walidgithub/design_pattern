import 'dart:io';

import '../i_visitor.dart';

class ImageFile extends File {
  final String resolution;

  const ImageFile({
    required this.resolution,
    required super.title,
    required super.fileExtension,
    required super.size,
  }) : super(icon: Icons.image);

  @override
  String accept(IVisitor visitor) {
    return visitor.visitImageFile(this);
  }
}