class Sys {
  String pod;

  Sys({
    required this.pod,
  });

  factory Sys.fromJson(Map<String, dynamic> json) {
    print(json);
    return Sys(
      pod: json["pod"],
    );
  }
}
