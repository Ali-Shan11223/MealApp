import 'package:flutter/material.dart';
import 'package:meal_app/screens/meal_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  const CategoryItem({super.key, required this.title, required this.color, required this.id});

  void selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed('/mealsScreen', arguments: {
      'id': id, 'title' : title
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [color.withOpacity(0.7), color],
                begin: Alignment.topLeft,
                end: Alignment.topRight),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey,
                  offset: Offset.fromDirection(20),
                  blurRadius: 0.2,
                  spreadRadius: 0.6,
                  blurStyle: BlurStyle.normal)
            ]),
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}
