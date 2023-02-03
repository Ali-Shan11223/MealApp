import 'package:flutter/material.dart';
import 'package:meal_app/widgets/my_drawer.dart';

class FiltersScreen extends StatefulWidget {
  final Map<String, bool> currentFilters;
  final Function saveFileter;
  static const routeName = 'filtersScreen';
  const FiltersScreen(
      {super.key, required this.saveFileter, required this.currentFilters});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegan = false;
  bool _vegetarian = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten']!;
    _lactoseFree = widget.currentFilters['lactose']!;
    _vegan = widget.currentFilters['vegan']!;
    _vegetarian = widget.currentFilters['vegetarian']!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      drawer: const MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
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
                  value: _glutenFree,
                  onChanged: (value) {
                    setState(() {
                      _glutenFree = value;
                    });
                  },
                  title: const Text('Gluten-Free'),
                  subtitle: const Text('Only include Gluten-free meals.'),
                ),
                SwitchListTile(
                  value: _lactoseFree,
                  onChanged: (value) {
                    setState(() {
                      _lactoseFree = value;
                    });
                  },
                  title: const Text('Lactose-Free'),
                  subtitle: const Text('Only include Lactose-free meals.'),
                ),
                SwitchListTile(
                  value: _vegan,
                  onChanged: (value) {
                    setState(() {
                      _vegan = value;
                    });
                  },
                  title: const Text('Vegan'),
                  subtitle: const Text('Only include Vegan meals.'),
                ),
                SwitchListTile(
                  value: _vegetarian,
                  onChanged: (value) {
                    setState(() {
                      _vegetarian = value;
                    });
                  },
                  title: const Text('Vegetarian'),
                  subtitle: const Text('Only include Vegetarian meals.'),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    final selectedFilter = {
                      'gluten': _glutenFree,
                      'lactose': _lactoseFree,
                      'vegan': _vegan,
                      'vegetarian': _vegetarian
                    };
                    widget.saveFileter(selectedFilter);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.background,
                      foregroundColor: Colors.white),
                  child: const Text('Save Filter'),
                )
              ],
            )),
          ],
        ),
      ),
    );
  }
}
