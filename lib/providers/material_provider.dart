import 'package:flutter/foundation.dart';
import '../db/db_helper.dart';
import '../models/material_model.dart';

class MaterialProvider extends ChangeNotifier {
  List<MaterialModel> _materials = [];
  List<MaterialModel> get materials => _materials;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> fetchAll() async {
    _isLoading = true;
    notifyListeners();
    try {
      _materials = await DBHelper.instance.getAllMaterials();
    } catch (e) {
      _materials = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchByCategory(int categoryId) async {
    _isLoading = true;
    notifyListeners();
    try {
      _materials = await DBHelper.instance.getMaterialsByCategory(categoryId);
    } catch (e) {
      _materials = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> toggleBookmark(MaterialModel material) async {
    try {
      await DBHelper.instance
          .toggleBookmark(material.id!, !material.isBookmarked);
      material.isBookmarked = !material.isBookmarked;
      notifyListeners();
      _materials = await DBHelper.instance.getAllMaterials();
      notifyListeners();
    } catch (e) {}
  }

  Future<void> fetchBookmarked() async {
    _isLoading = true;
    notifyListeners();
    try {
      _materials = await DBHelper.instance.getBookmarkedMaterials();
    } catch (e) {
      _materials = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
