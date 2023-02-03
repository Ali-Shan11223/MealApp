import 'package:flutter/material.dart';
import 'package:meal_app/models/meals.dart';
import 'package:meal_app/screens/filters_screen.dart';
import 'package:meal_app/screens/meal_detail_screen.dart';
import 'package:meal_app/screens/meal_screen.dart';
import 'package:meal_app/screens/tabs_screen.dart';
import 'package:meal_app/utils/dummy_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false
  };

  List<Meals> _availableMeals = dummyMealData;
  final List<Meals> _favoriteMeals = [];

  void _setFileter(Map<String, bool> filter) {
    setState(() {
      _filters = filter;
      _availableMeals = dummyMealData.where((meal) {
        if (_filters['gluten']! && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose']! && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan']! && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian']! && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorites(String mealId) {
    final existingIndex =
        _favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals
            .add(dummyMealData.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool _isMealFavorite(String id) {
    return _favoriteMeals.any((meal) => meal.id == id);
  }

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
        '/': (context) => TabsScreen(
              isFavorite: _favoriteMeals,
            ),
        MealScreen.routeName: (context) => MealScreen(
              availableMeals: _availableMeals,
            ),
        MealDetailScreen.routeName: (context) => MealDetailScreen(
              toggleFavorite: _toggleFavorites,
              isMealFavorite: _isMealFavorite,
            ),
        FiltersScreen.routeName: (context) => FiltersScreen(
              currentFilters: _filters,
              saveFileter: _setFileter,
            )
      },
    );
  }
}
