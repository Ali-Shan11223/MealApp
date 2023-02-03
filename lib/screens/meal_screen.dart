import 'package:flutter/material.dart';
import 'package:meal_app/models/meals.dart';
import 'package:meal_app/utils/dummy_data.dart';
import 'package:meal_app/widgets/meal_item.dart';

class MealScreen extends StatefulWidget {
  static const routeName = 'mealScreen';
  final List<Meals> availableMeals;
  const MealScreen({super.key, required this.availableMeals});

  @override
  State<MealScreen> createState() => _MealScreenState();
}

class _MealScreenState extends State<MealScreen> {
  String? categoryTitle;
  List<Meals>? displayedMeals;

  @override
  void didChangeDependencies() {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    categoryTitle = routeArgs['title'];
    final id = routeArgs['id'];
    displayedMeals = widget.availableMeals.where((mealData) {
      return mealData.categories.contains(id);
    }).toList();
    super.didChangeDependencies();
  }

  void removeItem(String mealId) {
    setState(() {
      displayedMeals!.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle!),
        ),
        body: ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: displayedMeals!.length,
            itemBuilder: (context, index) {
              return MealItem(
                id: displayedMeals![index].id,
                title: displayedMeals![index].title,
                imageUrl: displayedMeals![index].imageUrl,
                complexity: displayedMeals![index].complexity,
                affordability: displayedMeals![index].affordability,
                duration: displayedMeals![index].duration,
                
              );
            }));
  }
}
