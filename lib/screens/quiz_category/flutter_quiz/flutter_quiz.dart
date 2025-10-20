import 'package:flutter/material.dart';
import 'package:devgrow/screens/quiz_category/flutter_quiz/quiz_flutter_lvl1.dart';

class FlutterQuizPage extends StatefulWidget {
  const FlutterQuizPage({super.key});

  @override
  State<FlutterQuizPage> createState() => _FlutterQuizPageState();
}

class _FlutterQuizPageState extends State<FlutterQuizPage> {
  Widget buildLevelButton({
    required String imagePath,
    required String label,
    required double size,
    required VoidCallback onTap,
  }) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.yellow.withOpacity(0.4),
                  blurRadius: 20,
                  spreadRadius: 5,
                  offset: const Offset(2, 2),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 🔹 Background RPG
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/flutter_quiz_bg.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // 🔹 Tombol Start Quiz (Persegi)
          Positioned(
            top: 450,
            left: 115,
            child: buildLevelButton(
              imagePath: "assets/button_start.png",
              label: "Start Quiz",
              size: 170,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FlutterLevel1QuizPage(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
