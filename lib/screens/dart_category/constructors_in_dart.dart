import 'package:flutter/material.dart';

class ConstructorsPage extends StatelessWidget {
  const ConstructorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Constructors in Dart"),
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
                "Constructors in Dart",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // 🔹 Introduction
            _buildSection("Introduction:", [
              "➡️ Constructors are methods that are used to initialize an object when it gets created.",
              "➡️ Constructors are mainly used to set the initial values for instance variables.",
              "➡️ The name of the constructor is the same as the name of the class.",
              "➡️ Constructors are similar to instance methods but they do not have a return type.",
              "➡️ All classes in Dart have their own default constructor. If you don’t create any constructor for a class, the compiler will implicitly create a default constructor.",
              "➡️ We can create a constructor in Dart like this:\n\nclass SomeClass {\n   SomeClass() {\n      // constructor body\n   }\n}",
            ]),

            const SizedBox(height: 20),

            _buildSection("🔹 Types of Constructors:", [
              "1. Default Constructor",
              "2. Parameterized Constructor",
              "3. Named Constructor",
            ]),

            const SizedBox(height: 20),

            // 1) Default Constructor
            _buildSection("1) Default Constructor", [
              "➡️ A constructor with no parameter is known as the default constructor. "
                  "If you don’t create a constructor explicitly, the compiler will create one implicitly.",
            ]),
            _buildCodeBox("Example:", [
              "void main(){",
              "  var obj = A();",
              "}",
              "",
              "class A {",
              "  A(){",
              "    print(\"Default Constructor...\");",
              "  }",
              "}",
            ], isCode: true),
            _buildCodeBox("Output:", ["Default Constructor..."], isOutput: true),

            const SizedBox(height: 20),

            // 2) Parameterized Constructor
            _buildSection("2) Parameterized Constructor", [
              "➡️ We can also have constructors that take parameters, "
                  "that can later be used to initialize instance variables.",
            ]),
            _buildCodeBox("Example:", [
              "void main(){",
              "  var obj = A(100, 200);",
              "}",
              "",
              "class A {",
              "  A(int a, int b){",
              "    print(\"A = \$a, B = \$b\");",
              "  }",
              "}",
            ], isCode: true),
            _buildCodeBox("Output:", ["A = 100, B = 200"], isOutput: true),

            const SizedBox(height: 20),

            // 3) Named Constructor
            _buildSection("3) Named Constructor", [
              "➡️ In Dart, named constructors are mainly used to define multiple constructors.",
            ]),
            _buildCodeBox("Example:", [
              "void main(){",
              "  var obj = A.namedConst(100, 200);",
              "}",
              "",
              "class A {",
              "  A.namedConst(int a, int b){",
              "    print(\"A = \$a, B = \$b\");",
              "    print(\"Named Constructor...\");",
              "  }",
              "}",
            ], isCode: true),
            _buildCodeBox("Output:", [
              "A = 100, B = 200",
              "Named Constructor..."
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
