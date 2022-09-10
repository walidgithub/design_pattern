import '../graph.dart';
import '../i_tree_collection.dart';
import '../i_tree_iteraotr.dart';
import '../tree_iterators/breadth_first_iterator.dart';

class BreadthFirstTreeCollection implements ITreeCollection {
  final Graph graph;

  const BreadthFirstTreeCollection(this.graph);

  @override
  ITreeIterator createIterator() {
    return BreadthFirstIterator(this);
  }

  @override
  String getTitle() {
    return 'Breadth-first';
  }
}