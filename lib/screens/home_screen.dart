import 'package:devgrow/screens/dart_theory.dart';
import 'package:devgrow/screens/flutter_theory.dart';
import 'package:flutter/material.dart';
import 'bookmark_screen.dart';
//add
//add
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.white),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "DevGrow",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.star_border),
              title: const Text("Rate Us"),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.info_outlined),
              title: const Text("About us"),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.menu_book),
              title: const Text("Terms and Conditions"),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          "DevGrow",
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Grow Today!",
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.w100),
            ),
            const SizedBox(height: 16),

            // Horizontal Cards
            SizedBox(
              height: 165,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  buildCategoryCard(
                    context,
                    "lib/assets/practicals.jpg",
                    "Practical",
                    "110+ Practicals",
                    null,
                  ),
                  buildCategoryCard(
                    context,
                    "lib/assets/syntax.jpg",
                    "Syntax",
                    "80+ Syntax",
                    null,
                  ),
                  buildCategoryCard(
                    context,
                    "lib/assets/dart.jpg",
                    "Dart",
                    "40+ Dart Theory",
                    const DartTheoryPage(),
                  ),
                  buildCategoryCard(
                    context,
                    "lib/assets/syntax.jpg",
                    "Flutter",
                    "11+ Flutter",
                    const FlutterTheoryPage(),
                  ),
                  buildCategoryCard(
                    context,
                    "lib/assets/syntax.jpg",
                    "Question",
                    "20+ Question",
                    null,
                  ),
                  buildCategoryCard(
                    context,
                    "lib/assets/syntax.jpg",
                    "Quiz",
                    "Quiz test",
                    null,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Search Bar (Bigger + Auto Focus Navigation)
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  PageRouteBuilder(
                    transitionDuration: const Duration(milliseconds: 350),
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        const DartTheoryPage(autoFocusSearch: true),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                          return FadeTransition(
                            opacity: animation,
                            child: child,
                          );
                        },
                  ),
                );
              },
              child: Container(
                height: 45, // search
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(28),
                  border: Border.all(color: Colors.grey.shade300),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 230, 230, 230),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: const [
                    Icon(Icons.search, color: Colors.grey, size: 26),
                    SizedBox(width: 16),
                    Text(
                      "Search...",
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Lectures Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Lectures",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  "View All",
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Lecture List
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
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        currentIndex: 0,
        onTap: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const BookmarkScreen()),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: "Bookmark",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.stars), label: "Growpoints"),
        ],
      ),
    );
  }

  // Category Card Widget
  static Widget buildCategoryCard(
    BuildContext context,
    String imgPath,
    String title,
    String subtitle,
    Widget? navigateTo,
  ) {
    return GestureDetector(
      onTap: () {
        if (navigateTo != null) {
          Navigator.of(context).push(
            PageRouteBuilder(
              transitionDuration: const Duration(milliseconds: 350),
              pageBuilder: (context, animation, secondaryAnimation) =>
                  navigateTo,
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                    return FadeTransition(opacity: animation, child: child);
                  },
            ),
          );
        }
      },
      child: Container(
        width: 140,
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(16),
              ),
              child: Image.asset(
                imgPath,
                height: 80,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    subtitle,
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Get Started",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Icon(Icons.arrow_forward, color: Colors.black, size: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Lecture Item Widget
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
            icon: const Icon(Icons.bookmark_border),
            onPressed: () {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('$title bookmarked')));
            },
          ),
        ],
      ),
    );
  }
}
