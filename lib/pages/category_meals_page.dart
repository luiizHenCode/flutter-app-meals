import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/category.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/provider/favorites_provider.dart';
import 'package:meals/provider/settings_provider.dart';
import 'package:meals/utils/app_routes.dart';
import 'package:meals/widgets/meal_card.dart';
import 'package:provider/provider.dart';

class CategoryModelMealsPage extends StatelessWidget {
  const CategoryModelMealsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final category =
        ModalRoute.of(context)!.settings.arguments as CategoryModel;

    final List<MealModel> categoryMeals = dummyMeals.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();

    return Consumer<FavoritesProvider>(
      builder: (ctx, favorites, child) {
        return Consumer<SettingsProvider>(
          builder: (ctx, settings, child) {
            final filteredMeals = categoryMeals.where((meal) {
              if (settings.isFreeGluten && !meal.isGlutenFree) {
                return false;
              }

              if (settings.isFreeLactose && !meal.isLactoseFree) {
                return false;
              }

              if (settings.isVegan && !meal.isVegan) {
                return false;
              }

              if (settings.isVegetarian && !meal.isVegetarian) {
                return false;
              }

              return true;
            }).toList();

            return Scaffold(
              appBar: AppBar(
                title: Text(category.title.toUpperCase()),
              ),
              body: filteredMeals.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'No meals found!',
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Gap(8.0),
                          const Text(
                            'Try to change your filters.',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          const Gap(16.0),
                          TextButton.icon(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed(AppRoutes.settings);
                            },
                            icon: const Icon(Symbols.settings),
                            label: const Text("Change filters"),
                          )
                        ],
                      ),
                    )
                  : ListView.separated(
                      padding: EdgeInsets.only(
                        top: 16.0,
                        left: 16.0,
                        right: 16.0,
                        bottom: MediaQuery.of(context).padding.bottom + 16.0,
                      ),
                      itemCount: filteredMeals.length,
                      separatorBuilder: (ctx, idx) => const Gap(16.0),
                      itemBuilder: (ctx, idx) => MealCard(
                        meal: filteredMeals[idx],
                        isFavorite: favorites.isFavorite(filteredMeals[idx].id),
                        onFavorite: () =>
                            favorites.toggleFavorite(filteredMeals[idx].id),
                      ),
                    ),
            );
          },
        );
      },
    );
  }
}
