import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MealIngredients extends StatelessWidget {
  const MealIngredients({
    super.key,
    required this.ingredients,
  });

  final List<String> ingredients;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: ingredients.map((e) {
          return Container(
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: 8.0),
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 4.0,
                  backgroundColor: Colors.white,
                ),
                const Gap(16.0),
                Expanded(
                  child: Text(
                    e,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
