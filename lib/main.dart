import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';
import 'db/db_helper.dart';
import 'db/web_storage.dart';
import 'providers/category_provider.dart';
import 'providers/material_provider.dart';
import 'providers/dart_theory_provider.dart';
import 'providers/flutter_theory_provider.dart';
import 'screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    // Initialize storage based on platform
    if (kIsWeb) {
      WebStorage.initializeIfEmpty();
      print("Web storage initialized");
    } else {
      await DBHelper.instance.database;
      print("SQLite database initialized");
    }
  } catch (e) {
    print("Error initializing storage: $e");
  }

  // Reset database hanya jika diperlukan
  // try {
  //   await DBHelper.instance.resetDatabase();
  //   print("Storage reset successful");
  // } catch (e) {
  //   print("Error resetting storage: $e");
  // }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CategoryProvider()),
        ChangeNotifierProvider(create: (_) => MaterialProvider()),
        ChangeNotifierProvider(create: (_) => DartTheoryProvider()),
        ChangeNotifierProvider(create: (_) => FlutterTheoryProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'DevGrow',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const HomeScreen(),
      ),
    );
  }
}
