import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/provider/favorites_provider.dart';
import 'package:meals/widgets/badge_meal.dart';
import 'package:meals/widgets/meal_ingredients.dart';
import 'package:meals/widgets/meal_mode_of_preparation.dart';
import 'package:provider/provider.dart';

class MealDetailPage extends StatefulWidget {
  const MealDetailPage({super.key});

  @override
  State<MealDetailPage> createState() => _MealDetailPageState();
}

class _MealDetailPageState extends State<MealDetailPage> {
  final ScrollController _scrollController = ScrollController();

  bool _isVisible = false;
  double _opacity = 1.0;
  double _appBarOpacity = 0.0;

  double _scrollOffset = 0.0;

  int tabIndex = 0;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        _isVisible = true;
      });
    });

    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    double offset = _scrollController.offset;
    double maxScrollExtent = 240.0;
    double opacity = 1.0 - (offset / maxScrollExtent);
    double appBarOpacity = offset / maxScrollExtent;

    if (offset > 0) {
      setState(() {
        _scrollOffset = _scrollController.offset;
        _opacity = opacity >= 0.50 ? opacity : 0.50;
        _appBarOpacity = appBarOpacity <= 1.0 ? appBarOpacity : 1.0;
      });
    } else if (offset <= 0) {
      setState(() {
        _scrollOffset = 0.0;
        _opacity = 1.0;
        _appBarOpacity = 0.0;
      });
    } else if (offset >= maxScrollExtent) {
      setState(() {
        _opacity = 0.50;
        _appBarOpacity = 1.0;
      });
    }
  }

  void _changeTab(int index) {
    setState(() {
      tabIndex = index;
    });

    _scrollController.animateTo(
      _scrollController.position.minScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  void _goToBack(BuildContext ctx) {
    Navigator.of(ctx).pop();
  }

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)!.settings.arguments as MealModel;

    return Consumer<FavoritesProvider>(builder: (ctx, favorites, child) {
      bool isFavorite = favorites.isFavorite(meal.id);

      return Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          controller: _scrollController,
          physics: const BouncingScrollPhysics(
            decelerationRate: ScrollDecelerationRate.fast,
          ),
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).padding.bottom,
          ),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        opacity: _opacity,
                        image: NetworkImage(meal.imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Container(
                      height: 480.0,
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
                  ),
                  Positioned(
                    bottom: 16.0,
                    left: 0.0,
                    right: 0.0,
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 300),
                      opacity: _isVisible ? 1.0 : 0.0,
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
                  ),
                  Positioned(
                    top: _scrollOffset,
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 300),
                      opacity: _isVisible ? 1.0 : 0.0,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).padding.top,
                          left: 8.0,
                          right: 8.0,
                          bottom: 8.0,
                        ),
                        color: Colors.black.withOpacity(_appBarOpacity),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () => _goToBack(context),
                              icon: const Icon(
                                Symbols.arrow_back,
                                size: 32.0,
                                color: Colors.white,
                                fill: 0,
                              ),
                            ),
                            IconButton(
                              onPressed: () =>
                                  favorites.toggleFavorite(meal.id),
                              highlightColor: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.2),
                              icon: Icon(
                                Symbols.favorite,
                                size: 32.0,
                                color: isFavorite ? Colors.red : Colors.white,
                                fill: isFavorite ? 1 : 0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 300),
                opacity: _isVisible ? 1.0 : 0.0,
                child: Column(
                  children: [
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton.icon(
                          onPressed: () => _changeTab(0),
                          style: tabIndex == 0
                              ? TextButton.styleFrom(
                                  backgroundColor:
                                      Theme.of(context).primaryColor,
                                  iconColor: Colors.white,
                                )
                              : null,
                          icon: const Icon(Symbols.receipt_long),
                          label: Text(
                            "Ingredients",
                            style: TextStyle(
                              color: tabIndex == 0 ? Colors.white : null,
                            ),
                          ),
                        ),
                        TextButton.icon(
                          onPressed: () => _changeTab(1),
                          style: tabIndex == 1
                              ? TextButton.styleFrom(
                                  backgroundColor:
                                      Theme.of(context).primaryColor,
                                  iconColor: Colors.white,
                                )
                              : null,
                          icon: const Icon(Symbols.skillet),
                          label: Text(
                            "Mode of Preparation",
                            style: TextStyle(
                              color: tabIndex == 1 ? Colors.white : null,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Visibility(
                      visible: tabIndex == 0,
                      child: MealIngredients(ingredients: meal.ingredients),
                    ),
                    Visibility(
                      visible: tabIndex == 1,
                      child: MealModeOfPreparation(steps: meal.steps),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
