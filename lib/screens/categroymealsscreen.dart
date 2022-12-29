// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:mealapp/dummy_data.dart';
import 'package:mealapp/widgets/meals.dart';

import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const rautname = "/m";
  final List<Meal> filterdmeal;

  const CategoryMealsScreen({super.key, required this.filterdmeal});

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String? cattitle;
  String? catid;
  late List<Meal> categoremeals;
  @override
  void didChangeDependencies() {
    final routarg =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    catid = routarg['id'];
    cattitle = routarg['title'];
    categoremeals = widget.filterdmeal.where((meal) {
      return meal.categories.contains(catid);
    }).toList();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemBuilder: (ctx, i) {
            return Meals(
              id: categoremeals[i].id,
              affordability: categoremeals[i].affordability,
              complexity: categoremeals[i].complexity,
              duration: categoremeals[i].duration,
              imageurl: categoremeals[i].imageUrl,
              title: categoremeals[i].title,
            );
          },
          itemCount: categoremeals.length),
      appBar: AppBar(title: Text("$cattitle Recipes")),
    );
  }
}
