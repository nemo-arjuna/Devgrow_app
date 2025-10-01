import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/material_model.dart';
import '../providers/material_provider.dart';

class MaterialDetailPage extends StatelessWidget {
  final MaterialModel material;

  const MaterialDetailPage({super.key, required this.material});

  @override
  Widget build(BuildContext context) {
    final materialProvider = Provider.of<MaterialProvider>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        title: Text(material.title),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        actions: [
          IconButton(
            icon: Icon(
              material.isBookmarked ? Icons.bookmark : Icons.bookmark_border,
            ),
            onPressed: () {
              materialProvider.toggleBookmark(material);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    material.isBookmarked
                        ? '${material.title} bookmarked'
                        : '${material.title} removed from bookmarks',
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          if (material.image != null)
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                material.image!,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          const SizedBox(height: 16),
          Text(
            material.title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            material.content ?? "No content available",
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
