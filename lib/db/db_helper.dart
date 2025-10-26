import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../models/material_model.dart';
import '../models/category_model.dart';
import '../models/dart_theory_model.dart';
import '../models/flutter_theory_model.dart';

class DBHelper {
  DBHelper._privateConstructor();
  static final DBHelper instance = DBHelper._privateConstructor();
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('metsai.db');
    await _ensureSeeded(_database!);
    return _database!;
  }

  Future<Database> _initDB(String fileName) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, fileName);

    return await openDatabase(
      path,
      version: 3,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE categories(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        image TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE materials(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        content TEXT,
        categoryId INTEGER,
        isBookmarked INTEGER DEFAULT 0,
        image TEXT,
        FOREIGN KEY (categoryId) REFERENCES categories(id)
      )
    ''');

    await db.execute('''
      CREATE TABLE dart_theories(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        subtitle TEXT NOT NULL,
        content TEXT,
        image TEXT,
        isBookmarked INTEGER DEFAULT 0
      )
    ''');

    await db.execute('''
      CREATE TABLE flutter_theories(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        subtitle TEXT NOT NULL,
        content TEXT,
        image TEXT,
        isBookmarked INTEGER DEFAULT 0
      )
    ''');

    // 🔹 Tabel baru untuk streak & growpoints
    await db.execute('''
      CREATE TABLE user_stats(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        streak_count INTEGER DEFAULT 0,
        grow_points INTEGER DEFAULT 0,
        last_login TEXT
      )
    ''');

    // insert default user stats
    await db.insert("user_stats", {
      "streak_count": 0,
      "grow_points": 0,
      "last_login": DateTime.now().toIso8601String(),
    });

    await _seedCategories(db);
    await _seedMaterials(db);
    await _seedDartTheories(db);
    await _seedFlutterTheories(db);
  }

  Future _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
      try {
        await db.execute("ALTER TABLE categories ADD COLUMN image TEXT;");
      } catch (_) {}
      try {
        await db.execute("ALTER TABLE materials ADD COLUMN image TEXT;");
      } catch (_) {}
    }
    if (oldVersion < 3) {
      await db.execute('''
        CREATE TABLE IF NOT EXISTS user_stats(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          streak_count INTEGER DEFAULT 0,
          grow_points INTEGER DEFAULT 0,
          last_login TEXT
        )
      ''');

      final res = await db.query("user_stats");
      if (res.isEmpty) {
        await db.insert("user_stats", {
          "streak_count": 0,
          "grow_points": 0,
          "last_login": DateTime.now().toIso8601String(),
        });
      }
    }
  }

  // =========================
  // 🔹 ENSURE SEED
  // =========================
  Future<void> _ensureSeeded(Database db) async {
    final catCount = Sqflite.firstIntValue(
          await db.rawQuery("SELECT COUNT(*) FROM categories"),
        ) ??
        0;
    if (catCount == 0) {
      await _seedCategories(db);
    }

    final matCount = Sqflite.firstIntValue(
          await db.rawQuery("SELECT COUNT(*) FROM materials"),
        ) ??
        0;
    if (matCount == 0) {
      await _seedMaterials(db);
    }
  }

  // =========================
  // 🔹 RESET DB (opsional)
  // =========================
  Future<void> resetDatabase() async {
    final db = await database;
    await db.execute('DROP TABLE IF EXISTS materials');
    await db.execute('DROP TABLE IF EXISTS categories');
    await db.execute('DROP TABLE IF EXISTS dart_theories');
    await db.execute('DROP TABLE IF EXISTS flutter_theories');
    await db.execute('DROP TABLE IF EXISTS user_stats');
    await _onCreate(db, 3);
  }

  // =========================
  // 🔹 SEED DATA
  // =========================
  Future<void> _seedCategories(Database db) async {
    final categories = [
      {'name': 'Practical', 'image': 'assets/practicals.jpg'},
      {'name': 'Syntax', 'image': 'assets/syntax.jpg'},
      {'name': 'Dart', 'image': 'assets/dart_category.jpg'},
      {'name': 'Flutter', 'image': 'assets/flutter_category.jpg'},
      {'name': 'Question', 'image': 'assets/question.png'},
      {'name': 'Quiz', 'image': 'assets/quiz_category.jpg'},
    ];

    for (var c in categories) {
      await db.insert('categories', c);
    }
  }

  Future<void> _seedDartTheories(Database db) async {
    final theories = [
      {
        'title': 'Dart - Introduction',
        'subtitle': "Let's Start Lecture 1",
        'content':
            'Introduction to Dart programming language and its features.',
        'image': 'assets/dart.jpg',
        'isBookmarked': 0
      },
      {
        'title': 'main() function in Dart',
        'subtitle': "Let's Start Lecture 2",
        'content': 'Understanding the entry point of Dart applications.',
        'image': 'assets/dart.jpg',
        'isBookmarked': 0
      },
      {
        'title': 'Dart - Data Types',
        'subtitle': "Let's Start Lecture 3",
        'content': 'Overview of different data types in Dart.',
        'image': 'assets/dart.jpg',
        'isBookmarked': 0
      },
      {
        'title': 'String Interpolation in Dart',
        'subtitle': "Let's Start Lecture 4",
        'content': 'Overview of different data types in Dart.',
        'image': 'assets/dart.jpg',
        'isBookmarked': 0
      },
      {
        'title': 'Comments in Dart',
        'subtitle': "Let's Start Lecture 5",
        'content': 'Overview of different data types in Dart.',
        'image': 'assets/dart.jpg',
        'isBookmarked': 0
      },
      {
        'title': 'String in Dart',
        'subtitle': "Let's Start Lecture 6",
        'content': 'Overview of different data types in Dart.',
        'image': 'assets/dart.jpg',
        'isBookmarked': 0
      },
      {
        'title': 'String Properties in Dart',
        'subtitle': "Let's Start Lecture 7",
        'content': 'Overview of different data types in Dart.',
        'image': 'assets/dart.jpg',
        'isBookmarked': 0
      },
      {
        'title': 'String Methods in Dart',
        'subtitle': "Let's Start Lecture 8",
        'content': 'Overview of different data types in Dart.',
        'image': 'assets/dart.jpg',
        'isBookmarked': 0
      },
      {
        'title': 'Constructors in Dart',
        'subtitle': "Let's Start Lecture 9",
        'content': 'Overview of different data types in Dart.',
        'image': 'assets/dart.jpg',
        'isBookmarked': 0
      },
      {
        'title': 'Enumerations in Dart',
        'subtitle': "Let's Start Lecture 10",
        'content': 'Overview of different data types in Dart.',
        'image': 'assets/dart.jpg',
        'isBookmarked': 0
      },
      {
        'title': 'Inheritance in Dart',
        'subtitle': "Let's Start Lecture 11",
        'content': 'Overview of different data types in Dart.',
        'image': 'assets/dart.jpg',
        'isBookmarked': 0
      },
      {
        'title': 'Iterables in Dart',
        'subtitle': "Let's Start Lecture 12",
        'content': 'Overview of different data types in Dart.',
        'image': 'assets/dart.jpg',
        'isBookmarked': 0
      },
      {
        'title': 'List in Dart',
        'subtitle': "Let's Start Lecture 13",
        'content': 'Overview of different data types in Dart.',
        'image': 'assets/dart.jpg',
        'isBookmarked': 0
      },
      {
        'title': 'Loop in Dart',
        'subtitle': "Let's Start Lecture 14",
        'content': 'Overview of different data types in Dart.',
        'image': 'assets/dart.jpg',
        'isBookmarked': 0
      },
      {
        'title': 'Maps in Dart',
        'subtitle': "Let's Start Lecture 15",
        'content': 'Overview of different data types in Dart.',
        'image': 'assets/dart.jpg',
        'isBookmarked': 0
      },
      {
        'title': 'Methods in Dart',
        'subtitle': "Let's Start Lecture 16",
        'content': 'Overview of different data types in Dart.',
        'image': 'assets/dart.jpg',
        'isBookmarked': 0
      },
      {
        'title': 'Queue in Dart',
        'subtitle': "Let's Start Lecture 17",
        'content': 'Overview of different data types in Dart.',
        'image': 'assets/dart.jpg',
        'isBookmarked': 0
      },
      {
        'title': 'Runes in Dart',
        'subtitle': "Let's Start Lecture 18",
        'content': 'Overview of different data types in Dart.',
        'image': 'assets/dart.jpg',
        'isBookmarked': 0
      },
      {
        'title': 'Set in Dart',
        'subtitle': "Let's Start Lecture 19",
        'content': 'Overview of different data types in Dart.',
        'image': 'assets/dart.jpg',
        'isBookmarked': 0
      },
      {
        'title': 'Mixins in Dart',
        'subtitle': "Let's Start Lecture 20",
        'content': 'Overview of different data types in Dart.',
        'image': 'assets/dart.jpg',
        'isBookmarked': 0
      },
      {
        'title': 'Const and Final Keyword in Dart',
        'subtitle': "Let's Start Lecture 21",
        'content': 'Overview of different data types in Dart.',
        'image': 'assets/dart.jpg',
        'isBookmarked': 0
      },
      {
        'title': 'If Else Statement in Dart',
        'subtitle': "Let's Start Lecture 22",
        'content': 'Overview of different data types in Dart.',
        'image': 'assets/dart.jpg',
        'isBookmarked': 0
      },
      {
        'title': 'for Loop in Dart',
        'subtitle': "Let's Start Lecture 23",
        'content': 'Overview of different data types in Dart.',
        'image': 'assets/dart.jpg',
        'isBookmarked': 0
      },
      {
        'title': 'While loop in Dart',
        'subtitle': "Let's Start Lecture 24",
        'content': 'Overview of different data types in Dart.',
        'image': 'assets/dart.jpg',
        'isBookmarked': 0
      },
      {
        'title': 'Do-While Loop in Dart',
        'subtitle': "Let's Start Lecture 25",
        'content': 'Overview of different data types in Dart.',
        'image': 'assets/dart.jpg',
        'isBookmarked': 0
      },
      {
        'title': 'Loop Control Statements in Dart',
        'subtitle': "Let's Start Lecture 26",
        'content': 'Overview of different data types in Dart.',
        'image': 'assets/dart.jpg',
        'isBookmarked': 0
      },
      {
        'title': 'Switch Case Statements in Dart',
        'subtitle': "Let's Start Lecture 27",
        'content': 'Overview of different data types in Dart.',
        'image': 'assets/dart.jpg',
        'isBookmarked': 0
      },
      {
        'title': 'Types of Operations in Dart',
        'subtitle': "Let's Start Lecture 28",
        'content': 'Overview of different data types in Dart.',
        'image': 'assets/dart.jpg',
        'isBookmarked': 0
      },
      {
        'title': 'Different Types of Functions in Dart',
        'subtitle': "Let's Start Lecture 29",
        'content': 'Overview of different data types in Dart.',
        'image': 'assets/dart.jpg',
        'isBookmarked': 0
      },
      {
        'title': 'Optional Parameters in Dart',
        'subtitle': "Let's Start Lecture 30",
        'content': 'Overview of different data types in Dart.',
        'image': 'assets/dart.jpg',
        'isBookmarked': 0
      },
      {
        'title': 'Anonymous Functions in Dart',
        'subtitle': "Let's Start Lecture 31",
        'content': 'Overview of different data types in Dart.',
        'image': 'assets/dart.jpg',
        'isBookmarked': 0
      },
      {
        'title': 'Lexical Scoping in Dart',
        'subtitle': "Let's Start Lecture 32",
        'content': 'Overview of different data types in Dart.',
        'image': 'assets/dart.jpg',
        'isBookmarked': 0
      },
      {
        'title': 'Exception Handling in Dart',
        'subtitle': "Let's Start Lecture 33",
        'content': 'Overview of different data types in Dart.',
        'image': 'assets/dart.jpg',
        'isBookmarked': 0
      },
      {
        'title': 'Super Keyword in Dart',
        'subtitle': "Let's Start Lecture 34",
        'content': 'Overview of different data types in Dart.',
        'image': 'assets/dart.jpg',
        'isBookmarked': 0
      },
      {
        'title': 'This Keyword in Dart',
        'subtitle': "Let's Start Lecture 35",
        'content': 'Overview of different data types in Dart.',
        'image': 'assets/dart.jpg',
        'isBookmarked': 0
      },
      {
        'title': 'OOP in Dart',
        'subtitle': "Let's Start Lecture 36",
        'content': 'Overview of different data types in Dart.',
        'image': 'assets/dart.jpg',
        'isBookmarked': 0
      },
      {
        'title': 'Class in Dart',
        'subtitle': "Let's Start Lecture 37",
        'content': 'Overview of different data types in Dart.',
        'image': 'assets/dart.jpg',
        'isBookmarked': 0
      },
      {
        'title': 'Object in Dart',
        'subtitle': "Let's Start Lecture 38",
        'content': 'Overview of different data types in Dart.',
        'image': 'assets/dart.jpg',
        'isBookmarked': 0
      },
      {
        'title': 'Encapsulation in Dart',
        'subtitle': "Let's Start Lecture 39",
        'content': 'Overview of different data types in Dart.',
        'image': 'assets/dart.jpg',
        'isBookmarked': 0
      },
      {
        'title': 'Getter and Setter in Dart',
        'subtitle': "Let's Start Lecture 40",
        'content': 'Overview of different data types in Dart.',
        'image': 'assets/dart.jpg',
        'isBookmarked': 0
      },
      {
        'title': 'Polymorphism in Dart',
        'subtitle': "Let's Start Lecture 41",
        'content': 'Overview of different data types in Dart.',
        'image': 'assets/dart.jpg',
        'isBookmarked': 0
      },
      {
        'title': 'Generics in Dart',
        'subtitle': "Let's Start Lecture 42",
        'content': 'Overview of different data types in Dart.',
        'image': 'assets/dart.jpg',
        'isBookmarked': 0
      },
    ];

    for (var theory in theories) {
      await db.insert('dart_theories', theory);
    }
  }

  Future<void> _seedMaterials(Database db) async {
    final materials = [
      {
        'title': 'State Management: Provider Practical',
        'content':
            'Contoh implementasi Provider untuk state management di Flutter.',
        'categoryId': 1,
        'isBookmarked': 0,
        'image': 'assets/practicals.jpg'
      },
      {
        'title': 'Dart Variables and Types',
        'content':
            'Penjelasan tentang variable, tipe data, dan type inference di Dart.',
        'categoryId': 2,
        'isBookmarked': 0,
        'image': 'assets/syntax.jpg'
      },
      {
        'title': 'Introduction to Dart',
        'content': 'Ringkasan sintaks dasar dan contoh.',
        'categoryId': 3,
        'isBookmarked': 0,
        'image': 'assets/dart.jpg'
      },
      {
        'title': 'Flutter Widgets 101',
        'content':
            'Mengenal widget dasar: StatelessWidget, StatefulWidget, layout dasar.',
        'categoryId': 4,
        'isBookmarked': 0,
        'image': 'assets/flutter_category.jpg'
      },
      {
        'title': 'Flutter Widgets 101',
        'content':
            'Mengenal widget dasar: StatelessWidget, StatefulWidget, layout dasar.',
        'categoryId': 4,
        'isBookmarked': 0,
        'image': 'assets/question.png'
      },
      {
        'title': 'Quiz: Dart Basics',
        'content': 'Kumpulan soal untuk menguji pengetahuan dasar Dart.',
        'categoryId': 5,
        'isBookmarked': 0,
        'image': 'assets/quiz_category.jpg'
      },
    ];

    for (var m in materials) {
      await db.insert('materials', m);
    }
  }

  Future<void> _seedFlutterTheories(Database db) async {
    final theories = [
      {
        'title': 'Flutter - Introduction',
        'subtitle': "Let's Start Flutter Lecture 1",
        'content': 'Introduction to Flutter framework and its features.',
        'image': 'assets/flutter.png',
        'isBookmarked': 0
      },
      {
        'title': 'Advantages of Flutter',
        'subtitle': "Let's Start Flutter Lecture 2",
        'content': 'Understanding the basics of widgets in Flutter.',
        'image': 'assets/flutter.png',
        'isBookmarked': 0
      },
      {
        'title': 'Disadvantages of Flutter',
        'subtitle': "Let's Start Flutter Lecture 3",
        'content':
            'Understanding the difference between stateless and stateful widgets.',
        'image': 'assets/flutter.png',
        'isBookmarked': 0
      },
      {
        'title': 'Apps Built with Flutter',
        'subtitle': "Let's Start Flutter Lecture 4",
        'content': 'Understanding layout widgets like Row, Column, Stack, etc.',
        'image': 'assets/flutter.png',
        'isBookmarked': 0
      },
      {
        'title': 'Instalation of Flutter',
        'subtitle': "Let's Start Flutter Lecture 5",
        'content': 'Implementing Material Design in Flutter.',
        'image': 'assets/flutter.png',
        'isBookmarked': 0
      },
      {
        'title': 'Architecture of Flutter',
        'subtitle': "Let's Start Flutter Lecture 6",
        'content': 'Implementing Material Design in Flutter.',
        'image': 'assets/flutter.png',
        'isBookmarked': 0
      },
      {
        'title': 'Types of Layouts Widgets',
        'subtitle': "Let's Start Flutter Lecture 7",
        'content': 'Implementing Material Design in Flutter.',
        'image': 'assets/flutter.png',
        'isBookmarked': 0
      },
      {
        'title': 'Single Child Widgets',
        'subtitle': "Let's Start Flutter Lecture 8",
        'content': 'Implementing Material Design in Flutter.',
        'image': 'assets/flutter.png',
        'isBookmarked': 0
      },
      {
        'title': 'Multiple Child Widgets',
        'subtitle': "Let's Start Flutter Lecture 9",
        'content': 'Implementing Material Design in Flutter.',
        'image': 'assets/flutter.png',
        'isBookmarked': 0
      },
      {
        'title': 'Stateful and Stateless Widgets',
        'subtitle': "Let's Start Flutter Lecture 10",
        'content': 'Implementing Material Design in Flutter.',
        'image': 'assets/flutter.png',
        'isBookmarked': 0
      },
      {
        'title': 'Handling gestures in Flutter',
        'subtitle': "Let's Start Flutter Lecture 11",
        'content': 'Implementing Material Design in Flutter.',
        'image': 'assets/flutter.png',
        'isBookmarked': 0
      },
    ];

    for (var theory in theories) {
      await db.insert('flutter_theories', theory);
    }
  }

  // =========================
  // 🔹 GROWPOINTS & STREAK
  // =========================
  Future<int> getCurrentStreak() async {
    final db = await database;
    final result = await db.query("user_stats", limit: 1);
    if (result.isNotEmpty) {
      return result.first["streak_count"] as int? ?? 0;
    }
    return 0;
  }

  Future<int> getGrowPoints() async {
    final db = await database;
    final result = await db.query("user_stats", limit: 1);
    if (result.isNotEmpty) {
      return result.first["grow_points"] as int? ?? 0;
    }
    return 0;
  }

  Future<void> updateStreakAndPoints() async {
    final db = await database;
    final result = await db.query("user_stats", limit: 1);
    final today = DateTime.now();

    if (result.isEmpty) {
      await db.insert("user_stats", {
        "streak_count": 1,
        "grow_points": 10,
        "last_login": today.toIso8601String(),
      });
    } else {
      final row = result.first;
      final lastLoginStr = row["last_login"] as String?;
      final lastLogin = DateTime.tryParse(lastLoginStr ?? "") ?? today;

      int streak = row["streak_count"] as int? ?? 0;
      int growPoints = row["grow_points"] as int? ?? 0;

      if (today.difference(lastLogin).inDays == 1) {
        streak += 1;
        growPoints += 10;
      } else if (today.difference(lastLogin).inDays > 1) {
        streak = 1;
        growPoints += 5;
      } else {
        growPoints += 2;
      }

      await db.update(
        "user_stats",
        {
          "streak_count": streak,
          "grow_points": growPoints,
          "last_login": today.toIso8601String(),
        },
      );
    }
  }

  // =========================
  // 🔹 CATEGORIES
  // =========================
  Future<List<CategoryModel>> getAllCategories() async {
    final db = await database;
    final res = await db.query('categories', orderBy: 'id ASC');
    return res.map((c) => CategoryModel.fromMap(c)).toList();
  }

  // =========================
  // 🔹 MATERIALS
  // =========================
  Future<int> insertMaterial(MaterialModel material) async {
    final db = await database;
    return await db.insert('materials', material.toMap());
  }

  Future<List<MaterialModel>> getAllMaterials() async {
    final db = await database;
    final res = await db.query('materials', orderBy: 'id ASC');
    return res.map((e) => MaterialModel.fromMap(e)).toList();
  }

  Future<List<MaterialModel>> getMaterialsByCategory(int categoryId) async {
    final db = await database;
    final res = await db.query(
      'materials',
      where: 'categoryId = ?',
      whereArgs: [categoryId],
      orderBy: 'id ASC',
    );
    return res.map((e) => MaterialModel.fromMap(e)).toList();
  }

  Future<MaterialModel?> getMaterialById(int id) async {
    final db = await database;
    final res = await db.query('materials', where: 'id = ?', whereArgs: [id]);
    if (res.isNotEmpty) {
      return MaterialModel.fromMap(res.first);
    }
    return null;
  }

  Future<int> updateMaterial(MaterialModel material) async {
    final db = await database;
    return await db.update(
      'materials',
      material.toMap(),
      where: 'id = ?',
      whereArgs: [material.id],
    );
  }

  Future<int> deleteMaterial(int id) async {
    final db = await database;
    return await db.delete('materials', where: 'id = ?', whereArgs: [id]);
  }

  Future<List<MaterialModel>> searchMaterials(String keyword) async {
    final db = await database;
    final res = await db.query(
      'materials',
      where: 'title LIKE ? OR content LIKE ?',
      whereArgs: ['%$keyword%', '%$keyword%'],
      orderBy: 'id ASC',
    );
    return res.map((e) => MaterialModel.fromMap(e)).toList();
  }

  Future<List<MaterialModel>> getBookmarkedMaterials() async {
    final db = await database;
    final res = await db.query(
      'materials',
      where: 'isBookmarked = ?',
      whereArgs: [1],
      orderBy: 'id ASC',
    );
    return res.map((e) => MaterialModel.fromMap(e)).toList();
  }

  Future<int> toggleBookmark(int id, bool bookmarked) async {
    final db = await database;
    return await db.update(
      'materials',
      {'isBookmarked': bookmarked ? 1 : 0},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // =========================
  // 🔹 DART THEORIES
  // =========================
  Future<List<DartTheoryModel>> getAllDartTheories() async {
    final db = await database;
    final res = await db.query('dart_theories', orderBy: 'id ASC');
    return res.map((e) => DartTheoryModel.fromMap(e)).toList();
  }

  Future<int> toggleDartTheoryBookmark(int id, bool bookmarked) async {
    final db = await database;
    return await db.update(
      'dart_theories',
      {'isBookmarked': bookmarked ? 1 : 0},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // =========================
  // 🔹 FLUTTER THEORIES
  // =========================
  Future<List<FlutterTheoryModel>> getAllFlutterTheories() async {
    final db = await database;
    final res = await db.query('flutter_theories', orderBy: 'id ASC');
    return res.map((e) => FlutterTheoryModel.fromMap(e)).toList();
  }

  Future<int> toggleFlutterTheoryBookmark(int id, bool bookmarked) async {
    final db = await database;
    return await db.update(
      'flutter_theories',
      {'isBookmarked': bookmarked ? 1 : 0},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await database;
    db.close();
  }
}
