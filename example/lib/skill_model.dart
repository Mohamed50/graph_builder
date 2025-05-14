List<SkillModel> skillModelFromJson(List json) => List<SkillModel>.from(json.map((x) => SkillModel.fromJson(x)));

class SkillModel {
  final String id;
  final String name;
  final String key;
  final int cost;
  final Tactic? tactic;
  final List<SkillModel> dependencies;

  SkillModel({
    required this.id,
    required this.name,
    required this.key,
    required this.cost,
    required this.tactic,
    required this.dependencies,
  });

  factory SkillModel.fromJson(Map<String, dynamic> json) => SkillModel(
        id: json["key"],
        name: json["name"],
        key: json["key"],
        cost: json["cost"],
        dependencies: List<SkillModel>.from((json['dependencies'] ?? []).map((x) => SkillModel.fromJson(x))).toList(),
        tactic: tacticValues.map[json["tactic"]],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "key": key,
        "cost": cost,
        "tactic": tacticValues.reverse[tactic],
      };
}

enum Tactic {
  defensive,
  dungeon,
  magic,
  maledicion,
  offensive,
  reaction,
  tactic,
}

final tacticValues = EnumValues({
  "defensive": Tactic.defensive,
  "dungeon": Tactic.dungeon,
  "magic": Tactic.magic,
  "malediction": Tactic.maledicion,
  "offensive": Tactic.offensive,
  "reaction": Tactic.reaction,
  "tactic": Tactic.tactic
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
