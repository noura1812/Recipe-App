import 'package:flutter/material.dart';
import 'package:mealapp/screens/filters.dart';

class MainDrawer extends StatelessWidget {
  Widget items(name, IconData icon, Function tapselector) {
    return ListTile(
      onTap: () {
        return tapselector();
      },
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        name,
        style: const TextStyle(
          fontSize: 20,
          fontFamily: 'RobotoCondensed',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).primaryColor,
            child: Text(
              "Cooking App!!",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: Theme.of(context).accentColor),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          items("Meals", (Icons.restaurant), () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          items("Filers", (Icons.settings), () {
            Navigator.of(context).pushReplacementNamed(Filtersscreen.rautname);
          })
        ],
      ),
    );
  }
}
