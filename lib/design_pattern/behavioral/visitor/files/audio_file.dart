import 'dart:io';

import 'package:design_pattern/design_pattern/behavioral/visitor/i_visitor.dart';

class AudioFile extends File {
  final String? albumTitle;

  const AudioFile({
    this.albumTitle,
    required super.title,
    required super.fileExtension,
    required super.size,
  }) : super(icon: Icons.music_note);

  @override
  String accept(IVisitor visitor) {
    return visitor.visitAudioFile(this);
  }
}