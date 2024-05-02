import 'package:expense_tracker/widgets/expense_list/expense.dart';
import 'package:flutter/material.dart';

final kColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 96, 59, 181));

final kDarkColorScheme = ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 5, 99, 125),
    brightness: Brightness.dark);

void main() {
  runApp(
    MaterialApp(
        theme: ThemeData().copyWith(
            colorScheme: kColorScheme,
            appBarTheme: AppBarTheme(
                backgroundColor: kColorScheme.onPrimaryContainer,
                foregroundColor: kColorScheme.primaryContainer),
            cardTheme: CardTheme().copyWith(
              color: kColorScheme.secondaryContainer,
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  backgroundColor: kColorScheme.secondaryContainer),
            ),
            textTheme: ThemeData().textTheme.copyWith(
                titleLarge: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: kColorScheme.onSecondaryContainer,
                    fontSize: 16))),
        darkTheme: ThemeData.dark().copyWith(
            appBarTheme: AppBarTheme(
                backgroundColor: kDarkColorScheme.onPrimary,
                foregroundColor: kDarkColorScheme.onPrimaryContainer),
            cardTheme: const CardTheme().copyWith(
              color: kDarkColorScheme.secondaryContainer,
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            ),
            textTheme: ThemeData().textTheme.copyWith(
                titleLarge: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: kDarkColorScheme.onSecondaryContainer,
                    fontSize: 16))),
        themeMode: ThemeMode.system,
        home: Expenses()),
  );
}
