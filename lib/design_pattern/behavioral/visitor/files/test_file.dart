import 'dart:io';

import '../i_visitor.dart';

class TextFile extends File {
  final String content;

  const TextFile({
    required this.content,
    required super.title,
    required super.fileExtension,
    required super.size,
  }) : super(icon: Icons.description);

  @override
  String accept(IVisitor visitor) {
    return visitor.visitTextFile(this);
  }
}