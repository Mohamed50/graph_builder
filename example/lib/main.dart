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
    final json = [
      {
        "id": "a23591f1-2590-4627-8121-207169df5a91",
        "name": "Skill L1-0",
        "key": "SKILL_100",
        "cost": 2,
        "tactic": "reaction",
        "tactic_value": "a defense",
        "dependencies": [
          {
            "id": "f94d4a59-3f15-4bd2-a5bb-c8ddf5e24608",
            "name": "Skill L2-0",
            "key": "SKILL_200",
            "cost": 0,
            "tactic": "tactic",
            "tactic_value": "a defense",
            "dependencies": [
              {
                "id": "4f9d5413-e1d1-42b1-b060-1437fc7dfc13",
                "name": "Skill L3-0",
                "key": "SKILL_300",
                "cost": 2,
                "tactic": "tactic",
                "tactic_value": "Reaction",
                "dependencies": [
                  {
                    "id": "015e8c2c-d48e-4c6c-b8f1-fad607df6a1e",
                    "name": "Skill L4-0",
                    "key": "SKILL_400",
                    "cost": 1,
                    "tactic": "reaction",
                    "tactic_value": "a defense",
                    "dependencies": [
                      {
                        "id": "f417ae1e-0630-4f67-82d5-e35db3d4c62c",
                        "name": "Skill L5-0",
                        "key": "SKILL_500",
                        "cost": 0,
                        "tactic": "reaction",
                        "tactic_value": "Reaction",
                        "dependencies": []
                      },
                      {
                        "id": "85a29f1c-d56f-4a89-80b9-69ce6e221df5",
                        "name": "Skill L5-1",
                        "key": "SKILL_501",
                        "cost": 2,
                        "tactic": "tactic",
                        "tactic_value": "a defense",
                        "dependencies": []
                      }
                    ]
                  },
                  {
                    "id": "44969b1f-ea47-4af0-9c2e-39afc711e9e2",
                    "name": "Skill L4-1",
                    "key": "SKILL_401",
                    "cost": 3,
                    "tactic": "defensive",
                    "tactic_value": "a defense",
                    "dependencies": [
                      {
                        "id": "ccba52b6-5f83-4220-a0f6-d115a502f708",
                        "name": "Skill L5-0",
                        "key": "SKILL_500",
                        "cost": 3,
                        "tactic": "offensive",
                        "tactic_value": "Tactic",
                        "dependencies": []
                      },
                      {
                        "id": "ae84f655-d4de-4176-a878-4f0592d0c6f5",
                        "name": "Skill L5-1",
                        "key": "SKILL_501",
                        "cost": 3,
                        "tactic": "tactic",
                        "tactic_value": "Reaction",
                        "dependencies": []
                      }
                    ]
                  }
                ]
              },
              {
                "id": "a989a728-2b0d-4a9a-9176-1fc7fa30e464",
                "name": "Skill L3-1",
                "key": "SKILL_301",
                "cost": 2,
                "tactic": "reaction",
                "tactic_value": "Tactic",
                "dependencies": [
                  {
                    "id": "2be75b8e-11c2-4f06-bf11-05a3166f68b2",
                    "name": "Skill L4-0",
                    "key": "SKILL_400",
                    "cost": 3,
                    "tactic": "reaction",
                    "tactic_value": "Tactic",
                    "dependencies": [
                      {
                        "id": "57a3e90b-91cf-434b-9226-174ae916f25f",
                        "name": "Skill L5-0",
                        "key": "SKILL_500",
                        "cost": 0,
                        "tactic": "offensive",
                        "tactic_value": "Tactic",
                        "dependencies": []
                      },
                      {
                        "id": "8c306aa1-0e06-48bc-b59e-92dc26e1f0cd",
                        "name": "Skill L5-1",
                        "key": "SKILL_501",
                        "cost": 2,
                        "tactic": "reaction",
                        "tactic_value": "Reaction",
                        "dependencies": []
                      }
                    ]
                  }
                ]
              }
            ]
          }
        ]
      }
    ];

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
