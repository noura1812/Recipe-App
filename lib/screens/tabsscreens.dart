import 'package:flutter/material.dart';
import 'package:mealapp/screens/categoryes_screen.dart';
import 'package:mealapp/screens/favoret_screen.dart';

import '../models/meal.dart';
import '../widgets/maindrawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoretmeals;

  const TabsScreen({super.key, required this.favoretmeals});
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedScreen = 0;
  late List<Map<String, Object>> _pages;
  @override
  void initState() {
    _pages = [
      {'title': 'Categories', 'page': CategoriesScreen()},
      {
        'title': 'Favoret',
        'page': FavoretScreen(
          favoretmeals: widget.favoretmeals,
        )
      }
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_pages[_selectedScreen]['title'].toString())),
      body: _pages[_selectedScreen]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedScreen,
        onTap: ((value) {
          setState(() {
            _selectedScreen = value;
          });
        }),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.category_rounded), label: "Categorys"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorits")
        ],
        backgroundColor: Theme.of(context).primaryColor,
      ),
      drawer: MainDrawer(),
    );
  }
}
