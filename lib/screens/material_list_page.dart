import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/material_provider.dart';
import '../models/material_model.dart';
import 'material_detail_page.dart';

class MaterialListPage extends StatefulWidget {
  final int categoryId;
  final String categoryName;

  const MaterialListPage({
    super.key,
    required this.categoryId,
    required this.categoryName,
  });

  @override
  State<MaterialListPage> createState() => _MaterialListPageState();
}

class _MaterialListPageState extends State<MaterialListPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<MaterialProvider>(context, listen: false)
          .fetchByCategory(widget.categoryId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final materialProvider = Provider.of<MaterialProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryName),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: materialProvider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : materialProvider.materials.isEmpty
              ? const Center(child: Text("No materials available"))
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: materialProvider.materials.length,
                  itemBuilder: (context, index) {
                    final material = materialProvider.materials[index];
                    return buildMaterialCard(context, material);
                  },
                ),
    );
  }

  Widget buildMaterialCard(BuildContext context, MaterialModel material) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => MaterialDetailPage(material: material),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(12),
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
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(material.title,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text(
                    material.content ?? "",
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            IconButton(
              icon: Icon(
                material.isBookmarked
                    ? Icons.bookmark
                    : Icons.bookmark_border,
              ),
              onPressed: () {
                Provider.of<MaterialProvider>(context, listen: false)
                    .toggleBookmark(material);
              },
            ),
          ],
        ),
      ),
    );
  }
}
