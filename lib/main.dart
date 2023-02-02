import 'package:flutter/material.dart';
import 'package:meal_app/screens/catergories_screen.dart';
import 'package:meal_app/screens/filters_screen.dart';
import 'package:meal_app/screens/meal_detail_screen.dart';
import 'package:meal_app/screens/meal_screen.dart';
import 'package:meal_app/screens/tabs_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MealApp',
      theme: ThemeData(
          useMaterial3: true,
          fontFamily: 'Raleway',
          textTheme: const TextTheme(
              bodyLarge: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              bodyMedium: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              titleMedium: TextStyle(
                  fontFamily: 'RobotoCondensed',
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
              titleLarge: TextStyle(
                  fontFamily: 'RobotoCondensed',
                  fontSize: 25,
                  fontWeight: FontWeight.bold)),
          colorScheme: const ColorScheme(
            brightness: Brightness.light,
            primary: Colors.blue,
            onPrimary: Colors.white,
            secondary: Colors.green,
            onSecondary: Colors.white,
            error: Colors.red,
            onError: Colors.white,
            background: Colors.purple,
            onBackground: Colors.white,
            surface: Colors.white,
            onSurface: Colors.black,
          ),
          appBarTheme: const AppBarTheme(
              iconTheme: IconThemeData(color: Colors.white),
              backgroundColor: Colors.purple,
              titleTextStyle: TextStyle(color: Colors.white, fontSize: 24))),
      initialRoute: '/',
      routes: {
        '/': (context) => const TabsScreen(),
        MealScreen.routeName: (context) => const MealScreen(),
        MealDetailScreen.routeName: (context) => const MealDetailScreen(),
        FiltersScreen.routeName: (context) => const FiltersScreen()
      },
    );
  }
}
