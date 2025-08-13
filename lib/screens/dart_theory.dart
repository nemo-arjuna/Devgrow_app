import 'package:flutter/material.dart';

class DartTheoryPage extends StatefulWidget {
  final bool autoFocusSearch;

  const DartTheoryPage({Key? key, this.autoFocusSearch = false})
    : super(key: key);

  @override
  State<DartTheoryPage> createState() => _DartTheoryPageState();
}

class _DartTheoryPageState extends State<DartTheoryPage> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();

  // Set untuk menyimpan index lecture yang dibookmark
  final Set<int> _bookmarkedIndexes = {};

  // Data asli lectures
  final List<Map<String, String>> _allLectures = [
    {
      "img": "lib/assets/dart.jpg",
      "title": "Dart - Introduction",
      "subtitle": "Let's Start Lecture 1",
    },
    {
      "img": "lib/assets/dart.jpg",
      "title": "main() function in Dart",
      "subtitle": "Let's Start Lecture 2",
    },
    {
      "img": "lib/assets/dart.jpg",
      "title": "Dart - Data Types",
      "subtitle": "Let's Start Lecture 3",
    },
    {
      "img": "lib/assets/dart.jpg",
      "title": "String Interpolation in Dart",
      "subtitle": "Let's Start Lecture 4",
    },
    {
      "img": "lib/assets/dart.jpg",
      "title": "Comments in Dart",
      "subtitle": "Let's Start Lecture 5",
    },
    {
      "img": "lib/assets/dart.jpg",
      "title": "String in Dart",
      "subtitle": "Let's Start Lecture 6",
    },
    {
      "img": "lib/assets/dart.jpg",
      "title": "String Properties in Dart",
      "subtitle": "Let's Start Lecture 7",
    },
    {
      "img": "lib/assets/dart.jpg",
      "title": "String Methods in Dart",
      "subtitle": "Let's Start Lecture 8",
    },
    {
      "img": "lib/assets/dart.jpg",
      "title": "Constructors in Dart",
      "subtitle": "Let's Start Lecture 9",
    },
    {
      "img": "lib/assets/dart.jpg",
      "title": "Enumerations in Dart",
      "subtitle": "Let's Start Lecture 10",
    },
    {
      "img": "lib/assets/dart.jpg",
      "title": "Inheritance in Dart",
      "subtitle": "Let's Start Lecture 11",
    },
    {
      "img": "lib/assets/dart.jpg",
      "title": "Iterables in Dart",
      "subtitle": "Let's Start Lecture 12",
    },
    {
      "img": "lib/assets/dart.jpg",
      "title": "List in Dart",
      "subtitle": "Let's Start Lecture 13",
    },
    {
      "img": "lib/assets/dart.jpg",
      "title": "Loop in Dart",
      "subtitle": "Let's Start Lecture 14",
    },
    {
      "img": "lib/assets/dart.jpg",
      "title": "Maps in Dart",
      "subtitle": "Let's Start Lecture 15",
    },
    {
      "img": "lib/assets/dart.jpg",
      "title": "Methods in Dart",
      "subtitle": "Let's Start Lecture 16",
    },
    {
      "img": "lib/assets/dart.jpg",
      "title": "Queue in Dart",
      "subtitle": "Let's Start Lecture 17",
    },
    {
      "img": "lib/assets/dart.jpg",
      "title": "Runes in Dart",
      "subtitle": "Let's Start Lecture 18",
    },
    {
      "img": "lib/assets/dart.jpg",
      "title": "Set in Dart",
      "subtitle": "Let's Start Lecture 19",
    },
    {
      "img": "lib/assets/dart.jpg",
      "title": "Mixins in Dart",
      "subtitle": "Let's Start Lecture 20",
    },
    {
      "img": "lib/assets/dart.jpg",
      "title": "Const and Final Keyword in Dart",
      "subtitle": "Let's Start Lecture 21",
    },
    {
      "img": "lib/assets/dart.jpg",
      "title": "If Else Statement in Dart",
      "subtitle": "Let's Start Lecture 22",
    },
    {
      "img": "lib/assets/dart.jpg",
      "title": "for Loop in Dart",
      "subtitle": "Let's Start Lecture 23",
    },
    {
      "img": "lib/assets/dart.jpg",
      "title": "While loop in Dart",
      "subtitle": "Let's Start Lecture 24",
    },
    {
      "img": "lib/assets/dart.jpg",
      "title": "Do-While Loop in Dart",
      "subtitle": "Let's Start Lecture 25",
    },
    {
      "img": "lib/assets/dart.jpg",
      "title": "Loop Control Statements in Dart",
      "subtitle": "Let's Start Lecture 26",
    },
    {
      "img": "lib/assets/dart.jpg",
      "title": "Switch Case Statements in Dart",
      "subtitle": "Let's Start Lecture 27",
    },
    {
      "img": "lib/assets/dart.jpg",
      "title": "Types of Operations in Dart",
      "subtitle": "Let's Start Lecture 28",
    },
    {
      "img": "lib/assets/dart.jpg",
      "title": "Different Types of Functions in Dart",
      "subtitle": "Let's Start Lecture 29",
    },
    {
      "img": "lib/assets/dart.jpg",
      "title": "Optional Parameters in Dart",
      "subtitle": "Let's Start Lecture 30",
    },
    {
      "img": "lib/assets/dart.jpg",
      "title": "Anonymous Functions in Dart",
      "subtitle": "Let's Start Lecture 31",
    },
    {
      "img": "lib/assets/dart.jpg",
      "title": "Lexical Scoping in Dart",
      "subtitle": "Let's Start Lecture 32",
    },
    {
      "img": "lib/assets/dart.jpg",
      "title": "Exception Handling in Dart",
      "subtitle": "Let's Start Lecture 33",
    },
    {
      "img": "lib/assets/dart.jpg",
      "title": "Super Keyword in Dart",
      "subtitle": "Let's Start Lecture 34",
    },
    {
      "img": "lib/assets/dart.jpg",
      "title": "This Keyword in Dart",
      "subtitle": "Let's Start Lecture 35",
    },
    {
      "img": "lib/assets/dart.jpg",
      "title": "OOP in Dart",
      "subtitle": "Let's Start Lecture 36",
    },
    {
      "img": "lib/assets/dart.jpg",
      "title": "Class in Dart",
      "subtitle": "Let's Start Lecture 37",
    },
    {
      "img": "lib/assets/dart.jpg",
      "title": "Object in Dart",
      "subtitle": "Let's Start Lecture 38",
    },
    {
      "img": "lib/assets/dart.jpg",
      "title": "Encapsulation in Dart",
      "subtitle": "Let's Start Lecture 39",
    },
    {
      "img": "lib/assets/dart.jpg",
      "title": "Getter and Setter in Dart",
      "subtitle": "Let's Start Lecture 40",
    },
    {
      "img": "lib/assets/dart.jpg",
      "title": "Polymorphism in Dart",
      "subtitle": "Let's Start Lecture 41",
    },
    {
      "img": "lib/assets/dart.jpg",
      "title": "Generics in Dart",
      "subtitle": "Let's Start Lecture 42",
    },
  ];

  // Data yang difilter
  List<Map<String, String>> _filteredLectures = [];

  @override
  void initState() {
    super.initState();
    _filteredLectures = List.from(_allLectures);

    if (widget.autoFocusSearch) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _searchFocusNode.requestFocus();
      });
    }

    _searchController.addListener(_filterLectures);
  }

  void _filterLectures() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredLectures = _allLectures.where((lecture) {
        final title = lecture["title"]!.toLowerCase();
        final subtitle = lecture["subtitle"]!.toLowerCase();
        return title.contains(query) || subtitle.contains(query);
      }).toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  Widget buildLectureItem(
    String imgPath,
    String title,
    String subtitle,
    int index,
  ) {
    final isBookmarked = _bookmarkedIndexes.contains(index);

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              imgPath,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(color: Colors.blue, fontSize: 12),
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(
              isBookmarked ? Icons.bookmark : Icons.bookmark_border,
              color: isBookmarked ? Colors.blue : null,
            ),
            onPressed: () {
              setState(() {
                if (isBookmarked) {
                  _bookmarkedIndexes.remove(index);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('$title removed from bookmarks')),
                  );
                } else {
                  _bookmarkedIndexes.add(index);
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text('$title bookmarked')));
                }
              });
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dart Theory", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(
              height: 45,
              child: TextField(
                controller: _searchController,
                focusNode: _searchFocusNode,
                decoration: InputDecoration(
                  hintText: "Search...",
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(vertical: 0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(28),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: _filteredLectures.isNotEmpty
                  ? ListView.builder(
                      itemCount: _filteredLectures.length,
                      itemBuilder: (context, index) {
                        final lecture = _filteredLectures[index];
                        final actualIndex = _allLectures.indexOf(lecture);
                        return buildLectureItem(
                          lecture["img"]!,
                          lecture["title"]!,
                          lecture["subtitle"]!,
                          actualIndex,
                        );
                      },
                    )
                  : const Center(
                      child: Text(
                        "No results found",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
