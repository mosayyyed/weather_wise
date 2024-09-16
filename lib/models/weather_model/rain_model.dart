class Rain {
  double the3H;

  Rain({
    required this.the3H,
  });

  factory Rain.fromJson(Map<String, dynamic> json) {
    print(json);
    return Rain(
      the3H: json["3h"]?.toDouble(),
    );
  }
}
