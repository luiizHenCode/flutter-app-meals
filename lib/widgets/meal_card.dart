import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/utils/app_routes.dart';
import 'package:meals/widgets/badge_meal.dart';

class MealCard extends StatelessWidget {
  const MealCard({
    super.key,
    required this.meal,
    required this.isFavorite,
    required this.onFavorite,
  });

  final MealModel meal;
  final bool isFavorite;
  final void Function() onFavorite;

  void _goToMeal(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      AppRoutes.mealDetail,
      arguments: meal,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16.0),
      splashColor: Theme.of(context).primaryColor,
      onTap: () => _goToMeal(context),
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: Colors.black,
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4.0,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Stack(
                    children: [
                      FadeInImage.assetNetwork(
                        placeholder: "assets/images/placeholder.jpeg",
                        image: meal.imageUrl,
                        height: 240.0,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Container(
                        height: 240.0,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.transparent,
                              Colors.black,
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 8.0,
                  right: 8.0,
                  child: IconButton(
                    onPressed: onFavorite,
                    icon: Icon(
                      Symbols.favorite,
                      color: isFavorite ? Colors.red : Colors.white,
                      fill: isFavorite ? 1.0 : 0.0,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 16.0,
                  left: 16.0,
                  right: 16.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "RECIPE",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                        ),
                      ),
                      Text(
                        meal.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          height: 1.3,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                bottom: 20.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  BadgeMeal(
                    icon: Symbols.schedule,
                    label: meal.durationString,
                  ),
                  BadgeMeal(
                    icon: Symbols.skillet,
                    label: meal.complexityString,
                  ),
                  BadgeMeal(
                    icon: Symbols.paid,
                    label: meal.costString,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
