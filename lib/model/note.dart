class Note {
  int? id;
  String title;
  String description;
  String created_at;
  Note(
      {required this.id,
      required this.title,
      required this.description,
      required this.created_at});

  factory Note.fromJson(json) {
    return Note(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        created_at: json["created_at"]);
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'created_at': created_at,
      };
}
