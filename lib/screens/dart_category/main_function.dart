import 'package:flutter/material.dart';

class DartMainFunctionPage extends StatelessWidget {
  const DartMainFunctionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("main() function in Dart"),
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
                "What is the main() function in Dart?",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            const SizedBox(height: 24),

            // 🔹 Explanation
            _buildSection("", [
              "➽ The main() function is a top-level function in Dart that initiates the execution of the program. It is the Dart programming language’s most important and crucial feature. In a program, the main() function can only be used once.",
              "➽ The main() function is responsible for all kinds of execution, including user-defined statements, functions, and libraries. The program starts with the main() function, which contains variable declarations, functions, and user-defined executable statements.",
            ]),

            const SizedBox(height: 20),

            // 🔹 Syntax
            _buildCodeBox("Syntax:", [
              "void main()",
              "{",
              "   // main() function body",
              "}",
            ], isCode: true),

            const SizedBox(height: 20),

            // 🔹 Example 1
            const Text(
              "Example :",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            _buildCodeBox("", [
              "void main() {",
              "   print(\"Hello, World!\");",
              "}",
            ], isCode: true),

            const SizedBox(height: 16),
            const Text(
              "The second example shows how we can pass arguments inside the main() function.",
              style: TextStyle(fontSize: 14, height: 1.5),
              textAlign: TextAlign.justify,
            ),

            const SizedBox(height: 16),

            // 🔹 Example 2
            const Text(
              "Example :",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            _buildCodeBox("", [
              "main(List<String> params){",
              "   var params =[\"a\",\"p\",\"e\"];",
              "",
              "   // print the length",
              "   print(params.length);",
              "   ",
              "   // print the list",
              "   print(params);",
              "}",
            ], isCode: true),
          ],
        ),
      ),
    );
  }

  // 🔹 Helper Section
  Widget _buildSection(String title, List<String> points) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title.isNotEmpty)
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        if (title.isNotEmpty) const SizedBox(height: 8),
        ...points.map(
          (p) => Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Text(
              p,
              style: const TextStyle(fontSize: 14, height: 1.5),
              textAlign: TextAlign.justify,
            ),
          ),
        ),
      ],
    );
  }

  // 🔹 Helper Code/Output Box
  Widget _buildCodeBox(String title, List<String> lines,
      {bool isCode = false, bool isOutput = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title.isNotEmpty)
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        if (title.isNotEmpty) const SizedBox(height: 6),
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
