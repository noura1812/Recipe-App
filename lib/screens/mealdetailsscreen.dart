import 'package:flutter/material.dart';

import '../dummy_data.dart';

class Mealdetails extends StatelessWidget {
  static const routname = "/d";
  final Function favmeals;

  final Function fav;

  const Mealdetails({super.key, required this.favmeals, required this.fav});
  Container tittl(BuildContext context, String tit) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        tit,
        style: Theme.of(context).textTheme.bodyText1,
      ),
    );
  }

  Container list(x) {
    return Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(15)),
        height: 150,
        width: 300,
        child: x);
  }

  @override
  Widget build(BuildContext context) {
    final mealid = ModalRoute.of(context)!.settings.arguments as String;
    final selectedmeal =
        DUMMY_MEALS.firstWhere((element) => element.id == mealid);

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedmeal.title),
        leading: IconButton(
          icon: Icon(Icons.chevron_left),
          onPressed: () => Navigator.pop(context, fav(mealid)),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            padding: EdgeInsets.only(top: 10),
            width: double.infinity,
            height: 300,
            child: Image.network(
              selectedmeal.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          tittl(
            context,
            "Ingradients",
          ),
          list(
            ListView.builder(
              itemBuilder: ((context, index) {
                return Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Text(selectedmeal.ingredients[index]),
                  ),
                );
              }),
              itemCount: selectedmeal.ingredients.length,
            ),
          ),
          tittl(
            context,
            "Steps",
          ),
          list(
            ListView.builder(
              itemBuilder: ((context, index) {
                return Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Theme.of(context).accentColor,
                        child: Text(
                          "# ${index + 1}",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      title: Text(selectedmeal.steps[index]),
                    ),
                    Divider()
                  ],
                );
              }),
              itemCount: selectedmeal.steps.length,
            ),
          )
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          return favmeals(mealid);
        },
        child:
            Icon(fav(mealid) ? Icons.favorite : Icons.favorite_border_outlined),
      ),
    );
  }
}
