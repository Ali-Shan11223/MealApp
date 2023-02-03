import 'package:flutter/material.dart';
import 'package:meal_app/utils/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = 'mealdetail-screen';
  final Function toggleFavorite;
  final Function isMealFavorite;
  const MealDetailScreen({super.key, required this.toggleFavorite, required this.isMealFavorite});

  Widget buildTitle(BuildContext context, String title) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
              width: 1, color: Colors.grey, style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(10)),
      height: 250,
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: child,
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
              height: 250,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildTitle(context, 'Ingredients'),
            buildContainer(
              ListView.builder(
                  itemCount: selectedMeal.ingredients.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ListTile(
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
                        ),
                        const Divider(
                          height: 0.0,
                        )
                      ],
                    );
                  }),
            ),
            buildTitle(context, 'Steps'),
            buildContainer(
              ListView.builder(
                  itemCount: selectedMeal.steps.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ListTile(
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
                            selectedMeal.steps[index],
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                        const Divider(
                          height: 0.0,
                        )
                      ],
                    );
                  }),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: toggleFavorite(mealId),
        child: Icon(isMealFavorite(mealId) ? Icons.star: Icons.star_outline),
      ),
    );
  }
}
