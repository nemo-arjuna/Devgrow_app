import 'package:flutter/material.dart';

//add
//add
class FlutterTheoryPage extends StatefulWidget {
  final bool autoFocusSearch;

  const FlutterTheoryPage({Key? key, this.autoFocusSearch = false})
    : super(key: key);

  @override
  State<FlutterTheoryPage> createState() => _FlutterTheoryPageState();
}

class _FlutterTheoryPageState extends State<FlutterTheoryPage> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();

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
      "title": "Constructors in Dart",
      "subtitle": "Let's Start Lecture 10",
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
          Icon(Icons.arrow_forward),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Flutter Theory",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
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
