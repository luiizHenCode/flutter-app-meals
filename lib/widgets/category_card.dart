import 'package:flutter/material.dart';
import 'package:meals/models/category.dart';
import 'package:meals/utils/app_routes.dart';

class CategoryModelCard extends StatelessWidget {
  const CategoryModelCard({
    super.key,
    required this.category,
  });

  final CategoryModel category;

  void _goToCategoryModel(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      AppRoutes.categoryMeals,
      arguments: category,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _goToCategoryModel(context),
      borderRadius: BorderRadius.circular(16),
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              category.color.withOpacity(0.7),
              category.color,
            ],
          ),
        ),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Colors.black.withOpacity(0.65),
              ),
        ),
      ),
    );
  }
}
