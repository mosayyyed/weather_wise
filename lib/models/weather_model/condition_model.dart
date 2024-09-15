class Condition {
  final int id;
  final String main;
  final String description;
  final String icon;

  Condition({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  factory Condition.fromJson(Map<String, dynamic> json) {
    var weather = json['list'][0]['weather'][0];

    return Condition(
      id: weather['id'],
      main: weather['main'],
      description: weather['description'],
      icon: weather['icon'],
    );
  }
}
