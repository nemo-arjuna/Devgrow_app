import 'package:flutter/material.dart';

class CommentsInDartPage extends StatelessWidget {
  const CommentsInDartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Comments in Dart"),
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
                "Comments in Dart",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 16),

            // 🔹 Introduction
            _buildParagraphs([
              "➽ Comments are a set of commands that are ignored by the compiler.",
              "➽ They are used in scenarios where you want to attach a note to your code or a short code so that when you visit it later, you can recall it easily.",
              "➽ The comment statements are usually ignored during the execution of the program.",
              "➽ There are multiple types of comments in Dart, mainly these are:",
              "1. Single-line comments",
              "2. Multi-line comments",
              "3. Documentation comments",
            ]),

            const SizedBox(height: 20),

            // 🔹 Single-line comments
            const Text(
              "1) Single Line Comments:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            _buildParagraphs([
              "➽ Single-line comments make use of // (double forward slash). They extend up to a new line character.",
            ]),

            const SizedBox(height: 12),
            _buildCodeBox("Syntax:", ["// This is a comment"], isCode: true),

            const SizedBox(height: 12),
            const Text("Example:", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            _buildCodeBox("", [
              "void main() {",
              "   // var x = 10;",
              "   print(\"Hello World\");",
              "}",
            ], isCode: true),

            const SizedBox(height: 12),
            _buildCodeBox("Output:", ["Hello World"], isOutput: true),

            const SizedBox(height: 28),

            // 🔹 Multi-line comments
            const Text(
              "2) Multi-line Comments:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            _buildParagraphs([
              "➽ A multi-line comment makes use of /* */. Everything put between the opening /* and the closing */ will be ignored by the compiler.",
            ]),

            const SizedBox(height: 12),
            _buildCodeBox("Syntax:", [
              "/*",
              "   Inside comment",
              "   Another inside comment",
              "*/",
            ], isCode: true),

            const SizedBox(height: 12),
            const Text("Example:", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            _buildCodeBox("", [
              "void main() {",
              "   /*",
              "   int x = 10;",
              "   print(x);",
              "   */",
              "   print(\"Hello World\");",
              "}",
            ], isCode: true),

            const SizedBox(height: 12),
            _buildCodeBox("Output:", ["Hello World"], isOutput: true),

            const SizedBox(height: 28),

            // 🔹 Documentation comments
            const Text(
              "3) Documentation Comments:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            _buildParagraphs([
              "➽ The documentation comment is used in cases where we are generating reference for a project or software package.",
            ]),

            const SizedBox(height: 12),
            _buildCodeBox("Syntax:", [
              "/// This",
              "/// is",
              "/// a",
              "/// documentation" ,
              "/// comment",
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
