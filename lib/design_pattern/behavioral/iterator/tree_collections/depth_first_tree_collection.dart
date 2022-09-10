import '../graph.dart';
import '../i_tree_collection.dart';
import '../i_tree_iteraotr.dart';
import '../tree_iterators/depth_first_iterator.dart';

class DepthFirstTreeCollection implements ITreeCollection {
  final Graph graph;

  const DepthFirstTreeCollection(this.graph);

  @override
  ITreeIterator createIterator() {
    return DepthFirstIterator(this);
  }

  @override
  String getTitle() {
    return 'Depth-first';
  }
}