import 'package:Devgrow/screens/quiz_category/flutter_quiz/flutter_quiz.dart';
import 'package:flutter/material.dart';
import 'dart_quiz.dart';

void main() {
  runApp(const RPGQuizApp());
}

class RPGQuizApp extends StatelessWidget {
  const RPGQuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RPG Quiz',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        textTheme: ThemeData.dark().textTheme.apply(
              fontFamily: "Minecraft", // 🔹 apply font pixel ke semua teks
            ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Widget buildPixelButton({
    required String label,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: 250,
      height: 80,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero, // 🔹 kotak pixelated
          ),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.black,
          elevation: 10,
        ),
        onPressed: onPressed,
        child: Ink(
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage("assets/bg_bricks.jpeg"), // 🔹 texture Minecraft
              fit: BoxFit.cover,
            ),
            border: Border.all(
              color: Colors.black,
              width: 4, // 🔹 border pixel tebal
            ),
            boxShadow: const [
              BoxShadow(
                color: Colors.black,
                offset: Offset(4, 4), // 🔹 efek block pixel jatuh
              ),
            ],
          ),
          child: Center(
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 230, 230, 230),
                fontFamily: "Minecraft", // 🔹 Minecraft font
                shadows: [
                  Shadow(
                    blurRadius: 4,
                    color: Colors.black,
                    offset: Offset(2, 2),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Background utama halaman
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bg_quiz.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "⚔️ Clash of Quiz ⚔️",
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: "Minecraft", // 🔹 judul pakai font pixel
                  shadows: [
                    Shadow(
                      blurRadius: 8,
                      color: Colors.black,
                      offset: Offset(3, 3),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),

              // Tombol Dart Quiz
              buildPixelButton(
                label: "Dart Quiz",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DartQuizPage(),
                    ),
                  );
                },
              ),

              const SizedBox(height: 20),

              // Tombol Flutter Quiz
              buildPixelButton(
                label: "Flutter Quiz",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FlutterQuizPage(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
