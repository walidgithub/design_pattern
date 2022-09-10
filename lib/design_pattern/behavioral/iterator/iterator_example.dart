
import 'package:design_pattern/design_pattern/behavioral/iterator/tree_collections/breadth_first_tree_collection.dart';
import 'package:design_pattern/design_pattern/behavioral/iterator/tree_collections/depth_first_tree_collection.dart';
import 'package:flutter/material.dart';

import 'graph.dart';
import 'i_tree_collection.dart';

class IteratorExample extends StatefulWidget {
  @override
  _IteratorExampleState createState() => _IteratorExampleState();
}

class _IteratorExampleState extends State<IteratorExample> {
  final List<ITreeCollection> treeCollections = List<ITreeCollection>();

  int _selectedTreeCollectionIndex = 0;
  int _currentNodeIndex = 0;
  bool _isTraversing = false;

  @override
  void initState() {
    super.initState();

    var graph = _buildGraph();
    treeCollections.add(BreadthFirstTreeCollection(graph));
    treeCollections.add(DepthFirstTreeCollection(graph));
  }

  Graph _buildGraph() {
    var graph = Graph();

    graph.addEdge(1, 2);
    graph.addEdge(1, 3);
    graph.addEdge(1, 4);
    graph.addEdge(2, 5);
    graph.addEdge(3, 6);
    graph.addEdge(3, 7);
    graph.addEdge(4, 8);

    return graph;
  }

  void _setSelectedTreeCollectionIndex(int index) {
    setState(() {
      _selectedTreeCollectionIndex = index;
    });
  }

  Future _traverseTree() async {
    _toggleIsTraversing();

    var iterator =
    treeCollections[_selectedTreeCollectionIndex].createIterator();

    while (iterator.hasNext()) {
      setState(() {
        _currentNodeIndex = iterator.getNext();
      });
      await Future.delayed(const Duration(seconds: 1));
    }

    _toggleIsTraversing();
  }

  void _toggleIsTraversing() {
    setState(() {
      _isTraversing = !_isTraversing;
    });
  }

  void _reset() {
    setState(() {
      _currentNodeIndex = 0;
    });
  }

  Color _getBackgroundColor(int index) {
    return _currentNodeIndex == index ? Colors.red[200] : Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
        behavior: ScrollBehavior(),
        child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: LayoutConstants.paddingL),
    child: Column(
    children: <Widget>[
    TreeCollectionSelection(
    treeCollections: treeCollections,
    selectedIndex: _selectedTreeCollectionIndex,
    onChanged:
    !_isTraversing ? _setSelectedTreeCollectionIndex : null,
    ),
    const SizedBox(height: LayoutConstants.spaceL),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          PlatformButton(
            child: Text('Traverse'),
            materialColor: Colors.black,
            materialTextColor: Colors.white,
            onPressed: _currentNodeIndex == 0 ? _traverseTree : null,
          ),
          PlatformButton(
            child: Text('Reset'),
            materialColor: Colors.black,
            materialTextColor: Colors.white,
            onPressed:
            _isTraversing || _currentNodeIndex == 0 ? null : _reset,
          ),
        ],
      ),
      const SizedBox(height: LayoutConstants.spaceL),
      Box(
        nodeId: 1,
        color: _getBackgroundColor(1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Box(
              nodeId: 2,
              color: _getBackgroundColor(2),
              child: Box(
                nodeId: 5,
                color: _getBackgroundColor(5),
              ),
            ),
            Box(
              nodeId: 3,
              color: _getBackgroundColor(3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Box(
                    nodeId: 6,
                    color: _getBackgroundColor(6),
                  ),
                  Box(
                    nodeId: 7,
                    color: _getBackgroundColor(7),
                  ),
                ],
              ),
            ),
            Box(
              nodeId: 4,
              color: _getBackgroundColor(4),
              child: Box(
                nodeId: 8,
                color: _getBackgroundColor(8),
              ),
            ),
          ],
        ),
      ),
    ],
    ),
        ),
    );
  }
}