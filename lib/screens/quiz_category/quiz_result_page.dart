import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'dart_quiz.dart';

class QuizResultWidget extends StatefulWidget {
  final int score;
  final int total;
  final String bgImage;
  final Function() onRetry;
  final Function() onBackToLevels;

  const QuizResultWidget({
    super.key,
    required this.score,
    required this.total,
    required this.bgImage,
    required this.onRetry,
    required this.onBackToLevels,
  });

  @override
  State<QuizResultWidget> createState() => _QuizResultWidgetState();
}

class _QuizResultWidgetState extends State<QuizResultWidget> {
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    _confettiController =
        ConfettiController(duration: const Duration(seconds: 4));
    _confettiController.play(); // langsung mainkan saat masuk halaman
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  Widget buildPixelButton({
    required String label,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: 220,
      height: 60,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
          backgroundColor: Colors.transparent,
          elevation: 8,
        ),
        onPressed: onPressed,
        child: Ink(
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage("assets/bg_bricks.jpeg"),
              fit: BoxFit.cover,
            ),
            border: Border.all(color: Colors.black, width: 4),
            boxShadow: const [
              BoxShadow(
                color: Colors.black,
                offset: Offset(4, 4),
              ),
            ],
          ),
          child: Center(
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: "Minecraft",
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
    double progress = widget.score / widget.total;

    return Theme(
      data: Theme.of(context).copyWith(
        textTheme: Theme.of(context).textTheme.apply(fontFamily: "Minecraft"),
      ),
      child: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [
            // 🔹 Background
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(widget.bgImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // 🔹 Confetti
            ConfettiWidget(
              confettiController: _confettiController,
              shouldLoop: false,
              blastDirectionality: BlastDirectionality.explosive,
              emissionFrequency: 0.05,
              numberOfParticles: 20,
              maxBlastForce: 40,
              minBlastForce: 10,
              gravity: 0.3,
              colors: const [
                Colors.yellow,
                Colors.green,
                Colors.blue,
                Colors.red,
                Colors.purple,
              ],
            ),

            // 🔹 Konten utama
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.emoji_events,
                  size: 80,
                  color: Colors.amber,
                ),
                const SizedBox(height: 20),
                const Text(
                  "🎉 Quiz Selesai! 🎉",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        blurRadius: 8,
                        color: Colors.black,
                        offset: Offset(3, 3),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // 🔹 Skor
                Text(
                  "Skor Anda: ${widget.score} / ${widget.total}",
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.yellow,
                  ),
                ),
                const SizedBox(height: 20),

                // 🔹 Progress bar (XP bar)
                Container(
                  width: 280,
                  height: 24,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 3),
                    color: Colors.grey[800],
                  ),
                  child: FractionallySizedBox(
                    alignment: Alignment.centerLeft,
                    widthFactor: progress,
                    child: Container(
                      color: Colors.greenAccent,
                    ),
                  ),
                ),
                const SizedBox(height: 40),

                // 🔹 Tombol
                buildPixelButton(
                  label: "🔄 Ulang Quiz",
                  onPressed: widget.onRetry,
                ),
                const SizedBox(height: 20),
                buildPixelButton(
                  label: "⬅️ Kembali ke Level",
                  onPressed: widget.onBackToLevels,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
