import 'package:flutter/material.dart';
import 'package:graph_builder/graph_builder.dart';
import 'package:graph_builder_example/skill_model.dart';

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

class SkillGraphDemo extends StatelessWidget {
  const SkillGraphDemo({super.key});

  @override
  Widget build(BuildContext context) {
    final json = [{"name":"Backstab","key":"SKILL_001","cost":0,"tactic":"offensive","tactic_value":"an offensive","dependencies":[]},{"name":"Riposte","key":"SKILL_012","cost":0,"tactic":"reaction","tactic_value":"Reaction","dependencies":[]},{"name":"Lightning Attack","key":"SKILL_010","cost":0,"tactic":"reaction","tactic_value":"Reaction","dependencies":[]},{"name":"Opportunity Attack","key":"SKILL_011","cost":0,"tactic":"reaction","tactic_value":"Reaction","dependencies":[]},{"name":"Good Fortune","key":"SKILL_018","cost":1,"tactic":"tactic","tactic_value":"Tactic","dependencies":[]},{"name":"Group Attack","key":"SKILL_014","cost":1,"tactic":"tactic","tactic_value":"Tactic","dependencies":[{"name":"Good Fortune","key":"SKILL_018","cost":1,"tactic":"tactic","tactic_value":"Tactic","dependencies":[]}]},{"name":"Adrenaline","key":"SKILL_003","cost":1,"tactic":"tactic","tactic_value":"Tactic","dependencies":[{"name":"Group Attack","key":"SKILL_014","cost":1,"tactic":"tactic","tactic_value":"Tactic","dependencies":[{"name":"Good Fortune","key":"SKILL_018","cost":1,"tactic":"tactic","tactic_value":"Tactic","dependencies":[]}]}]},{"name":"Power","key":"SKILL_004","cost":2,"tactic":"offensive","tactic_value":"an offensive","dependencies":[{"name":"Adrenaline","key":"SKILL_003","cost":1,"tactic":"tactic","tactic_value":"Tactic","dependencies":[{"name":"Group Attack","key":"SKILL_014","cost":1,"tactic":"tactic","tactic_value":"Tactic","dependencies":[{"name":"Good Fortune","key":"SKILL_018","cost":1,"tactic":"tactic","tactic_value":"Tactic","dependencies":[]}]}]}]},{"name":"Robustness","key":"SKILL_005","cost":2,"tactic":"defensive","tactic_value":"Defensive","dependencies":[{"name":"Adrenaline","key":"SKILL_003","cost":1,"tactic":"tactic","tactic_value":"Tactic","dependencies":[{"name":"Group Attack","key":"SKILL_014","cost":1,"tactic":"tactic","tactic_value":"Tactic","dependencies":[{"name":"Good Fortune","key":"SKILL_018","cost":1,"tactic":"tactic","tactic_value":"Tactic","dependencies":[]}]}]}]},{"name":"Valor","key":"SKILL_046","cost":2,"tactic":"magic","tactic_value":"Magic","dependencies":[{"name":"Adrenaline","key":"SKILL_003","cost":1,"tactic":"tactic","tactic_value":"Tactic","dependencies":[{"name":"Group Attack","key":"SKILL_014","cost":1,"tactic":"tactic","tactic_value":"Tactic","dependencies":[{"name":"Good Fortune","key":"SKILL_018","cost":1,"tactic":"tactic","tactic_value":"Tactic","dependencies":[]}]}]}]},{"name":"Chained Attack","key":"SKILL_008","cost":1,"tactic":"offensive","tactic_value":"an offensive","dependencies":[{"name":"Power","key":"SKILL_004","cost":2,"tactic":"offensive","tactic_value":"an offensive","dependencies":[{"name":"Adrenaline","key":"SKILL_003","cost":1,"tactic":"tactic","tactic_value":"Tactic","dependencies":[{"name":"Group Attack","key":"SKILL_014","cost":1,"tactic":"tactic","tactic_value":"Tactic","dependencies":[{"name":"Good Fortune","key":"SKILL_018","cost":1,"tactic":"tactic","tactic_value":"Tactic","dependencies":[]}]}]}]}]},{"name":"Controlled Attack","key":"SKILL_006","cost":1,"tactic":"offensive","tactic_value":"an offensive","dependencies":[{"name":"Power","key":"SKILL_004","cost":2,"tactic":"offensive","tactic_value":"an offensive","dependencies":[{"name":"Adrenaline","key":"SKILL_003","cost":1,"tactic":"tactic","tactic_value":"Tactic","dependencies":[{"name":"Group Attack","key":"SKILL_014","cost":1,"tactic":"tactic","tactic_value":"Tactic","dependencies":[{"name":"Good Fortune","key":"SKILL_018","cost":1,"tactic":"tactic","tactic_value":"Tactic","dependencies":[]}]}]}]}]},{"name":"Sneak Attack","key":"SKILL_002","cost":1,"tactic":"offensive","tactic_value":"an offensive","dependencies":[{"name":"Controlled Attack","key":"SKILL_006","cost":1,"tactic":"offensive","tactic_value":"an offensive","dependencies":[{"name":"Power","key":"SKILL_004","cost":2,"tactic":"offensive","tactic_value":"an offensive","dependencies":[{"name":"Adrenaline","key":"SKILL_003","cost":1,"tactic":"tactic","tactic_value":"Tactic","dependencies":[{"name":"Group Attack","key":"SKILL_014","cost":1,"tactic":"tactic","tactic_value":"Tactic","dependencies":[{"name":"Good Fortune","key":"SKILL_018","cost":1,"tactic":"tactic","tactic_value":"Tactic","dependencies":[]}]}]}]}]}]},{"name":"Circular Attack","key":"SKILL_009","cost":1,"tactic":"offensive","tactic_value":"an offensive","dependencies":[{"name":"Sneak Attack","key":"SKILL_002","cost":1,"tactic":"offensive","tactic_value":"an offensive","dependencies":[{"name":"Controlled Attack","key":"SKILL_006","cost":1,"tactic":"offensive","tactic_value":"an offensive","dependencies":[{"name":"Power","key":"SKILL_004","cost":2,"tactic":"offensive","tactic_value":"an offensive","dependencies":[{"name":"Adrenaline","key":"SKILL_003","cost":1,"tactic":"tactic","tactic_value":"Tactic","dependencies":[{"name":"Group Attack","key":"SKILL_014","cost":1,"tactic":"tactic","tactic_value":"Tactic","dependencies":[{"name":"Good Fortune","key":"SKILL_018","cost":1,"tactic":"tactic","tactic_value":"Tactic","dependencies":[]}]}]}]}]}]},{"name":"Chained Attack","key":"SKILL_008","cost":1,"tactic":"offensive","tactic_value":"an offensive","dependencies":[{"name":"Power","key":"SKILL_004","cost":2,"tactic":"offensive","tactic_value":"an offensive","dependencies":[]}]}]},{"name":"Rage","key":"SKILL_047","cost":1,"tactic":"offensive","tactic_value":"an offensive","dependencies":[{"name":"Circular Attack","key":"SKILL_009","cost":1,"tactic":"offensive","tactic_value":"an offensive","dependencies":[{"name":"Sneak Attack","key":"SKILL_002","cost":1,"tactic":"offensive","tactic_value":"an offensive","dependencies":[{"name":"Controlled Attack","key":"SKILL_006","cost":1,"tactic":"offensive","tactic_value":"an offensive","dependencies":[{"name":"Power","key":"SKILL_004","cost":2,"tactic":"offensive","tactic_value":"an offensive","dependencies":[{"name":"Adrenaline","key":"SKILL_003","cost":1,"tactic":"tactic","tactic_value":"Tactic","dependencies":[{"name":"Group Attack","key":"SKILL_014","cost":1,"tactic":"tactic","tactic_value":"Tactic","dependencies":[{"name":"Good Fortune","key":"SKILL_018","cost":1,"tactic":"tactic","tactic_value":"Tactic","dependencies":[]}]}]}]}]}]},{"name":"Chained Attack","key":"SKILL_008","cost":1,"tactic":"offensive","tactic_value":"an offensive","dependencies":[{"name":"Power","key":"SKILL_004","cost":2,"tactic":"offensive","tactic_value":"an offensive","dependencies":[]}]}]}]}];

    final skills = skillModelFromJson(json);

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
            Text('Cost: ${skill.cost}', style: const TextStyle(color: Colors.white70, fontSize: 12)),
          ],
        ),
      ),
    );
  }
}
