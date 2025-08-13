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
      home: PracticalsPage(),
    );
  }
}

class PracticalsPage extends StatelessWidget {
  final List<Map<String, dynamic>> sections = [
    {
      "title": "Introduction",
      "items": ["Hello World"],
    },
    {
      "title": "Basic concept of Dart",
      "items": [
        "Comments",
        "ants",
        "Identifiers",
        "Input and Output",
        "Variable"
      ],
    },
    {
      "title": "Data Type",
      "items": [
        "Number Data Type",
        "String Data Type",
        "Boolean Data Type",
        "List Data Type",
        "Map Data Type",
      ],
    },
    {
      "title": "Operator",
      "items": [
        "Arithmetic Opera..",
        "Assignment Oper..",
        "Bitwise Operators",
        "Increment & Decr..",
        "logical Operator"
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
      "title": "Switch case Statement",
      "items": [
        "Normal switch-c..",
        "Nested switch-C..",
        "Switch Case On S..",
        "Switch Case On E.."
      ],
    },
    {
      "title": "Keyword",
      "items": [
        "Break Keyword",
        "Continue Keyword",
        "This Keyword",
        "Throw Keyword",
        "Typedef Keyword",
        "Late Keyword",
        "Dynamic Keyword",
        "Var Keyword"
      ],
    },
    {
      "title": "Type of function",
      "items": [
        "Function",
        "Parameter & No R..",
        "No Parameter & R..",
        "Function With Par.."
      ],
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
        "String",
        "Convert String to Int",
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
      "title": "Oop concept",
      "items": [
        "Class and Object",
        "Abstract Class",
        "ructors",
        "Getters and Sette..",
        "Inheritances",
        "interface",
        "Polymorphism",
        "Encapsulation"
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
    {
      "title": "Sets",
      "items": [
        "Simple Set",
        "Declaration Set",
        "Empty Set",
        "Content Set",
        "Hash Set"
      ],
    },
    {
      "title": "Set method",
      "items": [
        "Add Method",
        "Add All Method",
        "Remove Method",
        "Length Method",
        "RuntimeType Met..",
        "isEmpty Method",
        "isNotEmpty Meth..",
        "Clear Method"
      ],
    },
    {
      "title": "Constructor",
      "items": [
        "Default Constru..",
        "Parameterised Con..",
        "Named Constru..",
        "Constant Constr..",
        "Redirecting Cons.."
      ],
    },
    {
      "title": "Enums",
      "items": ["Enums"],
    },
    {
      "title": "Getter and Setter",
      "items": ["Default Getter and Setter", "Custom Getter & Setter"],
    },
    {
      "title": "Inheritance",
      "items": [
        "Single Inheritance",
        "Multi-Level Inher..",
        "Hierarchical Inhe.."
      ],
    },
  ];

  PracticalsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Practicals"),
        centerTitle: true,
        leading: const Icon(Icons.arrow_back),
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
                          colors: [
                            Color(0xFF00C9FF),
                            Color.fromARGB(255, 1, 151, 177)
                          ],
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
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
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
                              foregroundColor: Colors.black,
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

/// Fungsi untuk menampilkan pop-up code dialog
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
            // Header dengan judul di tengah
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
                        color: Colors.black,
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

            // Body untuk kode
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
