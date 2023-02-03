import 'package:flutter/material.dart';
import 'package:meal_app/screens/catergories_screen.dart';
import 'package:meal_app/screens/favorites_screen.dart';

import '../models/meals.dart';
import '../widgets/my_drawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Meals> isFavorite;
  const TabsScreen({super.key, required this.isFavorite});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, dynamic>> screens = [];
  int selectedIndex = 0;

  @override
  void initState() {
    screens = [
      {'screen': const CategoriesScreen(), 'title': 'Meals'},
      {
        'screen': FavoritesScreen(
          favoriteMeals: widget.isFavorite,
        ),
        'title': 'Favorites'
      }
    ];
    super.initState();
  }

  void selectScreen(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(screens[selectedIndex]['title']),
      ),
      drawer: const Drawer(
        child: MyDrawer(),
      ),
      body: screens[selectedIndex]['screen'],
      bottomNavigationBar: BottomNavigationBar(
          onTap: selectScreen,
          currentIndex: selectedIndex,
          backgroundColor: Theme.of(context).colorScheme.background,
          selectedItemColor: Theme.of(context).colorScheme.secondary,
          unselectedItemColor: Colors.white,
          // type: BottomNavigationBarType.shifting,
          items: const [
            BottomNavigationBarItem(
                // backgroundColor: Theme.of(context).backgroundColor,
                icon: Icon(Icons.category),
                label: 'Categories'),
            BottomNavigationBarItem(
                // backgroundColor: Theme.of(context).backgroundColor,
                icon: Icon(Icons.star),
                label: 'Favorites')
          ]),
    );
  }
}
