import 'package:flutter/material.dart';

class StringInterpolationPage extends StatelessWidget {
  const StringInterpolationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("String Interpolation in Dart"),
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
                "String Interpolation in Dart",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 24),

            // 🔹 Introduction
            _buildSection("Introduction:", [
              "➽ There are times when we want to make use of variables inside the statement that are made up of string values.",
              "➽ We know that we can add two strings together in Dart with the help of the + symbol operator.",
              "➽ But to make use of a variable in between the strings that we are concatenating, we need to add one more + symbol and then type the name of the variable, which works okay when it comes to small statements.",
            ]),

            const SizedBox(height: 20),

            // 🔹 Syntax
            _buildCodeBox("Syntax :", ["'print this \${variable}'"]),

            const SizedBox(height: 20),

            // 🔹 Example
            const Text(
              "Example :",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),
            _buildCodeBox("",
              [
                "void main(){",
                "   String name = \"John\";",
                "   var rollNo = 5;",
                "   print(\"Name is \${name} and collegeID is \${rollNo}\");",
                "}",
              ],
              isCode: true,
            ),

            const SizedBox(height: 20),

            // 🔹 Output
            _buildCodeBox("Output :", ["Name is John and rollNo is 5"],
                isOutput: true),
          ],
        ),
      ),
    );
  }

  // 🔹 Reusable Section Widget
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

  // 🔹 Reusable Code/Output Box
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
        const SizedBox(height: 6),
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
