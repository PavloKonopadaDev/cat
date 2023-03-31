class CatFact {
  final String text;
  final DateTime createdAt;

  CatFact({required this.text, required this.createdAt});

  factory CatFact.fromJson(Map<String, dynamic> json) {
    return CatFact(
      text: json['fact'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fact': text,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
