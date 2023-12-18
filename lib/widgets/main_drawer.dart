import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:meals/utils/app_routes.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  Widget _renderItem({
    required IconData icon,
    required String label,
    required BuildContext context,
    Function()? onTap,
  }) {
    return ListTile(
      splashColor: Theme.of(context).primaryColor.withOpacity(0.2),
      leading: Icon(
        icon,
        size: 24,
        fill: 1,
        color: Theme.of(context).primaryColor,
      ),
      title: Text(
        label,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            alignment: Alignment.bottomLeft,
            color: Theme.of(context).primaryColor,
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top,
              left: 16,
              right: 16,
              bottom: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 32,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Symbols.local_dining,
                    color: Theme.of(context).primaryColor,
                    size: 40,
                  ),
                ),
                const Gap(16.0),
                const Text(
                  "Cooking Up!",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const Gap(8.0),
          _renderItem(
            context: context,
            icon: Symbols.home,
            label: "Home",
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          _renderItem(
            context: context,
            icon: Symbols.settings,
            label: "Settings",
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed(AppRoutes.settings);
            },
          ),
        ],
      ),
    );
  }
}
