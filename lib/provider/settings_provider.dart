import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier {
  final Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false
  };

  Map<String, bool> get filters => _filters;

  bool get isFreeGluten => _filters['gluten'] ?? false;
  bool get isFreeLactose => _filters['lactose'] ?? false;
  bool get isVegan => _filters['vegan'] ?? false;
  bool get isVegetarian => _filters['vegetarian'] ?? false;

  void onFreeGluten(bool newValue) {
    _filters['gluten'] = newValue;
    notifyListeners();
  }

  void onFreeLactose(bool newValue) {
    _filters['lactose'] = newValue;
    notifyListeners();
  }

  void onVegan(bool newValue) {
    _filters['vegan'] = newValue;
    notifyListeners();
  }

  void onVegetarian(bool newValue) {
    _filters['vegetarian'] = newValue;
    notifyListeners();
  }

  bool getFilter(String key) {
    return _filters[key] ?? false;
  }
}
