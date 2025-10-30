import 'package:flutter/foundation.dart';
import '../db/db_helper.dart';
import '../models/dart_theory_model.dart';

class DartTheoryProvider extends ChangeNotifier {
  List<DartTheoryModel> _theories = [];
  bool _isLoading = false;
  String _searchQuery = '';

  List<DartTheoryModel> get theories => _theories;
  bool get isLoading => _isLoading;

  List<DartTheoryModel> get filteredTheories {
    if (_searchQuery.isEmpty) return _theories;
    return _theories.where((theory) {
      return theory.title.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          theory.subtitle.toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();
  }

  Future<void> fetchTheories() async {
    _isLoading = true;
    notifyListeners();
    try {
      _theories = await DBHelper.instance.getAllDartTheories();
    } catch (e) {
      _theories = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void setSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  Future<void> toggleBookmark(int id) async {
    final index = _theories.indexWhere((t) => t.id == id);
    if (index != -1) {
      final theory = _theories[index];
      try {
        await DBHelper.instance.toggleDartTheoryBookmark(
            id, !theory.isBookmarked);
        _theories[index] = theory.copyWith(isBookmarked: !theory.isBookmarked);
        notifyListeners();
      } catch (e) {}
    }
  }
}
