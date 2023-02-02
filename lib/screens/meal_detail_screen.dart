import 'package:flutter/material.dart';
import 'package:meal_app/utils/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = 'mealdetail-screen';
  const MealDetailScreen({super.key});

  Widget buildTitle(BuildContext context, String title) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal = dummyMealData.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
        appBar: AppBar(
          title: Text(selectedMeal.title),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  selectedMeal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              buildTitle(context, 'Ingredients'),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 1, color: Colors.grey, style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(10)),
                height: 250,
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: ListView.builder(
                    itemCount: selectedMeal.ingredients.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        contentPadding: EdgeInsets.zero,
                        dense: true,
                        leading: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              color: Colors.purple.shade300,
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(8)),
                          child: Center(
                              child: Text(
                            '${index + 1}',
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          )),
                        ),
                        title: Text(
                          selectedMeal.ingredients[index],
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      );
                    }),
              )
            ],
          ),
        ));
  }
}
