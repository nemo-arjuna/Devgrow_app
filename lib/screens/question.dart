import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QuestionPage(),
    );
  }
}

class QuestionPage extends StatefulWidget {
  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  final List<Map<String, String>> questions = [
    {
      "q": "What skills are required to use Flutter?",
      "a":
          "Basic understanding of the Dart programming language, Object-Oriented Programming (OOP) concepts, basic mobile app development knowledge, UI/UX design principles, and familiarity with Flutter widgets."
    },
    {
      "q": "Explain what Flutter is.",
      "a":
          "Flutter is an open-source UI framework by Google for building cross-platform applications (Android, iOS, Web, and Desktop) from a single codebase using the Dart programming language."
    },
    {
      "q": "What are the advantages of using Flutter?",
      "a":
          "Single codebase for multiple platforms, fast development with hot reload, customizable widgets, high performance, and a growing developer community."
    },
    {
      "q": "Describe what a stateless widget is.",
      "a":
          "A stateless widget is a widget that does not store any state and remains unchanged after it is built. It is immutable and only updates when external data changes."
    },
    {
      "q": "Describe what a stateful widget is.",
      "a":
          "A stateful widget is a widget that can store and update its state during its lifetime, allowing the UI to change dynamically based on user interactions."
    },
    {
      "q": "Explain what a key is in Flutter.",
      "a":
          "A key is a unique identifier for a widget that helps Flutter preserve the state of widgets when rebuilding the UI, making rendering more efficient."
    },
    {
      "q": "Explain what a ticker is in Flutter.",
      "a":
          "A ticker is a signal that provides a callback every frame, typically used for animations to update values continuously."
    },
    {
      "q": "Name some limitations of Flutter.",
      "a":
          "Relatively large app size, fewer third-party libraries compared to native platforms, potential performance issues with complex animations, and some platform-specific features may require native code."
    },
    {
      "q": "Explain what a Flutter widget is.",
      "a":
          "A widget is the basic building block of Flutter's UI. Everything in Flutter, from text and images to layouts, is a widget."
    },
    {
      "q": "Explain what pubspec.yaml files are for.",
      "a":
          "The pubspec.yaml file manages project settings, dependencies, assets, and metadata for a Flutter application."
    },
    {
      "q": "Explain what the setState() method does.",
      "a":
          "The setState() method notifies the Flutter framework that the internal state of a StatefulWidget has changed, prompting the UI to rebuild."
    },
    {
      "q": "Describe what the Container class does in Flutter.",
      "a":
          "A Container is a rectangular visual element that can be customized with styling, padding, margin, alignment, and decoration."
    },
    {
      "q": "What are the main elements of Flutter?",
      "a":
          "The main elements of Flutter include: Widgets (UI components), Dart language, Flutter framework, and the Skia rendering engine."
    },
    {
      "q": "What’s the use of Navigation.push in Flutter?",
      "a":
          "Navigation.push is used to navigate to a new page by adding a route to the navigation stack."
    },
    {
      "q": "What’s the role of image.network() constructor in Flutter?",
      "a":
          "The image.network() constructor loads and displays an image directly from a given URL within a Flutter application."
    },
  ];

  List<bool> expanded = [];

  @override
  void initState() {
    super.initState();
    expanded = List.generate(questions.length, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Question", style: TextStyle(fontWeight: FontWeight.bold),),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: questions.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.lightBlue, width: 1),
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
            child: ExpansionTile(
              tilePadding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
              title: Row(
                children: [
                  Text(
                    "${index + 1}",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      questions[index]["q"]!,
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    questions[index]["a"]!,
                    style: const TextStyle(color: Colors.black87),
                  ),
                ),
              ],
              onExpansionChanged: (val) {
                setState(() {
                  expanded[index] = val;
                });
              },
            ),
          );
        },
      ),
    );
  }
}
