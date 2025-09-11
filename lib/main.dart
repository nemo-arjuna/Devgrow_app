import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'db/db_helper.dart';
import 'providers/category_provider.dart';
import 'providers/material_provider.dart';
import 'providers/dart_theory_provider.dart';
import 'providers/flutter_theory_provider.dart';
import 'screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await DBHelper.instance.database;
    print("SQLite database initialized");
  } catch (e) {
    print("Error initializing storage: $e");
  }


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CategoryProvider>(create: (_) => CategoryProvider()),
        ChangeNotifierProvider<MaterialProvider>(create: (_) => MaterialProvider()),
        ChangeNotifierProvider<DartTheoryProvider>(create: (_) => DartTheoryProvider()),
        ChangeNotifierProvider<FlutterTheoryProvider>(create: (_) => FlutterTheoryProvider()),
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
