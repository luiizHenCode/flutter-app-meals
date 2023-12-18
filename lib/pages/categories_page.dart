import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/widgets/category_card.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2, // 1.5 ratio
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        children: [
          ...dummyCategories.map(
            (category) => CategoryModelCard(
              category: category,
            ),
          ),
        ],
      ),
    );
  }
}
