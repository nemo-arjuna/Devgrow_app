class DartTheoryModel {
  final int id;
  final String title;
  final String subtitle;
  final String image;
  final String content;
  final bool isBookmarked;

  DartTheoryModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.content,
    this.isBookmarked = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'subtitle': subtitle,
      'image': image,
      'content': content,
      'isBookmarked': isBookmarked ? 1 : 0,
    };
  }

  factory DartTheoryModel.fromMap(Map<String, dynamic> map) {
    return DartTheoryModel(
      id: map['id'] as int,
      title: map['title'] as String,
      subtitle: map['subtitle'] as String,
      image: map['image'] as String,
      content: map['content'] as String,
      isBookmarked: map['isBookmarked'] == 1,
    );
  }

  DartTheoryModel copyWith({
    int? id,
    String? title,
    String? subtitle,
    String? image,
    String? content,
    bool? isBookmarked,
  }) {
    return DartTheoryModel(
      id: id ?? this.id,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      image: image ?? this.image,
      content: content ?? this.content,
      isBookmarked: isBookmarked ?? this.isBookmarked,
    );
  }
}
