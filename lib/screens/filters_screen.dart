import 'package:flutter/material.dart';
import 'package:meal_app/widgets/my_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = 'filtersScreen';
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _GlutenFree = false;
  bool _LactoseFree = false;
  bool _Vegan = false;
  bool _Vegetarian = false;

  // Widget buildSwitchTile(String title, String description, bool currentValue,
  //     Function updatedValue) {
  //   return SwitchListTile(
  //     value: currentValue,
  //     onChanged: updatedValue(),
  //     title: Text(title),
  //     subtitle: Text(description),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      drawer: const MyDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection.',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              SwitchListTile(
                value: _GlutenFree,
                onChanged: (value) {
                  setState(() {
                    _GlutenFree = value;
                  });
                },
                title: const Text('Gluten-Free'),
                subtitle: const Text('Only include Gluten-free meals.'),
              ),
              SwitchListTile(
                value: _LactoseFree,
                onChanged: (value) {
                  setState(() {
                    _LactoseFree = value;
                  });
                },
                title: const Text('Lactose-Free'),
                subtitle: const Text('Only include Lactose-free meals.'),
              ),
              SwitchListTile(
                value: _Vegan,
                onChanged: (value) {
                  setState(() {
                    _Vegan = value;
                  });
                },
                title: const Text('Vegan'),
                subtitle: const Text('Only include Vegan meals.'),
              ),
              SwitchListTile(
                value: _Vegetarian,
                onChanged: (value) {
                  setState(() {
                    _Vegetarian = value;
                  });
                },
                title: const Text('Vegetarian'),
                subtitle: const Text('Only include Vegetarian meals.'),
              )
            ],
          ))
        ],
      ),
    );
  }
}
