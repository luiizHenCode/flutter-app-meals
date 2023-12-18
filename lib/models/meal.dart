enum Cost { cheap, fair, expensive }

enum Complexity { simple, medium, difficult }

class MealModel {
  final String id;
  final List<String> categories;
  final String title;
  final Cost cost;
  final Complexity complexity;
  final String imageUrl;
  final int duration;
  final List<String> ingredients;
  final List<String> steps;
  final bool isGlutenFree;
  final bool isVegan;
  final bool isVegetarian;
  final bool isLactoseFree;

  const MealModel({
    required this.id,
    required this.categories,
    required this.title,
    required this.cost,
    required this.complexity,
    required this.imageUrl,
    required this.duration,
    required this.ingredients,
    required this.steps,
    required this.isGlutenFree,
    required this.isVegan,
    required this.isVegetarian,
    required this.isLactoseFree,
  });

  String get durationString {
    if (duration >= 60) {
      final hours = duration ~/ 60;
      final mins = duration % 60;

      if (mins == 0) {
        return "$hours hrs";
      }
      return "$hours hrs $mins mins";
    }
    return "$duration mins";
  }

  String get complexityString {
    switch (complexity) {
      case Complexity.simple:
        return "Easy";
      case Complexity.medium:
        return "Medium";
      case Complexity.difficult:
        return "Hard";
      default:
        return "Unknown";
    }
  }

  String get costString {
    switch (cost) {
      case Cost.cheap:
        return "Cheap";
      case Cost.fair:
        return "Fair";
      case Cost.expensive:
        return "Expensive";
      default:
        return "Unknown";
    }
  }
}
