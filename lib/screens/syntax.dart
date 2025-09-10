import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SyntaxPage(),
    );
  }
}

class SyntaxPage extends StatelessWidget {
  final List<Map<String, dynamic>> sections = [
    {
      "title": "Basic Consepts in Dart",
      "items": ["Comments", "Input and Output"],
    },
    {
      "title": "Data Types",
      "items": [
        "Boolean DataType",
        "List DataType",
        "Map DataType",
        "Number DataType",
        "String DataType"
      ],
    },
    {
      "title": "Operators",
      "items": [
        "Arithmetic Opera..",
        "Assignment Oper..",
        "Bitwise Operators",
        "Increment & Decr..",
        "Logical Operator",
        "Relational Opera.."
      ],
    },
    {
      "title": "Selection",
      "items": [
        "Else If Ladder",
        "If Else",
        "Nested If",
        "Simple If",
        "SwitchCase"
      ],
    },
    {
      "title": "Iteration",
      "items": [
        "Do-While Loop",
        "For in Loop",
        "Introduction to F..",
        "Nested Loop",
        "While Loop"
      ],
    },
    {
      "title": "Functions",
      "items": [
        "Functions",
        "Passing Values to..",
        "Recursive Function",
        "Returning Value f.."
      ],
    },
    {
      "title": "List (array)",
      "items": ["1-D List", "Lists", "Multi-Dimension..", "Type of Lists"],
    },
    {
      "title": "Introduction",
      "items": ["Introduction"],
    },
    {
      "title": "List (array)",
      "items": ["1-D List", "Lists", "Multi-Dimension..", "Type of List"],
    },
    {
      "title": "Maps",
      "items": [
        "Maps",
        "Insert into Map",
        "Display Map",
        "Delete from Map",
        "Update Map"
      ],
    },
    {
      "title": "Strings",
      "items": [
        "Convert String to Int",
        "Strings",
        "contains()",
        "endWith()",
        "IndexOf()",
        "LastindexOf()",
        "replaceAll()",
        "split()",
        "startsWith()",
        "toLowerCase()",
        "trim()"
      ],
    },
    {
      "title": "Math",
      "items": [
        "acos()",
        "asin()",
        "atan()",
        "cost()",
        "exp()",
        "log()",
        "max()",
        "min()",
        "pow()",
        "sin()",
        "tan()",
      ],
    },
    {
      "title": "Exception handling",
      "items": [
        "Try Catch",
        "Finally Keyword..",
      ],
    },
    {
      "title": "File handling",
      "items": ["Reading from a File", "Write into a File"],
    },
  ];

  SyntaxPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Syntaxes",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 21,
          ),
        ),
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(10),
        itemCount: sections.length,
        separatorBuilder: (_, __) => const SizedBox(height: 10),
        itemBuilder: (context, index) {
          final section = sections[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Expanded(child: Divider(thickness: 1)),
                  const SizedBox(width: 8),
                  Text(
                    section["title"],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Expanded(child: Divider(thickness: 1)),
                ],
              ),
              const SizedBox(height: 6),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: (section["items"] as List<String>).map((item) {
                    return Container(
                      width: 150,
                      margin: const EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFF00D6FB), Color(0xFF007F95)],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 4,
                            offset: const Offset(2, 2),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            item,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Divider(
                            color: Colors.white.withOpacity(0.8),
                            thickness: 1,
                          ),
                          const SizedBox(height: 4),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: const Color(0xFF005F73),
                              minimumSize: const Size(double.infinity, 36),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: EdgeInsets.zero,
                              elevation: 0,
                            ),
                            onPressed: () {
                              showCodeDialog(
                                context,
                                item,
                                "Contoh kode untuk $item\n\nvoid main() {\n  print('Hello from $item');\n}",
                              );
                            },
                            child: const Text("Show"),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

void showCodeDialog(BuildContext context, String title, String code) {
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF00D6FB), Color(0xFF007F95)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.copy, color: Colors.white),
                    onPressed: () {
                      Clipboard.setData(ClipboardData(text: code));
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Code copied!")),
                      );
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.red),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(12),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SelectableText(
                  code,
                  style: const TextStyle(fontFamily: 'monospace'),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
