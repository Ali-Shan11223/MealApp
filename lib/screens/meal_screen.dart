import 'package:flutter/material.dart';

class MealScreen extends StatelessWidget {
  static const routeName = 'mealScreen';
  const MealScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final title = routeArgs['title'];
    final id = routeArgs['id'];
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: Center(
        child: Text(id!),
      ),
    );
  }
}
