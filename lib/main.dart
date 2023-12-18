import 'package:flutter/material.dart';
import 'package:meals/pages/category_meals_page.dart';
import 'package:meals/pages/home_page.dart';
import 'package:meals/pages/meal_detail_page.dart';
import 'package:meals/pages/settings_pages.dart';
import 'package:meals/provider/favorites_provider.dart';
import 'package:meals/provider/settings_provider.dart';
import 'package:meals/styles/theme.dart';
import 'package:meals/utils/app_routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SettingsProvider()),
        ChangeNotifierProvider(create: (_) => FavoritesProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      debugShowCheckedModeBanner: false,
      title: "Meals App (Study)",
      initialRoute: AppRoutes.home,
      routes: {
        AppRoutes.home: (ctx) => const HomePage(),
        AppRoutes.categoryMeals: (ctx) => const CategoryModelMealsPage(),
        AppRoutes.mealDetail: (ctx) => const MealDetailPage(),
        AppRoutes.settings: (ctx) => const SettingsPage(),
      },
    );
  }
}
