class Clouds {
  int all;

  Clouds({
    required this.all,
  });

  factory Clouds.fromJson(Map<String, dynamic> json) {
    print(json);
    return Clouds(
      all: json["all"],
    );
  }
}
