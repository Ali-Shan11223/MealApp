import 'package:flutter/material.dart';
import 'package:meal_app/screens/catergories_screen.dart';
import 'package:meal_app/screens/meal_screen.dart';

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
        primaryColor: Colors.blue,
        fontFamily: 'Raleway',
        textTheme: const TextTheme(
            titleMedium: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
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
          surface: Colors.teal,
          onSurface: Colors.white,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/' : (context) => const CategoriesScreen(),
        MealScreen.routeName : (context) => const MealScreen()
      },
    );
  }
}
