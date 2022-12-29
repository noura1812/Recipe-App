import 'package:flutter/material.dart';
import 'package:mealapp/screens/mealdetailsscreen.dart';

import '../models/meal.dart';

class Meals extends StatelessWidget {
  final imageurl;
  final title;
  final duration;
  final Complexity complexity;
  final Affordability affordability;
  final id;
  final Function? removeitem;
  const Meals(
      {required this.imageurl,
      required this.title,
      required this.duration,
      required this.complexity,
      required this.affordability,
      required this.id,
      this.removeitem});
  String get Complexitytext {
    switch (complexity) {
      case Complexity.Simple:
        return "Simple";
        break;
      case Complexity.Hard:
        return "Hard";
        break;
      case Complexity.Challenging:
        return "Challenging";
        break;
      default:
        return "Unknown";
        break;
    }
  }

  String get affordabiltytext {
    switch (affordability) {
      case Affordability.Affordable:
        return "Affordable";
        break;
      case Affordability.Luxurious:
        return "Luxurious";
        break;
      case Affordability.Pricey:
        return "Pricey";
        break;
      default:
        return "Unknown";
        break;
    }
  }

  void selectmeal(BuildContext ctx) {
    Navigator.of(ctx)
        .pushNamed(Mealdetails.routname, arguments: id)
        .then((value) {
      if (value == false) {
        if (removeitem == null) {
        } else {
          removeitem!(id);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        return selectmeal(context);
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 5,
        margin: const EdgeInsets.all(10),
        child: Column(children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                child: Image.network(
                  imageurl,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 20,
                right: 10,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  color: Colors.black54,
                  width: 320,
                  child: Text(
                    title,
                    style: const TextStyle(fontSize: 26, color: Colors.white),
                    softWrap: true,
                    overflow: TextOverflow.fade,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Icon(Icons.schedule),
                    SizedBox(
                      width: 6,
                    ),
                    Text(" $duration min")
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.work),
                    SizedBox(
                      width: 6,
                    ),
                    Text(Complexitytext)
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.attach_money),
                    SizedBox(
                      width: 6,
                    ),
                    Text(affordabiltytext)
                  ],
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
