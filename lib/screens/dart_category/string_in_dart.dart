import 'package:flutter/material.dart';

class StringInDartPage extends StatelessWidget {
  const StringInDartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("String in Dart"),
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
                "String in Dart",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 16),

            // 🔹 Section 1
            _buildParagraphs([
              "➽ A String in Dart is a sequence or series of characters. "
                  "The characters can be special characters, numbers or letters.",
              "➽ In Dart, we can represent strings with both the single quotes and double quotes.",
            ]),
            _buildCodeBox("Example:", [
              "void main() {",
              '  String name = "John";',
              '  var herName = "Doy";',
              "  print(name);",
              "  print(herName);",
              "}",
            ], isCode: true),
            _buildCodeBox("Output:", ["John", "Doy"], isOutput: true),

            const SizedBox(height: 24),

            // 🔹 Section 2
            const Text(
              "String Concatenation in Dart",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            _buildParagraphs([
              "➽ String concatenation is the process of adding two strings in Dart.",
              "➽ It is usually done with the help of the `+` operator symbol.",
            ]),
            _buildCodeBox("Syntax:", ["str1 + str2;"], isCode: true),
            _buildCodeBox("Example:", [
              "void main() {",
              '  String name = "John";',
              '  var anotherName = "Jack";',
              "  print(name + anotherName);",
              "}",
            ], isCode: true),
            _buildCodeBox("Output:", ["John Jack"], isOutput: true),
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
            padding: const EdgeInsets.only(bottom: 6, top: 12),
            child: Text(
              title,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
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
