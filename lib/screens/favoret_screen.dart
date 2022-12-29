import 'package:flutter/material.dart';
import 'package:mealapp/screens/categroymealsscreen.dart';

import '../models/meal.dart';
import '../widgets/category_items.dart';
import '../widgets/meals.dart';

class FavoretScreen extends StatefulWidget {
  static const rautname = "/fav";
  final List<Meal> favoretmeals;

  const FavoretScreen({super.key, required this.favoretmeals});

  @override
  State<FavoretScreen> createState() => _FavoretScreenState();
}

class _FavoretScreenState extends State<FavoretScreen> {
  void _removemeal(x) {
    setState(() {
      widget.favoretmeals.removeWhere((element) => element.id == x);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.favoretmeals.isEmpty) {
      return Scaffold(
        body: const Center(
          child: Text("you have no favorets!!"),
        ),
      );
    } else {
      return Scaffold(
        body: ListView.builder(
            itemBuilder: (ctx, i) {
              return Meals(
                id: widget.favoretmeals[i].id,
                affordability: widget.favoretmeals[i].affordability,
                complexity: widget.favoretmeals[i].complexity,
                duration: widget.favoretmeals[i].duration,
                imageurl: widget.favoretmeals[i].imageUrl,
                title: widget.favoretmeals[i].title,
                removeitem: _removemeal,
              );
            },
            itemCount: widget.favoretmeals.length),
      );
    }
  }
}
