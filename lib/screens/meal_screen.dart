import 'package:flutter/material.dart';
import 'package:meal_app/utils/dummy_data.dart';
import 'package:meal_app/widgets/meal_item.dart';

class MealScreen extends StatelessWidget {
  static const routeName = 'mealScreen';
  const MealScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final title = routeArgs['title'];
    final id = routeArgs['id'];
    final categoryMeals = dummyMealData.where((mealData) {
      return mealData.categories.contains(id);
    }).toList();
    return Scaffold(
        appBar: AppBar(
          title: Text(title!),
        ),
        body: ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: categoryMeals.length,
            itemBuilder: (context, index) {
              return MealItem(
                id: categoryMeals[index].id,
                  title: categoryMeals[index].title,
                  imageUrl: categoryMeals[index].imageUrl,
                  complexity: categoryMeals[index].complexity,
                  affordability: categoryMeals[index].affordability,
                  duration: categoryMeals[index].duration);
            }));
  }
}
