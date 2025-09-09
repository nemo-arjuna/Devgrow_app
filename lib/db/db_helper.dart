import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import '../models/material_model.dart';
import '../models/category_model.dart';
import '../models/dart_theory_model.dart';
import '../models/flutter_theory_model.dart';
import 'web_storage.dart';

class DBHelper {
  DBHelper._privateConstructor();
  static final DBHelper instance = DBHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('metsai.db');
    // pastikan selalu ada data setelah DB terbuka
    await _ensureSeeded(_database!);
    return _database!;
  }

  Future<Database> _initDB(String fileName) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, fileName);
    return await openDatabase(
      path,
      version: 2,
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
  }

  // =========================
  // 🔹 ENSURE SEED
  // =========================
  Future<void> _ensureSeeded(Database db) async {
    final catCount = Sqflite.firstIntValue(
        await db.rawQuery("SELECT COUNT(*) FROM categories"))!;
    if (catCount == 0) {
      await _seedCategories(db);
    }

    final matCount = Sqflite.firstIntValue(
        await db.rawQuery("SELECT COUNT(*) FROM materials"))!;
    if (matCount == 0) {
      await _seedMaterials(db);
    }
  }

  // =========================
  // 🔹 RESET DB (opsional)
  // =========================
  Future<void> resetDatabase() async {
    print("Starting database reset...");
    if (kIsWeb) {
      // Web platform: use WebStorage
      WebStorage.resetDatabase();
      print("Web storage reset completed");
      return;
    }

    final db = await database;

    // Drop and recreate tables
    await db.execute('DROP TABLE IF EXISTS materials');
    await db.execute('DROP TABLE IF EXISTS categories');
    await db.execute('DROP TABLE IF EXISTS dart_theories');
    print("Tables dropped successfully");

    // Recreate tables
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
    print("Tables recreated successfully");

    // Seed data
    await _seedCategories(db);
    print("Categories seeded successfully");
    await _seedMaterials(db);
    print("Materials seeded successfully");
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
    await _seedDartTheories(db);
    print("Dart theories seeded successfully");
  }

  // =========================
  // 🔹 SEED DATA
  // =========================
  Future<void> _seedCategories(Database db) async {
    final categories = [
      {'name': 'Practical', 'image': 'lib/assets/practicals.jpg'},
      {'name': 'Syntax', 'image': 'lib/assets/syntax.jpg'},
      {'name': 'Dart', 'image': 'lib/assets/dart.jpg'},
      {'name': 'Flutter', 'image': 'lib/assets/dart.jpg'},
      {'name': 'Quiz', 'image': 'lib/assets/lecture.jpg'},
    ];
    for (var c in categories) {
      await db.insert('categories', c);
    }
    await _seedDartTheories(db);
  }

  Future<void> _seedDartTheories(Database db) async {
    final theories = [
      {
        'title': 'Dart - Introduction',
        'subtitle': "Let's Start Lecture 1",
        'content':
            'Introduction to Dart programming language and its features.',
        'image': 'lib/assets/dart.jpg',
        'isBookmarked': 0
      },
      {
        'title': 'main() function in Dart',
        'subtitle': "Let's Start Lecture 2",
        'content': 'Understanding the entry point of Dart applications.',
        'image': 'lib/assets/dart.jpg',
        'isBookmarked': 0
      },
      {
        'title': 'Dart - Data Types',
        'subtitle': "Let's Start Lecture 3",
        'content': 'Overview of different data types in Dart.',
        'image': 'lib/assets/dart.jpg',
        'isBookmarked': 0
      }
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
        'image': 'lib/assets/practicals.jpg'
      },
      {
        'title': 'Dart Variables and Types',
        'content':
            'Penjelasan tentang variable, tipe data, dan type inference di Dart.',
        'categoryId': 2,
        'isBookmarked': 0,
        'image': 'lib/assets/syntax.jpg'
      },
      {
        'title': 'Introduction to Dart',
        'content': 'Ringkasan sintaks dasar dan contoh.',
        'categoryId': 3,
        'isBookmarked': 0,
        'image': 'lib/assets/dart.jpg'
      },
      {
        'title': 'Flutter Widgets 101',
        'content':
            'Mengenal widget dasar: StatelessWidget, StatefulWidget, layout dasar.',
        'categoryId': 4,
        'isBookmarked': 0,
        'image': 'lib/assets/dart.jpg'
      },
      {
        'title': 'Quiz: Dart Basics',
        'content': 'Kumpulan soal untuk menguji pengetahuan dasar Dart.',
        'categoryId': 5,
        'isBookmarked': 0,
        'image': 'lib/assets/lecture.jpg'
      },
    ];
    for (var m in materials) {
      await db.insert('materials', m);
    }
  }

  // =========================
  // 🔹 CATEGORIES
  // =========================
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      if (kIsWeb) {
        // Web platform: use WebStorage
        final categories = WebStorage.getAllCategories();
        print("Found ${categories.length} categories in web storage");
        return categories;
      } else {
        // Android platform: use SQLite
        final db = await database;
        final res = await db.query('categories', orderBy: 'id ASC');
        print("Found ${res.length} categories in database");
        return res.map((c) => CategoryModel.fromMap(c)).toList();
      }
    } catch (e) {
      print("Error getting categories: $e");
      return [];
    }
  }

  // =========================
  // 🔹 MATERIALS
  // =========================
  Future<int> insertMaterial(MaterialModel material) async {
    final db = await database;
    return await db.insert('materials', material.toMap());
  }

  Future<List<MaterialModel>> getAllMaterials() async {
    try {
      if (kIsWeb) {
        // Web platform: use WebStorage
        final materials = WebStorage.getAllMaterials();
        print("Found ${materials.length} materials in web storage");
        return materials;
      } else {
        // Android platform: use SQLite
        final db = await database;
        final res = await db.query('materials', orderBy: 'id ASC');
        print("Found ${res.length} materials in database");
        return res.map((e) => MaterialModel.fromMap(e)).toList();
      }
    } catch (e) {
      print("Error getting materials: $e");
      return [];
    }
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
    if (kIsWeb) {
      // Web platform: use WebStorage
      return WebStorage.getBookmarkedMaterials();
    } else {
      // Android platform: use SQLite
      final db = await database;
      final res = await db.query(
        'materials',
        where: 'isBookmarked = ?',
        whereArgs: [1],
        orderBy: 'id ASC',
      );
      return res.map((e) => MaterialModel.fromMap(e)).toList();
    }
  }

  Future<int> toggleBookmark(int id, bool bookmarked) async {
    if (kIsWeb) {
      // Web platform: use WebStorage
      WebStorage.toggleBookmark(id);
      return 1; // Return success
    } else {
      // Android platform: use SQLite
      final db = await database;
      return await db.update(
        'materials',
        {'isBookmarked': bookmarked ? 1 : 0},
        where: 'id = ?',
        whereArgs: [id],
      );
    }
  }

  // =========================
  // 🔹 DART THEORIES
  // =========================
  Future<List<DartTheoryModel>> getAllDartTheories() async {
    try {
      if (kIsWeb) {
        // Web platform: use WebStorage
        final theories = WebStorage.getAllDartTheories();
        print("Found ${theories.length} dart theories in web storage");
        return theories;
      } else {
        // Android platform: use SQLite
        final db = await database;
        final res = await db.query('dart_theories', orderBy: 'id ASC');
        print("Found ${res.length} dart theories in database");
        return res.map((e) => DartTheoryModel.fromMap(e)).toList();
      }
    } catch (e) {
      print("Error getting dart theories: $e");
      return [];
    }
  }

  Future<int> toggleDartTheoryBookmark(int id, bool bookmarked) async {
    if (kIsWeb) {
      // Web platform: use WebStorage
      WebStorage.toggleDartTheoryBookmark(id);
      return 1; // Return success
    } else {
      // Android platform: use SQLite
      final db = await database;
      return await db.update(
        'dart_theories',
        {'isBookmarked': bookmarked ? 1 : 0},
        where: 'id = ?',
        whereArgs: [id],
      );
    }
  }

  // =========================
  // 🔹 FLUTTER THEORIES
  // =========================
  Future<List<FlutterTheoryModel>> getAllFlutterTheories() async {
    try {
      if (kIsWeb) {
        // Web platform: use WebStorage
        final theories = WebStorage.getAllFlutterTheories();
        print("Found ${theories.length} flutter theories in web storage");
        return theories;
      } else {
        // Android platform: use SQLite
        final db = await database;
        final res = await db.query('flutter_theories', orderBy: 'id ASC');
        print("Found ${res.length} flutter theories in database");
        return res.map((e) => FlutterTheoryModel.fromMap(e)).toList();
      }
    } catch (e) {
      print("Error getting flutter theories: $e");
      return [];
    }
  }

  Future<int> toggleFlutterTheoryBookmark(int id, bool bookmarked) async {
    if (kIsWeb) {
      // Web platform: use WebStorage
      WebStorage.toggleFlutterTheoryBookmark(id);
      return 1; // Return success
    } else {
      // Android platform: use SQLite
      final db = await database;
      return await db.update(
        'flutter_theories',
        {'isBookmarked': bookmarked ? 1 : 0},
        where: 'id = ?',
        whereArgs: [id],
      );
    }
  }

  Future<void> _seedFlutterTheories(Database db) async {
    final theories = [
      {
        'title': 'Flutter - Introduction',
        'subtitle': "Let's Start Flutter Lecture 1",
        'content': 'Introduction to Flutter framework and its features.',
        'image': 'lib/assets/dart.jpg',
        'isBookmarked': 0
      },
      {
        'title': 'Widgets in Flutter',
        'subtitle': "Let's Start Flutter Lecture 2",
        'content': 'Understanding the basics of widgets in Flutter.',
        'image': 'lib/assets/dart.jpg',
        'isBookmarked': 0
      },
      {
        'title': 'StatelessWidget vs StatefulWidget',
        'subtitle': "Let's Start Flutter Lecture 3",
        'content':
            'Understanding the difference between stateless and stateful widgets.',
        'image': 'lib/assets/dart.jpg',
        'isBookmarked': 0
      },
      {
        'title': 'Layout Widgets',
        'subtitle': "Let's Start Flutter Lecture 4",
        'content': 'Understanding layout widgets like Row, Column, Stack, etc.',
        'image': 'lib/assets/dart.jpg',
        'isBookmarked': 0
      },
      {
        'title': 'Material Design',
        'subtitle': "Let's Start Flutter Lecture 5",
        'content': 'Implementing Material Design in Flutter.',
        'image': 'lib/assets/dart.jpg',
        'isBookmarked': 0
      }
    ];

    for (var theory in theories) {
      await db.insert('flutter_theories', theory);
    }
  }

  Future close() async {
    final db = await database;
    db.close();
  }
}
