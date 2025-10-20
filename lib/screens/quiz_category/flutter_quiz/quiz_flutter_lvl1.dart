import 'dart:async';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'result.dart';

class FlutterLevel1QuizPage extends StatefulWidget {
  const FlutterLevel1QuizPage({super.key});

  @override
  State<FlutterLevel1QuizPage> createState() => _FlutterLevel1QuizPageState();
}

class _FlutterLevel1QuizPageState extends State<FlutterLevel1QuizPage> {
  int currentQuestionIndex = 0;
  int score = 0;
  int timeLeft = 10;
  Timer? timer;

  int countdown = 3;
  bool quizStarted = false;

  final player = AudioPlayer(); // Countdown & effect
  final bgmPlayer = AudioPlayer(); // Bgm

  final List<Map<String, Object>> questions = [
    {
      "question":
          "1. Bahasa pemrograman utama untuk membuat aplikasi Flutter adalah",
      "options": ["Java", "Dart", "Kotlin", "Swift"],
      "answer": "Dart",
    },
    {
      "question": "2. Perintah untuk membuat proyek Flutter baru adalah",
      "options": [
        "flutter new project",
        "flutter create <nama_proyek>",
        "flutter init <nama_proyek>",
        "flutter build <nama_proyek>"
      ],
      "answer": "flutter create <nama_proyek>",
    },
    {
      "question":
          "3. Widget dasar yang digunakan untuk menampilkan teks di Flutter adalah",
      "options": ["TextWidget()", "StringWidget()", "Text()", "Label()"],
      "answer": "Text()",
    },
    {
      "question": "4. Apa fungsi dari main() dalam program Dart?",
      "options": [
        "Mengimpor library Flutter",
        "Menentukan widget utama",
        "Titik awal eksekusi program",
        "Menjalankan build context"
      ],
      "answer": "Titik awal eksekusi program",
    },
    {
      "question":
          "5. Widget yang digunakan untuk menampung banyak widget anak secara vertikal?",
      "options": ["Row", "Stack", "Column", "Container"],
      "answer": "Column",
    },
    {
      "question": "6. Tipe data untuk true/false di Dart?",
      "options": ["boolean", "bool", "Boolean", "int"],
      "answer": "bool",
    },
    {
      "question": "7. Apa perbedaan var dan dynamic?",
      "options": [
        "Tidak ada perbedaan",
        "var harus tetap tipe setelah diisi",
        "dynamic tipe tetap",
        "var bisa berubah tipe sesuka hati"
      ],
      "answer": "var harus tetap tipe setelah diisi",
    },
  ];

  @override
  void initState() {
    super.initState();
    startCountdown();
  }

  void startCountdown() {
    countdown = 3;
    player.play(AssetSource("sounds/countdown.mp3"));

    Timer.periodic(const Duration(seconds: 1), (t) async {
      if (countdown > 1) {
        setState(() {
          countdown--;
        });
        await player.play(AssetSource("sounds/countdown.mp3"));
      } else if (countdown == 1) {
        setState(() {
          countdown = 0;
        });

        Future.delayed(const Duration(seconds: 1), () async {
          t.cancel();
          setState(() {
            quizStarted = true;
          });
          // Background music looping
          await bgmPlayer.setReleaseMode(ReleaseMode.loop);
          await bgmPlayer.play(AssetSource("sounds/quiz_sound.mp3"));
          startTimer();
        });
      }
    });
  }

  void startTimer() {
    timeLeft = 10;
    timer?.cancel();
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      setState(() {
        if (timeLeft > 0) {
          timeLeft--;
        } else {
          nextQuestion();
        }
      });
    });
  }

  void checkAnswer(String selected) {
    String correctAnswer = questions[currentQuestionIndex]["answer"] as String;
    if (selected == correctAnswer) {
      score++;
    }
    nextQuestion();
  }

  Future<void> nextQuestion() async {
    timer?.cancel();

    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
      startTimer();
    } else {
      // Stop bgm saat quiz selesai
      await bgmPlayer.stop();

      setState(() {
        quizStarted = false;
      });

      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => FlutterQuizResultWidget(
          score: score,
          total: questions.length,
          bgImage: "assets/flutter_quiz_bg.jpg",
          onRetry: () {
            Navigator.pop(context);
            setState(() {
              currentQuestionIndex = 0;
              score = 0;
              startCountdown();
            });
          },
          onBackToLevels: () {
            Navigator.pop(context); // tutup dialog
            Navigator.pop(context); // kembali ke halaman level
          },
        ),
      );
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    player.dispose();
    bgmPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var question = questions[currentQuestionIndex];

    return Theme(
      data: Theme.of(context).copyWith(
        textTheme: Theme.of(context).textTheme.apply(
              fontFamily: "Minecraft", // Font
            ),
      ),
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/flutter_quiz_bg.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: quizStarted
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // 🔹 Timer
                      Text(
                        "⏳ $timeLeft detik",
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.redAccent,
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Pertanyaan
                      Text(
                        question["question"] as String,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                                blurRadius: 6,
                                color: Colors.black,
                                offset: Offset(2, 2))
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),

                      // Edit pilihan ganda
                      ...(question["options"] as List<String>).map((option) {
                        return GestureDetector(
                          onTap: () => checkAnswer(option),
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 6),
                            padding: const EdgeInsets.symmetric(
                                vertical: 14, horizontal: 12),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                image: AssetImage("assets/stone_button.png"),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black54,
                                  blurRadius: 4,
                                  offset: Offset(2, 2),
                                )
                              ],
                            ),
                            child: Center(
                              child: Text(
                                option,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  shadows: [
                                    Shadow(
                                        blurRadius: 6,
                                        color: Colors.black,
                                        offset: Offset(2, 2))
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ],
                  )
                : AnimatedSwitcher(
                    duration: const Duration(milliseconds: 600),
                    transitionBuilder: (child, animation) {
                      return ScaleTransition(
                        scale: CurvedAnimation(
                          parent: animation,
                          curve: Curves.easeOutBack,
                        ),
                        child: FadeTransition(
                          opacity: animation,
                          child: child,
                        ),
                      );
                    },
                    child: Text(
                      countdown > 0 ? "$countdown" : "Mulai!",
                      key: ValueKey(countdown),
                      style: const TextStyle(
                        fontSize: 72,
                        fontWeight: FontWeight.bold,
                        color: Colors.yellow,
                        shadows: [
                          Shadow(
                              blurRadius: 8,
                              color: Colors.black,
                              offset: Offset(3, 3))
                        ],
                      ),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
