import 'quiz_category/quiz.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/category_provider.dart';
import '../providers/dart_theory_provider.dart';
import 'bookmark_screen.dart';
import 'dart_theory.dart';
import 'dart_category/dart_introduction.dart';
import 'flutter_theory.dart';
import '../models/dart_theory_model.dart';
import 'practical.dart';
import 'syntax.dart';
import 'question.dart';
import 'dart_category/main_function.dart';
import 'dart_category/dart_datatypes.dart';
import 'dart_category/string_interpolation_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // load kategori + materi awal
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      print("Initializing data...");
      try {
        await Future.wait([
          Provider.of<CategoryProvider>(context, listen: false)
              .fetchCategories(),
          Provider.of<DartTheoryProvider>(context, listen: false)
              .fetchTheories(),
        ]);
        print("Data initialization completed");
      } catch (e) {
        print("Error initializing data: $e");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              height: 140,
              padding: const EdgeInsets.only(left: 16, bottom: 8),
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey,
                    width: 0.5,
                  ),
                ),
              ),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: const Text(
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
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.w300),
            ),
            const SizedBox(height: 16),

            // 🔹 Horizontal Cards → dinamis dari CategoryProvider
            SizedBox(
              height: 165,
              child: Consumer<CategoryProvider>(
                builder: (context, categoryProvider, child) {
                  if (categoryProvider.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (categoryProvider.categories.isEmpty) {
                    return const Center(child: Text("No categories found"));
                  }
                  // Filter kategori quiz
                  final filteredCategories = categoryProvider.categories
                      .where(
                          (category) => category.name.toLowerCase() != 'quiz')
                      .toList();

                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: filteredCategories.length,
                    itemBuilder: (context, index) {
                      final category = filteredCategories[index];
                      return buildCategoryCard(
                        context,
                        category.image ?? "assets/syntax.jpg",
                        category.name,
                        "Materi ${category.name}",
                        category.id!,
                      );
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 16),

            // 🔹 Search Bar
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        const DartTheoryPage(autoFocusSearch: true),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      const begin = Offset(1.0, 0.0);
                      const end = Offset.zero;
                      const curve = Curves.easeInOutCubic;

                      var tween = Tween(begin: begin, end: end)
                          .chain(CurveTween(curve: curve));

                      var offsetAnimation = animation.drive(tween);

                      return SlideTransition(
                        position: offsetAnimation,
                        child: child,
                      );
                    },
                    transitionDuration: const Duration(milliseconds: 500),
                  ),
                );
              },
              child: Container(
                height: 45,
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
                      "Search Lecture...",
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // 🔹 Lectures Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Lectures",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const DartTheoryPage()),
                    );
                  },
                  child: const Text(
                    "View All",
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // 🔹 Lecture List → menampilkan materi Dart Theory
            Consumer<DartTheoryProvider>(
              builder: (context, dartTheoryProvider, child) {
                if (dartTheoryProvider.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (dartTheoryProvider.theories.isEmpty) {
                  return const Center(child: Text("No lectures found"));
                }
                return Column(
                  children: dartTheoryProvider.theories
                      .take(4) // tampilkan 4 lecture terbaru
                      .map((theory) => buildLectureItem(context, theory))
                      .toList(),
                );
              },
            ),
          ],
        ),
      ),

      // 🔹 Bottom Navigation
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        currentIndex:
            0, // ini nanti bisa diset dinamis biar tab aktif sesuai halaman
        onTap: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const BookmarkScreen()),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const RPGQuizApp()),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.bookmark), label: "Bookmark"),
          BottomNavigationBarItem(icon: Icon(Icons.stars), label: "Quiz"),
        ],
      ),
    );
  }

  // 🔹 Category Card Widget
  Widget buildCategoryCard(
    BuildContext context,
    String imgPath,
    String title,
    String subtitle,
    int categoryId,
  ) {
    return GestureDetector(
      onTap: () {
        if (title.toLowerCase() == 'dart') {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => const DartTheoryPage()),
          );
        } else if (title.toLowerCase() == 'flutter') {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => const FlutterTheoryPage()),
          );
        } else if (title.toLowerCase() == 'practical') {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => PracticalsPage()),
          );
        } else if (title.toLowerCase() == 'syntax') {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => SyntaxPage()),
          );
        } else if (title.toLowerCase() == 'question') {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => QuestionPage()),
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
                  Text(title,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
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
                      color: Color.fromARGB(255, 27, 177, 247),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Icon(Icons.arrow_forward,
                      color: Color.fromARGB(255, 27, 177, 247), size: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 🔹 Lecture Item Widget → pakai DartTheoryModel
  Widget buildLectureItem(BuildContext context, DartTheoryModel theory) {
    return GestureDetector(
      onTap: () {
        if (theory.title == 'Dart - Introduction') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const DartIntroductionPage(),
            ),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const DartMainFunctionPage(),
            ),
          );
        }
        {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const DartDataTypesPage(),
            ),
          );
        }
        {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const StringInterpolationPage(),
            ),
          );
        }
      },
      child: Container(
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
                theory.image,
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
                  Text(theory.title,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text(
                    theory.subtitle,
                    style: const TextStyle(color: Colors.blue, fontSize: 12),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            IconButton(
              icon: Icon(
                theory.isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                color: theory.isBookmarked ? Colors.blue : null,
              ),
              onPressed: () async {
                await Provider.of<DartTheoryProvider>(context, listen: false)
                    .toggleBookmark(theory.id);
                if (!context.mounted) return;
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      theory.isBookmarked
                          ? '${theory.title} removed from bookmarks'
                          : '${theory.title} bookmarked',
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
