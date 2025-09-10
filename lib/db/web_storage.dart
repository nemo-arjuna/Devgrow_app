import 'dart:html' as html;
import 'dart:convert';
import '../models/category_model.dart';
import '../models/material_model.dart';
import '../models/dart_theory_model.dart';
import '../models/flutter_theory_model.dart';

class WebStorage {
  static const String categoriesKey = 'categories';
  static const String materialsKey = 'materials';
  static const String flutterTheoriesKey = 'flutter_theories';

  // Initialize with seed data if empty
  static void initializeIfEmpty() {
    if (!html.window.localStorage.containsKey(categoriesKey)) {
      _seedCategories();
    }
    if (!html.window.localStorage.containsKey(materialsKey)) {
      _seedMaterials();
    }
    if (!html.window.localStorage.containsKey(dartTheoriesKey)) {
      _seedDartTheories();
    }
    if (!html.window.localStorage.containsKey(flutterTheoriesKey)) {
      _seedFlutterTheories();
    }
    // Uncomment line below to reset data (for development only)
    // resetDatabase();
  }

  static void _seedCategories() {
    final categories = [
      {
        'id': 1,
        'name': 'Practical',
        'image': 'lib/assets/practical_category.jpg'
      },
      {'id': 2, 'name': 'Syntax', 'image': 'lib/assets/syntax_category.jpg'},
      {'id': 3, 'name': 'Dart', 'image': 'lib/assets/dart_category.jpg'},
      {'id': 4, 'name': 'Flutter', 'image': 'lib/assets/flutter_category.jpg'},
      {'id': 5, 'name': 'Quiz', 'image': 'lib/assets/quiz_category.jpg'},
      {'id': 6, 'name': 'Question', 'image': 'lib/assets/question.png'},
    ];
    html.window.localStorage[categoriesKey] = json.encode(categories);
  }

  static void _seedMaterials() {
    final materials = [
      {
        'id': 1,
        'title': 'State Management: Provider Practical',
        'content':
            'Contoh implementasi Provider untuk state management di Flutter.',
        'categoryId': 1,
        'isBookmarked': 0,
        'image': 'lib/assets/practical_category.jpg'
      },
      {
        'id': 2,
        'title': 'Dart Variables and Types',
        'content':
            'Penjelasan tentang variable, tipe data, dan type inference di Dart.',
        'categoryId': 2,
        'isBookmarked': 0,
        'image': 'lib/assets/syntax_category.jpg'
      },
      {
        'id': 3,
        'title': 'Introduction to Dart',
        'content': 'Ringkasan sintaks dasar dan contoh.',
        'categoryId': 3,
        'isBookmarked': 0,
        'image': 'lib/assets/dart_category.jpg'
      },
      {
        'id': 4,
        'title': 'Flutter Widgets 101',
        'content':
            'Mengenal widget dasar: StatelessWidget, StatefulWidget, layout dasar.',
        'categoryId': 4,
        'isBookmarked': 0,
        'image': 'lib/assets/flutter_category.jpg'
      },
      {
        'id': 5,
        'title': 'Quiz: Dart Basics',
        'content': 'Kumpulan soal untuk menguji pengetahuan dasar Dart.',
        'categoryId': 5,
        'isBookmarked': 0,
        'image': 'lib/assets/quiz_category.jpg'
      },
      {
        'id': 6,
        'title': 'Question: Common Programming Problems',
        'content': 'Kumpulan soal dan jawaban untuk latihan pemrograman.',
        'categoryId': 6,
        'isBookmarked': 0,
        'image': 'lib/assets/question.png'
      },
    ];
    html.window.localStorage[materialsKey] = json.encode(materials);
  }

  static List<CategoryModel> getAllCategories() {
    final String? data = html.window.localStorage[categoriesKey];
    if (data == null) return [];

    List<dynamic> jsonData = json.decode(data);
    return jsonData.map((item) => CategoryModel.fromMap(item)).toList();
  }

  static List<MaterialModel> getAllMaterials() {
    final String? data = html.window.localStorage[materialsKey];
    if (data == null) return [];

    List<dynamic> jsonData = json.decode(data);
    return jsonData.map((item) => MaterialModel.fromMap(item)).toList();
  }

