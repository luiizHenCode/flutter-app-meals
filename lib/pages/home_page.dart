import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:meals/pages/categories_page.dart';
import 'package:meals/pages/favorites_pages.dart';
import 'package:meals/widgets/main_drawer.dart';

// Scaffold global key

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, Object> pages = [
      {
        "page": const CategoriesPage(),
        "title": "C O O K I N G   U P !",
      },
      {
        "page": const FavoritesPage(),
        "title": "F A V O R I T E S",
      },
    ][_currentIndex];

    final String title = pages["title"] as String;
    final Widget page = pages["page"] as Widget;

    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        drawer: const MainDrawer(),
        body: page,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: _onTap,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Symbols.category,
                fill: _currentIndex == 0 ? 1 : 0,
              ),
              label: "Categories",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Symbols.favorite,
                fill: _currentIndex == 1 ? 1 : 0,
              ),
              label: "Favorites",
            ),
          ],
        ));
  }
}
