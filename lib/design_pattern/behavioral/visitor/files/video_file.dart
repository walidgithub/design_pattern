import 'dart:io';

import '../i_visitor.dart';

class VideoFile extends File {
  final String directedBy;

  const VideoFile({
    required this.directedBy,
    required super.title,
    required super.fileExtension,
    required super.size,
  }) : super(icon: Icons.movie);

  @override
  String accept(IVisitor visitor) {
    return visitor.visitVideoFile(this);
  }
}