import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';
import 'db/db_helper.dart';
import 'db/web_storage.dart';
import 'providers/category_provider.dart';
import 'providers/material_provider.dart';
import 'providers/dart_theory_provider.dart';
import 'screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize storage
  if (kIsWeb) {
    WebStorage.initializeIfEmpty();
  }

  // Reset database otomatis setiap run
  try {
    await DBHelper.instance.resetDatabase();
    print("Storage reset successful");
  } catch (e) {
    print("Error resetting storage: $e");
  }

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
