import 'package:flutter/material.dart';
import 'package:graph_builder/graph_builder.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GraphBuilder Demo',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Skill Tree Example')),
        body: const Padding(
          padding: EdgeInsets.all(16.0),
          child: SkillGraphDemo(),
        ),
      ),
    );
  }
}

class SkillModel {
  final String id;
  final String name;
  final List<SkillModel> dependencies;

  SkillModel({required this.id, required this.name, this.dependencies = const []});

  @override
  String toString() => name;

  @override
  bool operator ==(Object other) => other is SkillModel && other.id == id;

  @override
  int get hashCode => id.hashCode;
}

class SkillGraphDemo extends StatelessWidget {
  const SkillGraphDemo({super.key});

  @override
  Widget build(BuildContext context) {
    final assassination = SkillModel(id: '069', name: 'Assassination');
    final backlash = SkillModel(id: '015', name: 'Backlash', dependencies: [assassination]);
    final ambush = SkillModel(id: '019', name: 'Ambush', dependencies: [backlash]);
    final adrenaline = SkillModel(id: '003', name: 'Adrenaline');
    final backstab = SkillModel(id: '001', name: 'Backstab', dependencies: [adrenaline]);

    final skills = [ambush, backstab];

    return GraphBuilder<SkillModel>(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      data: skills,
      getChildren: (skill) => skill.dependencies,
      nodeBuilder: (skill) => Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 4)],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(skill.name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text('ID: ${skill.id}', style: const TextStyle(color: Colors.white70, fontSize: 12)),
          ],
        ),
      ),
    );
  }
}
