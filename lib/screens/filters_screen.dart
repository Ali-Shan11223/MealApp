import 'package:flutter/material.dart';
import 'package:meal_app/widgets/my_drawer.dart';

class FiltersScreen extends StatelessWidget {
  static const routeName = 'filtersScreen';
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
      ),
      drawer: MyDrawer(),
      body: Center(
        child: Text('Filters'),
      ),
    );
  }
}
