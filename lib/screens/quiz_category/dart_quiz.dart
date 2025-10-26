import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:Devgrow/screens/quiz_category/quiz_dart_lvl1.dart';
import 'package:Devgrow/screens/quiz_category/quiz_dart_lvl2.dart';
import 'package:Devgrow/screens/quiz_category/quiz_dart_lvl3.dart';
=======
import 'package:devgrow/screens/quiz_category/quiz_dart_lvl1.dart';
import 'package:devgrow/screens/quiz_category/quiz_dart_lvl2.dart';
import 'package:devgrow/screens/quiz_category/quiz_dart_lvl3.dart';
>>>>>>> ff1488594e74c4900aa16a61db1010afde79b2ae

class DartQuizPage extends StatefulWidget {
  const DartQuizPage({super.key});

  @override
  State<DartQuizPage> createState() => _DartQuizPageState();
}

class _DartQuizPageState extends State<DartQuizPage> {
  String? selectedLevel; // simpan level yang dipilih

  Widget buildLevelButton({
    required String imagePath,
    required String label,
    required double radius,
    required String level,
  }) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              selectedLevel = level;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.yellow.withOpacity(0.8),
                  blurRadius: 20,
                  spreadRadius: 5,
                ),
              ],
            ),
            child: CircleAvatar(
              radius: radius,
              backgroundImage: AssetImage(imagePath),
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontFamily: "Minecraft", // pakai font pixel
            shadows: [
              Shadow(
                blurRadius: 6,
                color: Colors.black,
                offset: Offset(2, 2),
              ),
            ],
          ),
        ),
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
                image: AssetImage("assets/bg_level.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // 🔹 Level 1
          Positioned(
            top: 180,
            left: 310,
            child: buildLevelButton(
              imagePath: "assets/level_1.png",
              label: " Lvl 1⚔️",
              radius: 22,
              level: "Level 1",
            ),
          ),

          // 🔹 Level 2
          Positioned(
            top: 228,
            right: 335,
            child: buildLevelButton(
              imagePath: "assets/level_2.png",
              label: " Lvl 2⚔️",
              radius: 25,
              level: "Level 2",
            ),
          ),

          // 🔹 Level 3
          Positioned(
            bottom: 460,
            left: 150,
            child: buildLevelButton(
              imagePath: "assets/level_3.png",
              label: " Lvl 3⚔️",
              radius: 28,
              level: "Level 3",
            ),
          ),

          // 🔹 Tombol "Select Level" animasi pop in/out
          Align(
            alignment: Alignment.bottomCenter,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 600),
              switchInCurve: Curves.elasticOut,
              switchOutCurve: Curves.easeIn,
              transitionBuilder: (child, animation) {
                return ScaleTransition(
                  scale: animation,
                  child: FadeTransition(
                    opacity: animation,
                    child: child,
                  ),
                );
              },
              child: selectedLevel == null
                  ? const SizedBox.shrink()
                  : Container(
                      key: ValueKey(selectedLevel),
                      margin: const EdgeInsets.only(bottom: 30),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.green.shade700, // warna rumput
                        border: Border.all(
                          color: Colors.black,
                          width: 4, // border pixel
                        ),
                        borderRadius: BorderRadius.zero, // kotak pixel
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black,
                            offset: Offset(4, 4), // shadow pixel
                          ),
                        ],
                        image: const DecorationImage(
                          image: AssetImage("assets/bg_bricks.jpeg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: TextButton(
                        onPressed: () {
                          switch (selectedLevel) {
                            case "Level 1":
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const DartLevel1QuizPage(),
                                ),
                              );
                              break;
                            case "Level 2":
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const DartLevel2QuizPage(),
                                ),
                              );
                              break;
                            case "Level 3":
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const DartLevel3QuizPage(),
                                ),
                              );
                              break;
                            default:
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    "Belum ada quiz untuk $selectedLevel",
                                    style: const TextStyle(
                                      fontFamily: "Minecraft",
                                    ),
                                  ),
                                ),
                              );
                          }
                        },
                        child: Text(
                          "Select $selectedLevel",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontFamily: "Minecraft", // Minecraft vibe
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
          ),
        ],
      ),
    );
  }
}
