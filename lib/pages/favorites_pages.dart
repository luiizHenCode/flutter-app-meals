import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/provider/favorites_provider.dart';
import 'package:meals/widgets/meal_card.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<FavoritesProvider>(
      builder: (ctx, favorites, child) {
        final List favoritesMeals = dummyMeals
            .where(
              (meal) => favorites.isFavorite(meal.id),
            )
            .toList();

        if (favoritesMeals.isEmpty) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Symbols.favorite,
                  size: 80.0,
                  color: Colors.grey,
                ),
                Gap(16.0),
                Text(
                  'No favorites yet.',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          );
        }

        return ListView.separated(
          padding: const EdgeInsets.all(16.0),
          itemBuilder: (ctx, index) => MealCard(
            meal: favoritesMeals[index],
            isFavorite: favorites.isFavorite(favoritesMeals[index].id),
            onFavorite: () =>
                favorites.toggleFavorite(favoritesMeals[index].id),
          ),
          separatorBuilder: (ctx, index) => const Gap(16.0),
          itemCount: favoritesMeals.length,
        );
      },
    );
  }
}
