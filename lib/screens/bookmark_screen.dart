import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/material_provider.dart';
import '../providers/dart_theory_provider.dart';
import '../models/material_model.dart';
import '../models/dart_theory_model.dart';

class BookmarkScreen extends StatefulWidget {
  const BookmarkScreen({super.key});

  @override
  State<BookmarkScreen> createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
  @override
  void initState() {
    super.initState();
    // Memuat data saat screen dibuka
    Future.microtask(() {
      context.read<MaterialProvider>().fetchBookmarked();
      context.read<DartTheoryProvider>().fetchTheories();
    });
  }

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

            // Bookmark List
            Expanded(
              child: Consumer2<MaterialProvider, DartTheoryProvider>(
                builder: (context, materialProvider, dartTheoryProvider, _) {
                  // Materials are already filtered in fetchBookmarked
                  final bookmarkedMaterials = materialProvider.materials;

                  // Get bookmarked dart theories
                  final bookmarkedTheories = dartTheoryProvider.theories
                      .where((t) => t.isBookmarked)
                      .toList();

                  if (materialProvider.isLoading ||
                      dartTheoryProvider.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (bookmarkedMaterials.isEmpty &&
                      bookmarkedTheories.isEmpty) {
                    return const Center(
                      child: Text(
                        "No bookmarks yet",
                        style: TextStyle(color: Colors.grey),
                      ),
                    );
                  }

                  return ListView(
                    children: [
                      // Bookmarked Materials
                      ...bookmarkedMaterials.map(
                        (material) => buildMaterialItem(
                          context,
                          material,
                          () => materialProvider.toggleBookmark(material),
                        ),
                      ),

                      // Bookmarked Dart Theories
                      ...bookmarkedTheories.map(
                        (theory) => buildDartTheoryItem(
                          context,
                          theory,
                          () async {
                            await dartTheoryProvider.toggleBookmark(theory.id);
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
      // Bottom Navigation Bar
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
            icon: Icon(Icons.maps_home_work_rounded),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: "Bookmark",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.stars),

            label: "Quiz",


          ),
        ],
      ),
    );
  }

  Widget buildMaterialItem(
    BuildContext context,
    MaterialModel material,
    VoidCallback onBookmarkTap,
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
              material.image ?? "lib/assets/dart.jpg",
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
                  material.title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  material.content ?? "",
                  style: const TextStyle(color: Colors.blue, fontSize: 12),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.bookmark, color: Colors.blue),
            onPressed: onBookmarkTap,
          ),
        ],
      ),
    );
  }

  Widget buildDartTheoryItem(
    BuildContext context,
    DartTheoryModel theory,
    VoidCallback onBookmarkTap,
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
              theory.image,
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
                  theory.title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  theory.subtitle,
                  style: const TextStyle(color: Colors.blue, fontSize: 12),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.bookmark, color: Colors.blue),
            onPressed: onBookmarkTap,
          ),
        ],
      ),
    );
  }
}
