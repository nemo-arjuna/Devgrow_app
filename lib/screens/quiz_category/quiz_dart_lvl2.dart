import 'dart:async';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'quiz_result_page.dart';

class DartLevel2QuizPage extends StatefulWidget {
  const DartLevel2QuizPage({super.key});

  @override
  State<DartLevel2QuizPage> createState() => _DartLevel2QuizPageState();
}

class _DartLevel2QuizPageState extends State<DartLevel2QuizPage> {
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
<<<<<<< HEAD
      "question": "1. Bahasa Dart pertama kali dikembangkan oleh siapa ?",
      "options": ["Facebook", "Microsoft", "Google", "Apple"],
      "answer": "Google",
    },
    {
      "question": "2.File Dart biasanya memiliki ekstensi file apa ?",
      "options": [".dart", ".drt", ".dlang", ".dartlang"],
      "answer": ".dart",
    },
    {
      "question": "3. Perintah untuk menjalankan program Dart di terminal adalah:",
      "options": ["dart start main.dart", "dart run main.dart", "run dart main.dart", "execute dart main.dart"],
      "answer": "dart run main.dart",
    },
    {
      "question": "4. Fungsi utama dalam program Dart disebut:",
      "options": ["void()", "main()", "start()", "run()"],
      "answer": "main()",
    },
    {
      "question": "5. Tipe data yang digunakan untuk menyimpan angka pecahan di Dart adalah:",
      "options": ["int", "double", "float", "num"],
      "answer": "double",
    },
    {
      "question": "6. Berikut ini bukan tipe data \n bawaan di Dart adalah:",
      "options": [
        "String",
        "bool",
        "char",
        "int"
      ],
      "answer": "char",
    },
    {
      "question": "7. Bagaimana cara mencetak teks ke konsol di Dart?",
      "options": [
        'System.out("Hello");',
        'echo("Hello");',
        'print("Hello");',
        'console.log("Hello");'
      ],
      "answer": 'print("Hello");',
=======
      "question": "1. Apa tipe data default untuk angka pecahan di Dart?",
      "options": ["int", "double", "num", "float"],
      "answer": "double",
    },
    {
      "question":
          "2. Keyword untuk membuat variabel yang nilainya tidak bisa diubah?",
      "options": ["var", "final", "const", "static"],
      "answer": "final",
    },
    {
      "question": "3. Fungsi utama dalam program Dart disebut?",
      "options": ["start()", "main()", "run()", "init()"],
      "answer": "main()",
    },
    {
      "question": "4. Operator untuk membandingkan kesamaan di Dart?",
      "options": ["=", "==", "===", "equals"],
      "answer": "==",
    },
    {
      "question": "5. Keyword untuk membuat class turunan?",
      "options": ["inherit", "extends", "implements", "with"],
      "answer": "extends",
    },
    {
      "question": "6. Fungsi setState() digunakan untuk",
      "options": [
        "Menyimpan data global",
        "Mengubah tema aplikasi",
        "Refresh UI saat data berubah",
        "Menghentikan aplikasi"
      ],
      "answer": "Refresh UI saat data berubah",
    },
    {
      "question": "7. Dalam Flutter, BuildContext digunakan untuk",
      "options": [
        "Mengakses database lokal",
        "Mengatur navigasi halaman",
        "Menentukan letak widget di pohon widget",
        "Menentukan ukuran layar"
      ],
      "answer": "Menentukan letak widget di pohon widget",
>>>>>>> ff1488594e74c4900aa16a61db1010afde79b2ae
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
          bgImage: "assets/bg_lvl2.jpg",
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
              image: AssetImage("assets/bg_lvl2.jpg"),
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
                                image: AssetImage("assets/fire_button.png"),
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
