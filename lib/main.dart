import 'package:flutter/material.dart';
import 'package:mealapp/dummy_data.dart';
import 'package:mealapp/models/meal.dart';
import 'package:mealapp/screens/categroymealsscreen.dart';
import 'package:mealapp/screens/favoret_screen.dart';
import 'package:mealapp/screens/filters.dart';
import 'package:mealapp/screens/mealdetailsscreen.dart';
import 'package:mealapp/screens/tabsscreens.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegen': false,
    'vegeterian': false
  };
  List<Meal> _filterdmeal = DUMMY_MEALS;

  List<Meal> _favoretmeals = [];

  void _setfilters(Map<String, bool> _filtersdata) {
    setState(() {
      _filters = _filtersdata;
      _filterdmeal = DUMMY_MEALS.where((element) {
        if (_filters['gluten'] == true && !element.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] == true && !element.isLactoseFree) {
          return false;
        }
        if (_filters['vegen'] == true && !element.isVegan) {
          return false;
        }
        if (_filters['vegeterian'] == true && !element.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _totalfavmeals(String mealid) {
    final existinfindex = _favoretmeals.indexWhere((meal) => meal.id == mealid);
    if (existinfindex >= 0) {
      setState(() {
        _favoretmeals.removeAt(existinfindex);
      });
    } else {
      setState(() {
        _favoretmeals
            .add(DUMMY_MEALS.firstWhere((element) => element.id == mealid));
      });
    }
  }

  bool fav(String mealid) {
    return _favoretmeals.any((element) => element.id == mealid);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => TabsScreen(favoretmeals: _favoretmeals),
        CategoryMealsScreen.rautname: ((context) => CategoryMealsScreen(
              filterdmeal: _filterdmeal,
            )),
        Filtersscreen.rautname: ((context) =>
            Filtersscreen(savefilters: _setfilters, tempfulters: _filters)),
        Mealdetails.routname: ((context) =>
            Mealdetails(favmeals: _totalfavmeals, fav: fav))
      },
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          accentColor: Color(0xffFBC00E),
          primarySwatch: Colors.blue,
          canvasColor: const Color.fromRGBO(255, 254, 229, 1),
          textTheme: ThemeData.light().textTheme.copyWith(
                bodyText1: const TextStyle(
                    color: Color.fromRGBO(20, 50, 50, 1),
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    fontFamily: 'RobotoCondensed'),
                bodyText2:
                    const TextStyle(color: Color.fromRGBO(20, 50, 50, 1)),
              )),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Meal App"),
        ),
        body: null);
  }
}
