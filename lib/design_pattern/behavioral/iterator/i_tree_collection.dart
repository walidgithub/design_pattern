import 'i_tree_iteraotr.dart';

abstract class ITreeCollection {
  ITreeIterator createIterator();
  String getTitle();
}