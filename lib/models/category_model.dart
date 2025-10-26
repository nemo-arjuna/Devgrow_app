// lib/models/category_model.dart
class CategoryModel {
  final int? id;
  final String name;
  final String? image; // path ke asset image

  CategoryModel({
    this.id,
    required this.name,
    this.image,
  });

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id'] as int?,
      name: map['name'] as String,
      image: map['image'] as String?,
    );
  }

  Map<String, dynamic> toMap() {
    final m = <String, dynamic>{
      'name': name,
      'image': image,
    };
    if (id != null) m['id'] = id;
    return m;
  }

  @override
  String toString() =>
      'CategoryModel{id: $id, name: $name, image: $image}';
}
