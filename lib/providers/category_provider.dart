import 'package:flutter/foundation.dart';
import '../db/db_helper.dart';
import '../models/category_model.dart';

class CategoryProvider extends ChangeNotifier {
  List<CategoryModel> _categories = [];
  bool _isLoading = false;

  List<CategoryModel> get categories => _categories;
  bool get isLoading => _isLoading;

  Future<void> fetchCategories() async {
    print("Starting fetchCategories...");
    try {
      _isLoading = true;
      notifyListeners();

      _categories = await DBHelper.instance.getAllCategories();
      print("Categories fetched successfully: ${_categories.length} items");

      if (_categories.isEmpty) {
        print("Warning: No categories found in database");
      } else {
        for (var category in _categories) {
          print("Category found: ${category.name}");
        }
      }
    } catch (error) {
      print("Error fetching categories: $error");
      _categories = [];
    } finally {
      _isLoading = false;
      notifyListeners();
      print("fetchCategories completed");
    }
  }
}
