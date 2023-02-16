class AppConstant {
  final String databaseId = "63ed63ffd48014139d8e";
  final String projectId = "63ed636d0cc30cca57f9";
  final String collectionId = "63ed641200560e5a4485";
  final String endpoint = "http://192.168.1.166/v1";
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
