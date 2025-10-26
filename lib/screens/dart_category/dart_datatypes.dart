import 'package:flutter/material.dart';

class DartDataTypesPage extends StatelessWidget {
  const DartDataTypesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dart - Data Types"),
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
            // 🔹 Title
            const Center(
              child: Text(
                "Dart - Data Types",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 16),

            // 🔹 Intro
            _buildParagraphs([
              "➽ Data Types for a variable specify the following:",
              "1) The amount of space to be allocated",
              "2) Possible values",
              "3) The operations to be performed on the variable",
              "",
              "➽ Dart is a programming language that is statically typed. This means the variable always holds the same type, which cannot be changed.",
              "",
              "➽ Data Types in Dart programming are given below:",
              "1) Numbers",
              "2) Strings",
              "3) Booleans",
              "4) Lists",
              "5) Maps",
            ]),

            const SizedBox(height: 24),

            // 🔹 Numbers
            const Text("1) Numbers:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 8),
            _buildParagraphs([
              "➽ In Dart, numbers are used to represent numeric literals. Dart numbers are classified into two types:",
              "1) Integer (whole numbers)",
              "2) Double (floating-point numbers)",
            ]),
            _buildCodeBox("Example:", [
              "void main() {",
              "  int num1 = 10;", 
              "  double num2 = 10.5;", 
              "",
              "  print(num1);",
              "  print(num2);",
              "}",
            ], isCode: true),

            const SizedBox(height: 24),

            // 🔹 Strings
            const Text("2) Strings:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 8),
            _buildParagraphs([
              "➽ A string is used to represent a sequence of characters. It is a sequence of UTF-16 code units.",
              "➽ String literals are embedded in either single or double quotes.",
            ]),
            _buildCodeBox("Example:", [
              "void main() {",
              "  String str1 = 'Hello';",
              "  String str2 = \"World\";", 
              "  String str3 = \"This is Dart\";", 
              "",
              "  print(str1);",
              "  print(str2);",
              "  print(str3);",
              "}",
            ], isCode: true),

            const SizedBox(height: 24),

            // 🔹 Booleans
            const Text("3) Booleans:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 8),
            _buildParagraphs([
              "➽ Boolean represents true/false values.",
              "➽ The keyword bool is used to represent a Boolean in Dart.",
            ]),
            _buildCodeBox("Example:", [
              "void main() {",
              "  bool isValid = true;", 
              "  bool isAlive = false;", 
              "",
              "  print(isValid);",
              "  print(isAlive);",
              "}",
            ], isCode: true),

            const SizedBox(height: 24),

            // 🔹 Lists
            const Text("4) Lists:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 8),
            _buildParagraphs([
              "➽ List data type is similar to an array in other languages.",
              "➽ A list is used to represent a collection of objects. It’s an ordered group of objects.",
            ]),
            _buildCodeBox("Example:", [
              "void main() {",
              "  var fruits = ['Apple', 'Banana', 'Mango'];", 
              "",
              "  print(fruits[0]);",
              "  print(fruits[1]);",
              "  print(fruits[2]);",
              "}",
            ], isCode: true),

            const SizedBox(height: 24),

            // 🔹 Maps
            const Text("5) Maps:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 8),
            _buildParagraphs([
              "➽ A Map object is a key and value pair.",
              "➽ Keys and values on a map may be of any type. It is a dynamic collection.",
            ]),
            _buildCodeBox("Example:", [
              "void main() {",
              "  var capital = {",
              "    'Nepal': 'Kathmandu',", 
              "    'India': 'New Delhi',", 
              "    'USA': 'Washington D.C.'", 
              "  };", 
              "",
              "  print(capital['Nepal']);",
              "  print(capital['USA']);",
              "}",
            ], isCode: true),
          ],
        ),
      ),
    );
  }

  // 🔹 Helper: Paragraph text
  Widget _buildParagraphs(List<String> texts) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: texts
          .map(
            (t) => Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Text(
                t,
                style: const TextStyle(fontSize: 14, height: 1.5),
                textAlign: TextAlign.justify,
              ),
            ),
          )
          .toList(),
    );
  }

  // 🔹 Helper: Code / Output box
  Widget _buildCodeBox(String title, List<String> lines,
      {bool isCode = false, bool isOutput = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: isOutput
                ? Colors.grey[200]
                : isCode
                    ? Colors.grey[100]
                    : Colors.grey[300],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: lines
                .map((line) => Text(
                      line,
                      style: TextStyle(
                        fontSize: 14,
                        color: isOutput
                            ? Colors.green[700]
                            : isCode
                                ? Colors.red[700]
                                : Colors.black,
                        fontFamily: isCode ? "monospace" : null,
                      ),
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }
}
