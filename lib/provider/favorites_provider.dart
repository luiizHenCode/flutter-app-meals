import 'package:flutter/material.dart';

class FavoritesProvider extends ChangeNotifier {
  final List<String> _favorites = [];

  List<String> get favorites => _favorites;

  void _addFavorite(String id) {
    _favorites.add(id);
    notifyListeners();
  }

  void _removeFavorite(String id) {
    _favorites.remove(id);
    notifyListeners();
  }

  void toggleFavorite(String id) {
    if (isFavorite(id)) {
      _removeFavorite(id);
    } else {
      _addFavorite(id);
    }
  }

  bool isFavorite(String id) {
    return _favorites.contains(id);
  }
}
