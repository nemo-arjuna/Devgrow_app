import 'package:flutter/foundation.dart';
import '../db/db_helper.dart';
import '../models/material_model.dart';

class MaterialProvider extends ChangeNotifier {
  List<MaterialModel> _materials = [];
  List<MaterialModel> get materials => _materials;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> fetchAll() async {
    print("Starting fetchAll materials...");
    try {
      _isLoading = true;
      notifyListeners();

      _materials = await DBHelper.instance.getAllMaterials();
      print("Materials fetched successfully: ${_materials.length} items");

      if (_materials.isEmpty) {
        print("Warning: No materials found in database");
      } else {
        for (var material in _materials) {
          print("Material found: ${material.title}");
        }
      }
    } catch (e) {
      print("Error fetching materials: $e");
      _materials = [];
    } finally {
      _isLoading = false;
      notifyListeners();
      print("fetchAll materials completed");
    }
  }

  Future<void> fetchByCategory(int categoryId) async {
    _isLoading = true;
    notifyListeners();

    try {
      _materials = await DBHelper.instance.getMaterialsByCategory(categoryId);
    } catch (e) {
      print("Error fetching materials by category: $e");
      _materials = [];
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> toggleBookmark(MaterialModel material) async {
    try {
      await DBHelper.instance
          .toggleBookmark(material.id!, !material.isBookmarked);
      // Update the local state of the material
      material.isBookmarked = !material.isBookmarked;
      notifyListeners();
      // Refresh the list to ensure we have the latest data
      _materials = await DBHelper.instance.getAllMaterials();
      notifyListeners();
    } catch (e) {
      print("Error toggling bookmark: $e");
    }
  }

  Future<void> fetchBookmarked() async {
    _isLoading = true;
    notifyListeners();

    try {
      _materials = await DBHelper.instance.getBookmarkedMaterials();
    } catch (e) {
      print("Error fetching bookmarked: $e");
      _materials = [];
    }

    _isLoading = false;
    notifyListeners();
  }
}
