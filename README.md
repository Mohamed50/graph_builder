# 📊 Graph Builder

A highly customizable, interactive Flutter widget for building and visualizing acyclic graphs (like skill trees, organizational charts, or dependency diagrams).

Built on top of [`graphview`](https://pub.dev/packages/graphview), `GraphBuilder` supports:
- ✅ Multiple parents per node (true DAG support)
- 🔍 Pan & Zoom with `InteractiveViewer`
- 🧠 Tap and hover animations
- 📌 Tooltips
- 🧯 Optional cycle detection to prevent invalid graphs

---

## 🚀 Features

- Supports any data model (`<T>`) — just implement `==` and `hashCode`
- Visualize any **Directed Acyclic Graph** with **multiple parents**
- Interactive gestures: zoom, pan, tap, and hover
- Animated scaling on interaction
- Tooltip display for nodes
- Optional cycle detection (helpful for safe game skill trees)

---

## ✨ Example Usage

```dart
final List<SkillModel> rootSkills = [backstab, ambush];

GraphBuilder<SkillModel>(
  data: rootSkills,
  getChildren: (node) => node.dependencies,
  nodeBuilder: (skill) => Container(
    padding: const EdgeInsets.all(8),
    decoration: BoxDecoration(
      color: Colors.indigo.shade700,
      borderRadius: BorderRadius.circular(6),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(skill.name, style: TextStyle(color: Colors.white)),
        Text('Cost: ${skill.cost}', style: TextStyle(color: Colors.white70)),
      ],
    ),
  ),
)
```

---

## 📦 Installation

```yaml
dependencies:
  graph_builder:
    git:
      url: https://github.com/your-username/graph_builder.git
```

---

## 🔧 Constructor Parameters

| Parameter           | Description                                                                 |
|---------------------|-----------------------------------------------------------------------------|
| `data`              | List of root nodes (`List<T>`)                                              |
| `nodeBuilder`       | Function to return a widget for each node                                   |
| `getChildren`       | Function to retrieve children/dependencies of a node                        |
| `width`, `height`   | Canvas dimensions inside the InteractiveViewer                              |
| `siblingSeparation` | Space between sibling nodes (horizontal)                                    |
| `levelSeparation`   | Space between levels (vertical)                                             |
| `boundaryMargin`    | Edge margin inside the viewer                                               |
| `enableCycleCheck`  | Throws an exception if cycles are detected (default: `true`)                |

---

## 📘 License

MIT

---

> Built for flexibility. Perfect for skill trees, progression graphs, or anything DAG-shaped.
