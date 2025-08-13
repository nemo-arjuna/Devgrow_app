import 'package:flutter/material.dart';
//add
class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          "Bookmark",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),

            // Bookmark List using buildLectureItem style
            Expanded(
              child: ListView(
                children: [
                  buildLectureItem(
                    context,
                    "lib/assets/dart.jpg",
                    "Dart - Introduction",
                    "Let's Start Lecture 1",
                  ),
                  buildLectureItem(
                    context,
                    "lib/assets/dart.jpg",
                    "main() function in Dart",
                    "Let's Start Lecture 2",
                  ),
                  buildLectureItem(
                    context,
                    "lib/assets/dart.jpg",
                    "Dart - Data Types",
                    "Let's Start Lecture 3",
                  ),
                  buildLectureItem(
                    context,
                    "lib/assets/dart.jpg",
                    "String interpolation in Dart",
                    "Let's Start Lecture 4",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // Bottom Navigation Bar (same as home_screen.dart)
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        currentIndex: 1, // Bookmark is selected
        onTap: (index) {
          if (index == 0) {
            Navigator.pop(context); // Return to home
          }
          // Add other tab handling if needed
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: "Bookmark",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.stars),
            label: "Growpoints",
          ),
        ],
      ),
    );
  }

  // Replica of your buildLectureItem function from home_screen.dart
  static Widget buildLectureItem(
    BuildContext context,
    String imgPath,
    String title,
    String subtitle,
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
          const SizedBox(width: 14),
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
          const Icon(Icons.bookmark, color: Colors.blue),
        ],
      ),
    );
  }
}