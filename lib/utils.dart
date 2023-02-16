class AppConstant {
  final String databaseId = "REPLACE WITH DATABASE ID";
  final String projectId = "REPLACE WITH PROJECT ID";
  final String collectionId = "REPLACE WITH COLLECTION ID";
  final String endpoint = "ENDPOINT";
}

class Mood {
  String? $id;
  int rate;
  String description;
  DateTime? createdAt;

  Mood({
    this.$id,
    required this.rate,
    required this.description,
    required this.createdAt,
  });

  Map<dynamic, dynamic> toJson() {
    return {
      "rate": rate,
      "description": description,
      "createdAt": createdAt!.toIso8601String(),
    };
  }

  factory Mood.fromJson(Map<dynamic, dynamic> json) {
    return Mood(
      $id: json['\$id'],
      rate: json['rate'],
      description: json['description'],
      createdAt: DateTime.tryParse(json['createdAt']),
    );
  }
}
