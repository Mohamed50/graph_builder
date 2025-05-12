// lib/graph_builder.dart
// export 'graph_builder_web.dart' if (dart.library.io) 'graph_builder_io.dart';

import 'package:flutter/material.dart';
import 'package:graphview/GraphView.dart';

/// Core widget to render a tree or graph using GraphView
/// **GraphBuilder<T>**
///
/// A generic, interactive graph visualization widget built on top of the `graphview` package.
/// It supports:
///
/// - Rendering any acyclic graph (supports multiple parents)
/// - Zooming and panning using [InteractiveViewer]
/// - Animated scaling and hover effects on node interaction
/// - Tooltip display on hover or long press
/// - Cycle detection (optional)
/// - Custom layout via optional [Algorithm] injection
///
/// **Type Parameters:**
/// - `T`: The type of the node data object. Must implement `==` and `hashCode` properly.
///
/// **Constructor Parameters:**
/// - `data`: List of root nodes to start graph traversal
/// - `nodeBuilder`: Function to build UI for each node from its model object
/// - `getChildren`: Function to get children from a given node
/// - `width`, `height`: Base canvas dimensions (used as a fallback)
/// - `siblingSeparation`, `levelSeparation`: Control node and level spacing
/// - `boundaryMargin`: Margin around the graph to allow panning
/// - `enableCycleCheck`: If true, performs a pre-render cycle validation
/// - `algorithm`: Optional [Algorithm] instance (e.g. [SugiyamaAlgorithm]) to customize layout logic
///
/// Example:
/// ```dart
/// GraphBuilder<MyModel>(
///   data: roots,
///   getChildren: (node) => node.dependencies,
///   nodeBuilder: (node) => MyCustomNodeWidget(node),
///   algorithm: SugiyamaAlgorithm(SugiyamaConfiguration()..orientation = SugiyamaConfiguration.ORIENTATION_LEFT_RIGHT),
/// )
/// ```
class GraphBuilder<T> extends StatelessWidget{
  final List<T> data;
  final Widget Function(T item) nodeBuilder;
  final List<T> Function(T item) getChildren;
  final double width;
  final double height;
  final int siblingSeparation;
  final int levelSeparation;
  final EdgeInsets boundaryMargin;
  final bool enableCycleCheck;
  final Algorithm? algorithm;

  const GraphBuilder({
    super.key,
    required this.data,
    required this.nodeBuilder,
    required this.getChildren,
    this.width = 3000,
    this.height = 3000,
    this.siblingSeparation = 20,
    this.levelSeparation = 30,
    this.boundaryMargin = const EdgeInsets.all(1000),
    this.enableCycleCheck = true,
    this.algorithm,
  });

  @override
  Widget build(BuildContext context) {
    final graph = Graph()..isTree = false; // allow multiple parents
    final Map<T, Node> nodeMap = {};
    final Set<T> visited = {};
    final Set<T> recursionStack = {}; // used for cycle detection

    Node getNode(T item) {
      return nodeMap[item] ??= Node.Id(item);
    }

    bool hasCycle(T node) {
      if (!visited.contains(node)) {
        visited.add(node);
        recursionStack.add(node);

        for (final child in getChildren(node)) {
          if (!visited.contains(child) && hasCycle(child)) {
            return true;
          } else if (recursionStack.contains(child)) {
            return true;
          }
        }
      }
      recursionStack.remove(node);
      return false;
    }

    void addEdges(T parent) {
      final parentNode = getNode(parent);
      graph.addNode(parentNode);

      for (final child in getChildren(parent)) {
        final childNode = getNode(child);
        graph.addNode(childNode);
        graph.addEdge(parentNode, childNode,
            paint: Paint()
              ..color = Colors.grey.shade600
              ..strokeWidth = 2.0
              ..style = PaintingStyle.stroke
              ..strokeCap = StrokeCap.round); // directional edge styling

        if (!visited.contains(child)) {
          visited.add(child);
          addEdges(child);
        }
      }
    }

    if (enableCycleCheck) {
      for (final root in data) {
        if (hasCycle(root)) {
          throw Exception('Cycle detected in graph');
        }
      }
      visited.clear();
    }

    for (final root in data) {
      visited.add(root);
      addEdges(root);
    }

    final builder = algorithm ?? SugiyamaAlgorithm(
      SugiyamaConfiguration()
        ..nodeSeparation = siblingSeparation
        ..levelSeparation = levelSeparation
        ..orientation = SugiyamaConfiguration.ORIENTATION_BOTTOM_TOP
        ..bendPointShape = CurvedBendPointShape(curveLength: 3)
    );

    final nodeCount = nodeMap.length;
    final estimatedWidth = nodeCount * 200;
    final estimatedHeight = (nodeCount / 2).ceil() * 200;

    return SizedBox(
      width: estimatedWidth.toDouble(),
      height: estimatedHeight.toDouble(),
      child: InteractiveViewer(
        constrained: false,
        boundaryMargin: boundaryMargin,
        minScale: 0.01,
        maxScale: 5.6,
        child: GraphView(
          graph: graph,
          algorithm: builder,
          builder: (Node node) {
            final item = node.key!.value as T;
            return Tooltip(
              message: item.toString(),
              child: StatefulBuilder(
                builder: (context, setState) {
                  double scale = 1.0;
                  return MouseRegion(
                    onEnter: (_) => setState(() => scale = 1.1),
                    onExit: (_) => setState(() => scale = 1.0),
                    child: GestureDetector(
                      onTapDown: (_) => setState(() => scale = 1.15),
                      onTapUp: (_) => setState(() => scale = 1.1),
                      onTapCancel: () => setState(() => scale = 1.0),
                      onTap: () => debugPrint('Tapped on node: \$item'),
                      child: AnimatedScale(
                        scale: scale,
                        duration: const Duration(milliseconds: 200),
                        child: nodeBuilder(item),
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
