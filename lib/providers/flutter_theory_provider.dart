import 'package:flutter/foundation.dart';
import '../db/db_helper.dart';
import '../models/flutter_theory_model.dart';

class FlutterTheoryProvider extends ChangeNotifier {
  List<FlutterTheoryModel> _theories = [];
  bool _isLoading = false;
  String _searchQuery = '';

  List<FlutterTheoryModel> get theories => _theories;
  bool get isLoading => _isLoading;

  List<FlutterTheoryModel> get filteredTheories {
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
      _theories = await DBHelper.instance.getAllFlutterTheories();
    } catch (e) {
      print("Error fetching flutter theories: $e");
      _theories = [];
    }

    _isLoading = false;
    notifyListeners();
  }

  void setSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  Future<void> toggleBookmark(int id) async {
    try {
      final index = _theories.indexWhere((t) => t.id == id);
      if (index != -1) {
        final theory = _theories[index];
        await DBHelper.instance
            .toggleFlutterTheoryBookmark(id, !theory.isBookmarked);
        _theories[index] = theory.copyWith(isBookmarked: !theory.isBookmarked);
        notifyListeners();
      }
    } catch (e) {
      print("Error toggling bookmark: $e");
    }
  }
}
