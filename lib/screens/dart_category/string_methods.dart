import 'package:flutter/material.dart';

class StringMethodsPage extends StatelessWidget {
  const StringMethodsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("String Methods in Dart"),
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
                "String Methods in Dart",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // 🔹 Introduction
            _buildSection("Introduction:", [
              "➡️ Dart provides many useful methods to work with strings.",
              "➡️ These methods allow checking contents, changing cases, splitting, and comparing strings.",
              "➡️ Let’s explore some commonly used string methods in Dart:",
            ]),

            const SizedBox(height: 20),

            _buildSection("🔹 Common String Methods:", [
              "1. contains()",
              "2. endsWith()",
              "3. toLowerCase()",
              "4. toUpperCase()",
              "5. split()",
              "6. compareTo()",
            ]),

            const SizedBox(height: 20),

            // 1) contains()
            _buildSection("1) contains()", [
              "➡️ The contains() method checks if the string contains a given substring.",
            ]),
            _buildCodeBox("Example:", [
              "void main(){",
              "  String name = \"Flutter\";",
              "  print(name.contains(\"utt\"));",
              "}",
            ], isCode: true),
            _buildCodeBox("Output:", ["true"], isOutput: true),

            const SizedBox(height: 20),

            // 2) endsWith()
            _buildSection("2) endsWith()", [
              "➡️ The endsWith() method checks if the string ends with a specific substring.",
            ]),
            _buildCodeBox("Example:", [
              "void main(){",
              "  String name = \"Flutter\";",
              "  print(name.endsWith(\"er\"));",
              "}",
            ], isCode: true),
            _buildCodeBox("Output:", ["true"], isOutput: true),

            const SizedBox(height: 20),

            // 3) toLowerCase()
            _buildSection("3) toLowerCase()", [
              "➡️ Converts all characters of the string into lowercase.",
            ]),
            _buildCodeBox("Example:", [
              "void main(){",
              "  String name = \"Flutter\";",
              "  print(name.toLowerCase());",
              "}",
            ], isCode: true),
            _buildCodeBox("Output:", ["flutter"], isOutput: true),

            const SizedBox(height: 20),

            // 4) toUpperCase()
            _buildSection("4) toUpperCase()", [
              "➡️ Converts all characters of the string into uppercase.",
            ]),
            _buildCodeBox("Example:", [
              "void main(){",
              "  String name = \"Flutter\";",
              "  print(name.toUpperCase());",
              "}",
            ], isCode: true),
            _buildCodeBox("Output:", ["FLUTTER"], isOutput: true),

            const SizedBox(height: 20),

            // 5) split()
            _buildSection("5) split()", [
              "➡️ Splits the string based on a given pattern and returns a list.",
            ]),
            _buildCodeBox("Example:", [
              "void main(){",
              "  String name = \"Flutter\";",
              "  print(name.split(\"t\"));",
              "}",
            ], isCode: true),
            _buildCodeBox("Output:", ["[Flu, , er]"], isOutput: true),

            const SizedBox(height: 20),

            // 6) compareTo()
            _buildSection("6) compareTo()", [
              "➡️ Compares two strings.",
              "➡️ Returns 0 if equal, <0 if smaller, >0 if greater.",
            ]),
            _buildCodeBox("Example:", [
              "void main(){",
              "  String name = \"Flutter\";",
              "  print(name.compareTo(\"Flutter\"));",
              "  print(name.compareTo(\"Dart\"));",
              "}",
            ], isCode: true),
            _buildCodeBox("Output:", [
              "0",
              "1",
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
