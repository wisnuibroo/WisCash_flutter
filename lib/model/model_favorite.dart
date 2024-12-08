class ModelFavorite {
  final int? id;
  final String title;
  final String imagePath;

  ModelFavorite({
    this.id,
    required this.title,
    required this.imagePath,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'imagePath': imagePath,
    };
  }

  factory ModelFavorite.fromMap(Map<String, dynamic> map) {
    return ModelFavorite(
      id: map['id'] as int?,
      title: map['title'] as String,
      imagePath: map['imagePath'] as String,
    );
  }
}
