import 'package:flutter/material.dart';

class EnumerationsPage extends StatelessWidget {
  const EnumerationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Enumerations in Dart"),
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
            const Center(
              child: Text(
                "Enumerations in Dart",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // 🔹 Introduction
            _buildSection("Introduction:", [
              "➡️ An enumeration is a set of predefined values. These values are known as members.",
              "➡️ They are useful when we want to deal with a limited set of values for a variable.",
              "➡️ For example, you can think of the number of days in a week – Monday, Tuesday, Wednesday etc.",
              "➡️ An Enumeration can be declared using the enum keyword.",
            ]),

            const SizedBox(height: 20),

            // Syntax
            _buildSection("Syntax:", []),
            _buildCodeBox("", [
              "enum <enum_name> {",
              "   const1,",
              "   const2,",
              "   ...",
              "   constN",
              "}",
            ], isCode: true),

            const SizedBox(height: 20),

            // Example
            _buildSection("Example:", []),
            _buildCodeBox("", [
              "void main() {",
              "  for (display x in display.values) {",
              "    print(x);",
              "  }",
              "}",
              "",
              "enum display {",
              "  my,",
              "  name,",
              "  // 'is' is keyword so not use",
              "  john",
              "}",
            ], isCode: true),

            const SizedBox(height: 20),

            // Output
            _buildSection("Output:", []),
            _buildCodeBox("", [
              "display.my",
              "display.name",
              "display.john",
            ], isOutput: true),
          ],
        ),
      ),
    );
  }

  // 🔹 Reusable Section
  static Widget _buildSection(String title, List<String> points) {
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

  // 🔹 Reusable Code/Output Box
  static Widget _buildCodeBox(String title, List<String> lines,
      {bool isCode = false, bool isOutput = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
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
