import 'package:flutter/material.dart';
import 'package:meal_app/screens/filters_screen.dart';

class MyDrawer extends StatelessWidget {
  Widget buildListTile(
      IconData iconData, String title, VoidCallback onTapHandler) {
    return ListTile(
        leading: Icon(
          iconData,
          size: 26,
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24,
          ),
        ),
        onTap: onTapHandler);
  }

  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        Container(
          height: 150,
          width: double.infinity,
          alignment: Alignment.centerLeft,
          color: Theme.of(context).colorScheme.background,
          padding: const EdgeInsets.all(20),
          child: const Text(
            'Cooking Up!',
            style: TextStyle(
                fontWeight: FontWeight.w900, fontSize: 24, color: Colors.white),
          ),
        ),
        buildListTile(Icons.restaurant, 'Meals', () {
          Navigator.of(context).pushReplacementNamed('/');
        }),
        buildListTile(Icons.settings, 'Filters', () {
          Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
        })
      ]),
    );
  }
}
