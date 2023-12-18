import 'package:flutter/material.dart';

ThemeData theme = ThemeData(
  fontFamily: "Raleway",
  textTheme: ThemeData.light().textTheme.copyWith(
        titleMedium: const TextStyle(
          fontSize: 20.0,
          height: 1.2,
          fontWeight: FontWeight.w700,
        ),
      ),
  appBarTheme: const AppBarTheme().copyWith(
    backgroundColor: Colors.pinkAccent,
    iconTheme: const IconThemeData(color: Colors.white),
    titleTextStyle: const TextStyle(
      color: Colors.white,
      fontSize: 24,
      fontWeight: FontWeight.bold,
      letterSpacing: 1.4,
    ),
  ),
  colorScheme: const ColorScheme.light().copyWith(
    primary: Colors.pinkAccent,
    background: const Color.fromRGBO(255, 254, 229, 1),
  ),
);
