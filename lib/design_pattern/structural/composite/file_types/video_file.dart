import '../file_types/file.dart';

class VideoFile extends File {
  const VideoFile({
    required super.title,
    required super.size,
  }) : super(icon: Icons.movie);
}