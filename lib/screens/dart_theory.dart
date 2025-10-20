import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/dart_theory_provider.dart';
import '../models/dart_theory_model.dart';
import 'dart_category/dart_introduction.dart';
import 'dart_category/main_function.dart';
import 'dart_category/dart_datatypes.dart';
import 'dart_category/string_interpolation_page.dart';
import 'dart_category/comments_in_dart.dart';
import 'dart_category/string_in_dart.dart';
import 'dart_category/string_properties.dart';
import 'dart_category/string_methods.dart';
import 'dart_category/constructors_in_dart.dart';
import 'dart_category/enumerations_in_dart.dart';

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

  @override
  void initState() {
    super.initState();
    // Fetch data when screen loads
    Future.microtask(() {
      context.read<DartTheoryProvider>().fetchTheories();
    });

    if (widget.autoFocusSearch) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _searchFocusNode.requestFocus();
      });
    }

    _searchController.addListener(() {
      context.read<DartTheoryProvider>().setSearchQuery(_searchController.text);
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  Widget buildLectureItem(DartTheoryModel theory) {
    return GestureDetector(
        onTap: () {
          switch (theory.title) {
            case 'Dart - Introduction':
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DartIntroductionPage(),
                ),
              );
              break;
            case 'main() function in Dart':
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DartMainFunctionPage(),
                ),
              );
              break;
            case 'Dart - Data Types':
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DartDataTypesPage(),
                ),
              );
              break;
            case 'String Interpolation in Dart':
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const StringInterpolationPage(),
                ),
              );
              break;
            case 'Comments in Dart':
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CommentsInDartPage(),
                ),
              );
              break;
            // tambahkan kasus untuk materi lainnya sesuai dengan halaman yang sudah Anda buat
            default:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => StringInDartPage(
                  ),
                ),
              );
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => StringPropertiesPage(
                  ),
                ),
              );
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => StringMethodsPage(
                  ),
                ),
              );
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ConstructorsPage(
                  ),
                ),
              );
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EnumerationsPage(
                  ),
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
                icon: Icon(
                  theory.isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                  color: theory.isBookmarked ? Colors.blue : null,
                ),
                onPressed: () async {
                  await context
                      .read<DartTheoryProvider>()
                      .toggleBookmark(theory.id);
                  if (!mounted) return;
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        theory.isBookmarked
                            ? '${theory.title} removed from bookmarks 😞'
                            : '${theory.title} Added to bookmark 🤗',
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Dart Theory",
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
              child: Consumer<DartTheoryProvider>(
                builder: (context, provider, child) {
                  if (provider.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  final theories = provider.filteredTheories;

                  if (theories.isEmpty) {
                    return const Center(
                      child: Text(
                        "No results found",
                        style: TextStyle(color: Colors.grey),
                      ),
                    );
                  }

                  return ListView.builder(
                    itemCount: theories.length,
                    itemBuilder: (context, index) {
                      return buildLectureItem(theories[index]);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
