import 'package:flutter/material.dart';
import 'package:meals/models/filter.dart';
import 'package:meals/provider/settings_provider.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  Filter filter = Filter();

  Widget renderFilterTile({
    required String title,
    required String description,
    required bool value,
    Function(bool)? onChanged,
  }) {
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(description),
      value: value,
      selectedTileColor: Colors.pinkAccent.withOpacity(0.1),
      onChanged: onChanged,
      applyCupertinoTheme: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsProvider>(builder: (ctx, settings, child) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("S E T T I N G S"),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                color: Colors.amber[100],
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    "Filter meals",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  renderFilterTile(
                      title: "Gluten-free",
                      description: "Only include gluten-free meals.",
                      value: settings.isFreeGluten,
                      onChanged: (newValue) => settings.onFreeGluten(newValue)),
                  renderFilterTile(
                    title: "Lactose-free",
                    description: "Only include lactose-free meals.",
                    value: settings.isFreeLactose,
                    onChanged: (newValue) => settings.onFreeLactose(newValue),
                  ),
                  renderFilterTile(
                    title: "Vegetarian",
                    description: "Only include vegetarian meals.",
                    value: settings.isVegetarian,
                    onChanged: (newValue) => settings.onVegetarian(newValue),
                  ),
                  renderFilterTile(
                    title: "Vegan",
                    description: "Only include vegan meals.",
                    value: settings.isVegan,
                    onChanged: (newValue) => settings.onVegan(newValue),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}