  static void toggleBookmark(int id) {
    final String? data = html.window.localStorage[materialsKey];
    if (data == null) return;

    List<dynamic> jsonData = json.decode(data);
    int index = jsonData.indexWhere((item) => item['id'] == id);
    if (index != -1) {
      jsonData[index]['isBookmarked'] =
          jsonData[index]['isBookmarked'] == 0 ? 1 : 0;
      // Save the updated data back to localStorage
      html.window.localStorage[materialsKey] = json.encode(jsonData);
      print(
          'Bookmark toggled for material $id, new value: ${jsonData[index]['isBookmarked']}');
    }
  }

  static List<MaterialModel> getMaterialsByCategory(int categoryId) {
    return getAllMaterials()
        .where((material) => material.categoryId == categoryId)
        .toList();
  }

  static List<MaterialModel> getBookmarkedMaterials() {
    return getAllMaterials()
        .where((material) => material.isBookmarked)
        .toList();
  }

  static const String dartTheoriesKey = 'dart_theories';

  static void resetDatabase() {
    html.window.localStorage.remove(categoriesKey);
    html.window.localStorage.remove(materialsKey);
    html.window.localStorage.remove(dartTheoriesKey);
    html.window.localStorage.remove(flutterTheoriesKey);
    _seedCategories();
    _seedMaterials();
    _seedDartTheories();
    _seedFlutterTheories();
  }

  static List<FlutterTheoryModel> getAllFlutterTheories() {
    final String? data = html.window.localStorage[flutterTheoriesKey];
    if (data == null) return [];

    List<dynamic> jsonData = json.decode(data);
    return jsonData.map((item) => FlutterTheoryModel.fromMap(item)).toList();
  }

  static void toggleFlutterTheoryBookmark(int id) {
    final String? data = html.window.localStorage[flutterTheoriesKey];
    if (data == null) return;

    List<dynamic> jsonData = json.decode(data);
    int index = jsonData.indexWhere((item) => item['id'] == id);
    if (index != -1) {
      jsonData[index]['isBookmarked'] =
          jsonData[index]['isBookmarked'] == 0 ? 1 : 0;
      html.window.localStorage[flutterTheoriesKey] = json.encode(jsonData);
    }
  }

  static void _seedFlutterTheories() {
    final theories = [
      {
        'id': 1,
        'title': 'Flutter - Introduction',
        'subtitle': "Let's Start Lecture 1",
        'content': 'Introduction to Flutter framework and its features.',
        'image': 'lib/assets/flutter.png',
        'isBookmarked': 0
      },
      {
        'id': 2,
        'title': 'Advantages of Flutter',
        'subtitle': "Let's Start Lecture 2",
        'content': 'Understanding the basics of widgets in Flutter.',
        'image': 'lib/assets/flutter.png',
        'isBookmarked': 0
      },
      {
        'id': 3,
        'title': 'Disadvantages of Flutter',
        'subtitle': "Let's Start Lecture 3",
        'content':
            'Understanding the difference between stateless and stateful widgets.',
        'image': 'lib/assets/flutter.png',
        'isBookmarked': 0
      },
      {
        'id': 4,
        'title': 'Apps build with Flutter',
        'subtitle': "Let's Start Lecture 4",
        'content': 'Understanding layout widgets like Row, Column, Stack, etc.',
        'image': 'lib/assets/flutter.png',
        'isBookmarked': 0
      },
      {
        'id': 5,
        'title': 'Instalation of Flutter',
        'subtitle': "Let's Start Lecture 5",
        'content': 'Implementing Material Design in Flutter.',
        'image': 'lib/assets/flutter.png',
        'isBookmarked': 0
      },
      {
        'id': 6,
        'title': 'Architecture of Flutter',
        'subtitle': "Let's Start Lecture 6",
        'content': 'Implementing Material Design in Flutter.',
        'image': 'lib/assets/flutter.png',
        'isBookmarked': 0
      },
      {
        'id': 7,
        'title': 'Types of Layout widgets',
        'subtitle': "Let's Start Lecture 7",
        'content': 'Implementing Material Design in Flutter.',
        'image': 'lib/assets/flutter.png',
        'isBookmarked': 0
      },
      {
        'id': 8,
        'title': 'Single Child Wisgets',
        'subtitle': "Let's Start Lecture 8",
        'content': 'Implementing Material Design in Flutter.',
        'image': 'lib/assets/flutter.png',
        'isBookmarked': 0
      },
      {
        'id': 9,
        'title': 'Multiple Child Widgets',
        'subtitle': "Let's Start Lecture 9",
        'content': 'Implementing Material Design in Flutter.',
        'image': 'lib/assets/flutter.png',
        'isBookmarked': 0
      },
      {
        'id': 10,
        'title': 'Stateful and Stateless Widgets',
        'subtitle': "Let's Start Lecture 10",
        'content': 'Implementing Material Design in Flutter.',
        'image': 'lib/assets/flutter.png',
        'isBookmarked': 0
      },
      {
        'id': 11,
        'title': 'Handling gestures in Flutter',
        'subtitle': "Let's Start Lecture 11",
        'content': 'Implementing Material Design in Flutter.',
        'image': 'lib/assets/flutter.png',
        'isBookmarked': 0
      },
    ];
    html.window.localStorage[flutterTheoriesKey] = json.encode(theories);
  }

