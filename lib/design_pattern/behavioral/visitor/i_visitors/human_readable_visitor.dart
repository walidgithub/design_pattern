import 'package:design_pattern/design_pattern/behavioral/visitor/files/audio_file.dart';
import 'package:design_pattern/design_pattern/behavioral/visitor/files/image_file.dart';
import 'package:design_pattern/design_pattern/behavioral/visitor/files/test_file.dart';
import 'package:design_pattern/design_pattern/behavioral/visitor/files/video_file.dart';
import 'package:design_pattern/design_pattern/behavioral/visitor/i_file/directory.dart';

import '../i_visitor.dart';

class HumanReadableVisitor implements IVisitor {
  @override
  String getTitle() => 'Export as text';

  @override
  String visitAudioFile(AudioFile file) {
    var fileInfo = <String, String>{
      'Type': 'Audio',
      'Album': file.albumTitle,
      'Extension': file.fileExtension,
      'Size': FileSizeConverter.bytesToString(file.getSize()),
    };

    return _formatFile(file.title, fileInfo);
  }

  @override
  String visitDirectory(Directory directory) {
    String directoryText = "";

    for (var file in directory.files) {
      directoryText += "${file.accept(this)}";
    }

    return directoryText;
  }

  @override
  String visitImageFile(ImageFile file) {
    var fileInfo = <String, String>{
      'Type': 'Image',
      'Resolution': file.resolution,
      'Extension': file.fileExtension,
      'Size': FileSizeConverter.bytesToString(file.getSize()),
    };

    return _formatFile(file.title, fileInfo);
  }

  @override
  String visitTextFile(TextFile file) {
    String fileContentPreview = file.content.length > 30
        ? '${file.content.substring(0, 30)}...'
        : file.content;

    var fileInfo = <String, String>{
      'Type': 'Text',
      'Preview': fileContentPreview,
      'Extension': file.fileExtension,
      'Size': FileSizeConverter.bytesToString(file.getSize()),
    };

    return _formatFile(file.title, fileInfo);
  }

  @override
  String visitVideoFile(VideoFile file) {
    var fileInfo = <String, String>{
      'Type': 'Video',
      'Directed by': file.directedBy,
      'Extension': file.fileExtension,
      'Size': FileSizeConverter.bytesToString(file.getSize()),
    };

    return _formatFile(file.title, fileInfo);
  }

  String _formatFile(String title, Map<String, String> fileInfo) {
    String formattedFile = '$title:\n';

    for (var entry in fileInfo.entries) {
      formattedFile += '${entry.key}: ${entry.value}'.indentAndAddNewLine(2);
    }

    return formattedFile;
  }
}