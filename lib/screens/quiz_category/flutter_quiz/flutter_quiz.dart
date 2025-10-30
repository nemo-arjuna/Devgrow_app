import 'package:flutter/material.dart';
import 'package:Devgrow/screens/quiz_category/flutter_quiz/quiz_flutter_lvl1.dart';

class FlutterQuiz extends StatelessWidget {
  const FlutterQuiz({super.key});

  Widget buildLevelButton({
    required String imagePath,
    required double size,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
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
              size: 170,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FlutterLevel1Quiz(),
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