  static void _seedDartTheories() {
    final theories = [
      {
        'id': 1,
        'title': 'Dart - Introduction',
        'subtitle': "Let's Start Lecture 1",
        'content':
            'Introduction to Dart programming language and its features.',
        'image': 'lib/assets/dart.jpg',
        'isBookmarked': 0
      },
      {
        'id': 2,
        'title': 'main() function in Dart',
        'subtitle': "Let's Start Lecture 2",
        'content': 'Understanding the entry point of Dart applications.',
        'image': 'lib/assets/dart.jpg',
        'isBookmarked': 0
      },
      {
        'id': 3,
        'title': 'Dart - Data Types',
        'subtitle': "Let's Start Lecture 3",
        'content': 'Overview of different data types in Dart.',
        'image': 'lib/assets/dart.jpg',
        'isBookmarked': 0
      },
      {
        'id': 4,
        'title': 'String Interpolation in Dart',
        'subtitle': "Let's Start Lecture 4",
        'content': 'Overview of different data types in Dart.',
        'image': 'lib/assets/dart.jpg',
        'isBookmarked': 0
      },
      {
        'id': 5,
        'title': 'Comments in Dart',
        'subtitle': "Let's Start Lecture 5",
        'content': 'Overview of different data types in Dart.',
        'image': 'lib/assets/dart.jpg',
        'isBookmarked': 0
      },
      {
        'id': 6,
        'title': 'String in Dart',
        'subtitle': "Let's Start Lecture 6",
        'content': 'Overview of different data types in Dart.',
        'image': 'lib/assets/dart.jpg',
        'isBookmarked': 0
      },
      {
        'id': 7,
        'title': 'String Properties in Dart',
        'subtitle': "Let's Start Lecture 7",
        'content': 'Overview of different data types in Dart.',
        'image': 'lib/assets/dart.jpg',
        'isBookmarked': 0
      },
      {
        'id': 8,
        'title': 'String Methods in Dart',
        'subtitle': "Let's Start Lecture 8",
        'content': 'Overview of different data types in Dart.',
        'image': 'lib/assets/dart.jpg',
        'isBookmarked': 0
      },
      {
        'id': 9,
        'title': "Constructors in Dart",
        'subtitle': "Let's Start Lecture 9",
        'content': 'Overview of different data types in Dart.',
        'image': 'lib/assets/dart.jpg',
        'isBookmarked': 0
      },
      {
        'id': 10,
        "title": "Enumerations in Dart",
        "subtitle": "Let's Start Lecture 10",
        'content': 'Overview of different data types in Dart.',
        'image': 'lib/assets/dart.jpg',
        'isBookmarked': 0
      },
      {
        'id': 11,
        "title": "Inheritance in Dart",
        "subtitle": "Let's Start Lecture 11",
        'content': 'Overview of different data types in Dart.',
        'image': 'lib/assets/dart.jpg',
        'isBookmarked': 0
      },
      {
        'id': 12,
        "title": "Iterables in Dart",
        "subtitle": "Let's Start Lecture 12",
        'content': 'Overview of different data types in Dart.',
        'image': 'lib/assets/dart.jpg',
        'isBookmarked': 0
      },
      {
        'id': 13,
        "title": "List in Dart",
        "subtitle": "Let's Start Lecture 13",
        'content': 'Overview of different data types in Dart.',
        'image': 'lib/assets/dart.jpg',
        'isBookmarked': 0
      },
      {
        'id': 14,
        "title": "Loop in Dart",
        "subtitle": "Let's Start Lecture 14",
        'content': 'Overview of different data types in Dart.',
        'image': 'lib/assets/dart.jpg',
        'isBookmarked': 0
      },
      {
        'id': 15,
        "title": "Maps in Dart",
        "subtitle": "Let's Start Lecture 15",
        'content': 'Overview of different data types in Dart.',
        'image': 'lib/assets/dart.jpg',
        'isBookmarked': 0
      },
      {
        'id': 16,
        "title": "Methods in Dart",
        "subtitle": "Let's Start Lecture 16",
        'content': 'Overview of different data types in Dart.',
        'image': 'lib/assets/dart.jpg',
        'isBookmarked': 0
      },
      {
        'id': 17,
        "title": "Queue in Dart",
        "subtitle": "Let's Start Lecture 17",
        'content': 'Overview of different data types in Dart.',
        'image': 'lib/assets/dart.jpg',
        'isBookmarked': 0
      },
      {
        'id': 18,
        "title": "Runes in Dart",
        "subtitle": "Let's Start Lecture 18",
        'content': 'Overview of different data types in Dart.',
        'image': 'lib/assets/dart.jpg',
        'isBookmarked': 0
      },
      {
        'id': 19,
        "title": "Set in Dart",
        "subtitle": "Let's Start Lecture 19",
        'content': 'Overview of different data types in Dart.',
        'image': 'lib/assets/dart.jpg',
        'isBookmarked': 0
      },
      {
        'id': 20,
        "title": "Mixins in Dart",
        "subtitle": "Let's Start Lecture 20",
        'content': 'Overview of different data types in Dart.',
        'image': 'lib/assets/dart.jpg',
        'isBookmarked': 0
      },
      {
        'id': 21,
        "title": "Const and Final Keyword in Dart",
        "subtitle": "Let's Start Lecture 21",
        'content': 'Overview of different data types in Dart.',
        'image': 'lib/assets/dart.jpg',
        'isBookmarked': 0
      },
      {
        'id': 22,
        "title": "If Else Statement in Dart",
        "subtitle": "Let's Start Lecture 22",
        'content': 'Overview of different data types in Dart.',
        'image': 'lib/assets/dart.jpg',
        'isBookmarked': 0
      },
      {
        'id': 23,
        "title": "for Loop in Dart",
        "subtitle": "Let's Start Lecture 23",
        'content': 'Overview of different data types in Dart.',
        'image': 'lib/assets/dart.jpg',
        'isBookmarked': 0
      },
      {
        'id': 24,
        "title": "While loop in Dart",
        "subtitle": "Let's Start Lecture 24",
        'content': 'Overview of different data types in Dart.',
        'image': 'lib/assets/dart.jpg',
        'isBookmarked': 0
      },
      {
        'id': 25,
        "title": "Do-While Loop in Dart",
        "subtitle": "Let's Start Lecture 25",
        'content': 'Overview of different data types in Dart.',
        'image': 'lib/assets/dart.jpg',
        'isBookmarked': 0
      },
      {
        'id': 26,
        "title": "Loop Control Statements in Dart",
        "subtitle": "Let's Start Lecture 26",
        'content': 'Overview of different data types in Dart.',
        'image': 'lib/assets/dart.jpg',
        'isBookmarked': 0
      },
      {
        'id': 27,
        "title": "Switch Case Statements in Dart",
        "subtitle": "Let's Start Lecture 27",
        'content': 'Overview of different data types in Dart.',
        'image': 'lib/assets/dart.jpg',
        'isBookmarked': 0
      },
      {
        'id': 28,
        "title": "Types of Operations in Dart",
        "subtitle": "Let's Start Lecture 28",
        'content': 'Overview of different data types in Dart.',
        'image': 'lib/assets/dart.jpg',
        'isBookmarked': 0
      },
      {
        'id': 29,
        "title": "Different Types of Functions in Dart",
        "subtitle": "Let's Start Lecture 29",
        'content': 'Overview of different data types in Dart.',
        'image': 'lib/assets/dart.jpg',
        'isBookmarked': 0
      },
      {
        'id': 30,
        "title": "Optional Parameters in Dart",
        "subtitle": "Let's Start Lecture 30",
        'content': 'Overview of different data types in Dart.',
        'image': 'lib/assets/dart.jpg',
        'isBookmarked': 0
      },
      {
        'id': 31,
        "title": "Anonymous Functions in Dart",
        "subtitle": "Let's Start Lecture 31",
        'content': 'Overview of different data types in Dart.',
        'image': 'lib/assets/dart.jpg',
        'isBookmarked': 0
      },
      {
        'id': 32,
        "title": "Lexical Scoping in Dart",
        "subtitle": "Let's Start Lecture 32",
        'content': 'Overview of different data types in Dart.',
        'image': 'lib/assets/dart.jpg',
        'isBookmarked': 0
      },
      {
        'id': 33,
        "title": "Exception Handling in Dart",
        "subtitle": "Let's Start Lecture 33",
        'content': 'Overview of different data types in Dart.',
        'image': 'lib/assets/dart.jpg',
        'isBookmarked': 0
      },
      {
        'id': 34,
        "title": "Super Keyword in Dart",
        "subtitle": "Let's Start Lecture 34",
        'content': 'Overview of different data types in Dart.',
        'image': 'lib/assets/dart.jpg',
        'isBookmarked': 0
      },
      {
        'id': 35,
        "title": "This Keyword in Dart",
        "subtitle": "Let's Start Lecture 35",
        'content': 'Overview of different data types in Dart.',
        'image': 'lib/assets/dart.jpg',
        'isBookmarked': 0
      },
      {
        'id': 36,
        "title": "OOP in Dart",
        "subtitle": "Let's Start Lecture 36",
        'content': 'Overview of different data types in Dart.',
        'image': 'lib/assets/dart.jpg',
        'isBookmarked': 0
      },
      {
        'id': 37,
        "title": "Class in Dart",
        "subtitle": "Let's Start Lecture 37",
        'content': 'Overview of different data types in Dart.',
        'image': 'lib/assets/dart.jpg',
        'isBookmarked': 0
      },
      {
        'id': 38,
        "title": "Object in Dart",
        "subtitle": "Let's Start Lecture 38",
        'content': 'Overview of different data types in Dart.',
        'image': 'lib/assets/dart.jpg',
        'isBookmarked': 0
      },
      {
        'id': 39,
        "title": "Encapsulation in Dart",
        "subtitle": "Let's Start Lecture 39",
        'content': 'Overview of different data types in Dart.',
        'image': 'lib/assets/dart.jpg',
        'isBookmarked': 0
      },
      {
        'id': 40,
        "title": "Getter and Setter in Dart",
        "subtitle": "Let's Start Lecture 40",
        'content': 'Overview of different data types in Dart.',
        'image': 'lib/assets/dart.jpg',
        'isBookmarked': 0
      },
      {
        'id': 41,
        "title": "Polymorphism in Dart",
        "subtitle": "Let's Start Lecture 41",
        'content': 'Overview of different data types in Dart.',
        'image': 'lib/assets/dart.jpg',
        'isBookmarked': 0
      },
      {
        'id': 42,
        "title": "Generics in Dart",
        "subtitle": "Let's Start Lecture 42",
        'content': 'Overview of different data types in Dart.',
        'image': 'lib/assets/dart.jpg',
        'isBookmarked': 0
      },
    ];
    html.window.localStorage[dartTheoriesKey] = json.encode(theories);
  }

  static List<DartTheoryModel> getAllDartTheories() {
    final String? data = html.window.localStorage[dartTheoriesKey];
    if (data == null) return [];

    List<dynamic> jsonData = json.decode(data);
    return jsonData.map((item) => DartTheoryModel.fromMap(item)).toList();
  }

  static void toggleDartTheoryBookmark(int id) {
    final String? data = html.window.localStorage[dartTheoriesKey];
    if (data == null) return;

    List<dynamic> jsonData = json.decode(data);
    int index = jsonData.indexWhere((item) => item['id'] == id);
    if (index != -1) {
      jsonData[index]['isBookmarked'] =
          jsonData[index]['isBookmarked'] == 0 ? 1 : 0;
      html.window.localStorage[dartTheoriesKey] = json.encode(jsonData);
    }
  }
}
