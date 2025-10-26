import 'package:flutter/material.dart';

class StringPropertiesPage extends StatelessWidget {
  const StringPropertiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("String Properties in Dart"),
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
                "String Properties in Dart",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // 🔹 Introduction
            _buildSection("Introduction:", [
              "➡️ Strings in Dart have certain properties attached to them. "
                  "These properties come in handy in different use cases.",
            ]),

            const SizedBox(height: 20),

            // 🔹 List of properties
            _buildSection("Most commonly used properties are:", [
              "1. hashCode",
              "2. isEmpty",
              "3. isNotEmpty",
              "4. length",
              "5. runes",
            ]),

            const SizedBox(height: 20),

            // 🔹 Property: hashCode
            _buildSection("1) hashCode", [
              "The hashCode property of a string is used to print the hash code of the string.",
            ]),
            _buildCodeBox("Example:", [
              "void main(){",
              "  String name = \"Flutter\";",
              "  print(name.hashCode);",
              "}",
            ], isCode: true),
            _buildCodeBox("Output:", ["277248801"], isOutput: true),

            const SizedBox(height: 20),

            // 🔹 Property: isEmpty
            _buildSection("2) isEmpty", [
              "The isEmpty property returns true when the string is empty.",
            ]),
            _buildCodeBox("Example:", [
              "void main(){",
              "  String name = \"\";",
              "  print(name.isEmpty);",
              "}",
            ], isCode: true),
            _buildCodeBox("Output:", ["true"], isOutput: true),

            const SizedBox(height: 20),

            // 🔹 Property: isNotEmpty
            _buildSection("3) isNotEmpty", [
              "The isNotEmpty property returns true when the string is not empty.",
            ]),
            _buildCodeBox("Example:", [
              "void main(){",
              "  String name = \"Flutter\";",
              "  print(name.isNotEmpty);",
              "}",
            ], isCode: true),
            _buildCodeBox("Output:", ["true"], isOutput: true),

            const SizedBox(height: 20),

            // 🔹 Property: length
            _buildSection("4) length", [
              "The length property is used to print the number of characters in the string.",
            ]),
            _buildCodeBox("Example:", [
              "void main(){",
              "  String name = \"Flutter\";",
              "  print(name.length);",
              "}",
            ], isCode: true),
            _buildCodeBox("Output:", ["7"], isOutput: true),

            const SizedBox(height: 20),

            // 🔹 Property: runes
            _buildSection("5) runes", [
              "The runes property is used to print the Unicode code points of the string.",
            ]),
            _buildCodeBox("Example:", [
              "void main(){",
              "  String name = \"Flutter\";",
              "  print(name.runes);",
              "}",
            ], isCode: true),
            _buildCodeBox("Output:", ["(70, 108, 117, 116, 116, 101, 114)"],
                isOutput: true),
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
