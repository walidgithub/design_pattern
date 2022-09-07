import 'dart:io';

import 'package:flutter/material.dart';

import 'file_types/audio_file.dart';
import 'file_types/image_file.dart';
import 'file_types/text_file.dart';
import 'file_types/video_file.dart';

class CompositeExample extends StatelessWidget {
  const CompositeExample();

  Widget _buildMediaDirectory() {
    final musicDirectory = Directory('Music');
    musicDirectory.addFile(
      AudioFile(title: 'Darude - Sandstorm.mp3', size: 2612453),
    );
    musicDirectory.addFile(
      AudioFile(title: 'Toto - Africa.mp3', size: 3219811),
    );
    musicDirectory.addFile(
      AudioFile(title: 'Bag Raiders - Shooting Stars.mp3', size: 3811214),
    );

    final moviesDirectory = Directory('Movies');

    moviesDirectory.addFile(
      VideoFile(title: 'The Matrix.avi', size: 951495532),
    );
    moviesDirectory.addFile(
      VideoFile(title: 'The Matrix Reloaded.mp4', size: 1251495532),
    );
    final catPicturesDirectory = Directory('Cats');
    catPicturesDirectory.addFile(
      ImageFile(title: 'Cat 1.jpg', size: 844497),
    );
    catPicturesDirectory.addFile(
      ImageFile(title: 'Cat 2.jpg', size: 975363),
    );
    catPicturesDirectory.addFile(
      ImageFile(title: 'Cat 3.png', size: 1975363),
    );

    final picturesDirectory = Directory('Pictures');
    picturesDirectory.addFile(catPicturesDirectory);
    picturesDirectory.addFile(
      ImageFile(title: 'Not a cat.png', size: 2971361),
    );

    final mediaDirectory = Directory('Media', isInitiallyExpanded: true);
    mediaDirectory.addFile(musicDirectory);
    mediaDirectory.addFile(moviesDirectory);
    mediaDirectory.addFile(picturesDirectory);
    mediaDirectory.addFile(Directory('New Folder'));
    mediaDirectory.addFile(
      TextFile(title: 'Nothing suspicious there.txt', size: 430791),
    );
    mediaDirectory.addFile(
      TextFile(title: 'TeamTrees.txt', size: 104),
    );

    return mediaDirectory;
  }

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: const ScrollBehavior(),
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: LayoutConstants.paddingL,
        ),
        child: _buildMediaDirectory(),
      ),
    );
  }
}
