// lib/models/material_model.dart
class MaterialModel {
  int? id;
  String title;
  String? content;
  int? categoryId;
  bool isBookmarked;
  String? image; // path ke asset image

  MaterialModel({
    this.id,
    required this.title,
    this.content,
    this.categoryId,
    this.isBookmarked = false,
    this.image,
  });

  factory MaterialModel.fromMap(Map<String, dynamic> map) {
    return MaterialModel(
      id: map['id'] as int?,
      title: map['title'] as String,
      content: map['content'] as String?,
      categoryId: map['categoryId'] as int?,
      isBookmarked: (map['isBookmarked'] ?? 0) == 1,
      image: map['image'] as String?,
    );
  }

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      'title': title,
      'content': content,
      'categoryId': categoryId,
      'isBookmarked': isBookmarked ? 1 : 0,
      'image': image,
    };
    if (id != null) {
      map['id'] = id;
    }
    return map;
  }

  @override
  String toString() {
    return 'MaterialModel{id: $id, title: $title, categoryId: $categoryId, '
        'isBookmarked: $isBookmarked, image: $image}';
  }
}
