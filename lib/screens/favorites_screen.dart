import 'package:flutter/material.dart';

import '../models/meals.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meals> favoriteMeals;
  const FavoritesScreen({super.key, required this.favoriteMeals});

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return const Center(
        child: Text('You have no Favorite items yet!'),
      );
    } else {
      return ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: favoriteMeals.length,
          itemBuilder: (context, index) {
            return MealItem(
              id: favoriteMeals[index].id,
              title: favoriteMeals[index].title,
              imageUrl: favoriteMeals[index].imageUrl,
              complexity: favoriteMeals[index].complexity,
              affordability: favoriteMeals[index].affordability,
              duration: favoriteMeals[index].duration,
            );
          });
    }
  }
}
