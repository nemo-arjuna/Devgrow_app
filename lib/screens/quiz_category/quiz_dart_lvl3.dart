import 'dart:async';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'quiz_result_page.dart';

class DartLevel3QuizPage extends StatefulWidget {
  const DartLevel3QuizPage({super.key});

  @override
  State<DartLevel3QuizPage> createState() => _DartLevel3QuizPageState();
}

class _DartLevel3QuizPageState extends State<DartLevel3QuizPage> {
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
      "question": "1. initState() dipanggil saat?",
      "options": [
        "Tiap rebuild",
        "Awal widget dibuat",
        "Setelah dispose",
        "Saat klik tombol"
      ],
      "answer": "Awal widget dibuat",
    },
    {
      "question":
          "Keyword untuk membuat variabel yang nilainya tidak bisa diubah?",
      "options": ["var", "final", "const", "static"],
      "answer": "final",
    },
    {
      "question": "Fungsi utama dalam program Dart disebut?",
      "options": ["start()", "main()", "run()", "init()"],
      "answer": "main()",
    },
    {
      "question": "Operator untuk membandingkan kesamaan di Dart?",
      "options": ["=", "==", "===", "equals"],
      "answer": "==",
    },
    {
      "question": "Keyword untuk membuat class turunan?",
      "options": ["inherit", "extends", "implements", "with"],
      "answer": "extends",
    },
    {
      "question": "Tipe data untuk true/false di Dart?",
      "options": ["boolean", "bool", "Boolean", "int"],
      "answer": "bool",
    },
    {
      "question": "Apa perbedaan var dan dynamic?",
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
        builder: (context) => QuizResultWidget(
          score: score,
          total: questions.length,
          bgImage: "assets/bg_lvl3.jpg",
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
              image: AssetImage("assets/bg_lvl3.jpg"),
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
                                image: AssetImage("assets/ice_button.png"),
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
