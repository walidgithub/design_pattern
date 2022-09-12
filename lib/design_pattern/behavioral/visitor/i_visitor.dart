import 'dart:io';

import 'package:design_pattern/design_pattern/behavioral/visitor/files/audio_file.dart';
import 'package:design_pattern/design_pattern/behavioral/visitor/files/image_file.dart';
import 'package:design_pattern/design_pattern/behavioral/visitor/files/test_file.dart';
import 'package:design_pattern/design_pattern/behavioral/visitor/files/video_file.dart';

abstract class IVisitor {
  String getTitle();
  String visitDirectory(Directory directory);
  String visitAudioFile(AudioFile file);
  String visitImageFile(ImageFile file);
  String visitTextFile(TextFile file);
  String visitVideoFile(VideoFile file);
}