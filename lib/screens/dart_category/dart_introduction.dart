import 'package:flutter/material.dart';

class DartIntroductionPage extends StatelessWidget {
  const DartIntroductionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dart - Introduction"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            const Center(
              child: Text(
                "Introduction to the Dart",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Gambar
            Center(
              child: Image.asset(
                "assets/dart_intro.png",
                height: 100,
              ),
            ),

            const SizedBox(height: 24),

            // Section: Introduction
            _buildSection("Introduction:", [
              "➽ As you venture into the world of Flutter app development, it's essential to familiarize yourself with the Dart programming language.",
              "➽ Dart serves as the foundation for building Flutter applications and understanding its fundamentals is crucial for writing clean, efficient code.",
              "➽ In this beginner-friendly blog post, we will introduce you to the Dart programming language, its features, and how it is used within the Flutter framework. Let's dive in!",
            ]),

            const SizedBox(height: 16),

            // Section: What is Dart?
            _buildSection("What is Dart?", [
              "➽ Dart is a modern, object-oriented programming language developed by Google. It is specifically designed for building high-performance, cross-platform applications. Dart offers a clean syntax, strong typing, and a wide range of built-in libraries, making it a powerful tool for app development.",
            ]),

            const SizedBox(height: 16),

            // Section: What Can Dart Be Used For?
            _buildSection("What Can Dart Be Used For?", [
              "➽ Dart is a versatile programming language with applications in various domains. Here are a few examples of what Dart can be used for:",
              "➽ Flutter: Dart is the primary language used in Flutter, Google's UI toolkit for building natively compiled applications for mobile, web, and desktop from a single codebase.",
              "➽ Flutter's fast development, expressive UI, and excellent performance have made it a favourite choice among developers.",
              "➽ Web Development: Dart can also be used for web development, thanks to the Dart SDK's ability to compile Dart code to efficient JavaScript. Dart's strong typing, asynchronous programming support, and extensive libraries make it suitable for creating complex and performant web applications.",
              "➽ Server-Side Development: With frameworks like Aqueduct and Angel, Dart can be used for server-side development. These frameworks provide tools and libraries for building scalable and efficient backend systems, APIs, and web servers using Dart.",
              "➽ Internet of Things (IoT): Dart's efficient and lightweight nature makes it well-suited for IoT development. Dart can be used to write code for microcontrollers, embedded systems, and IoT devices, enabling developers to create connected applications for the Internet of Things.",
            ]),
          ],
        ),
      ),
    );
  }

  // 🔹 Helper Widget untuk section
  Widget _buildSection(String title, List<String> points) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 8),
        ...points.map(
          (p) => Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Text(
              p,
              textAlign: TextAlign.justify,
              style: const TextStyle(
                fontSize: 14,
                height: 1.5,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
