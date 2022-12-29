import 'package:flutter/material.dart';
import '../screens/categroymealsscreen.dart';

class CategoryItems extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  const CategoryItems(
      {required this.id, required this.title, required this.color});
  void selectcategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(CategoryMealsScreen.rautname, arguments: {
      'id': id,
      'title': title,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      onTap: () => selectcategory(context),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [color.withOpacity(.4), color],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(15)),
        child: Text(title, style: Theme.of(context).textTheme.bodyText1),
      ),
    );
  }
}
