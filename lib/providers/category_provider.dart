import 'package:flutter/foundation.dart';
import '../db/db_helper.dart';
import '../models/category_model.dart';

class CategoryProvider extends ChangeNotifier {
  List<CategoryModel> _categories = [];
  bool _isLoading = false;

  List<CategoryModel> get categories => _categories;
  bool get isLoading => _isLoading;

  Future<void> fetchCategories() async {
    _isLoading = true;
    notifyListeners();
    try {
      _categories = await DBHelper.instance.getAllCategories();
    } catch (e) {
      _categories = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
