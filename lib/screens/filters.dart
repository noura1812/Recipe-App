import 'package:flutter/material.dart';
import 'package:mealapp/widgets/maindrawer.dart';

class Filtersscreen extends StatefulWidget {
  static const rautname = "/f";
  final Function savefilters;
  final Map<String, bool> tempfulters;
  const Filtersscreen({required this.savefilters, required this.tempfulters});

  @override
  State<Filtersscreen> createState() => _FiltersscreenState();
}

class _FiltersscreenState extends State<Filtersscreen> {
  bool _isGlutenFree = false;
  bool _isLactoseFree = false;
  bool _isVegan = false;
  bool _isVegetarian = false;
  @override
  void initState() {
    _isGlutenFree = widget.tempfulters['gluten']!;
    _isLactoseFree = widget.tempfulters['lactose']!;
    _isVegan = widget.tempfulters['vegen']!;
    _isVegetarian = widget.tempfulters['vegeterian']!;

    super.initState();
  }

  Widget buildsitchlisttile(x, val, Function update) {
    return SwitchListTile(
        title: Text(x),
        subtitle: Text("Only include $x meals"),
        value: val,
        onChanged: (v) {
          return update(v);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filters"),
        actions: [
          IconButton(
              onPressed: () {
                final Map<String, bool> selectedfilters = {
                  'gluten': _isGlutenFree,
                  'lactose': _isLactoseFree,
                  'vegen': _isVegan,
                  'vegeterian': _isVegetarian
                };
                return widget.savefilters(selectedfilters);
              },
              icon: Icon(Icons.save))
        ],
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(20),
            child: Text(
              "Adjust your meal selection!!",
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              buildsitchlisttile("Gluten free", _isGlutenFree, (v) {
                setState(() {
                  _isGlutenFree = v;
                });
              }),
              buildsitchlisttile("LactoseFree", _isLactoseFree, (v) {
                setState(() {
                  _isLactoseFree = v;
                });
              }),
              buildsitchlisttile("Vegan", _isVegan, (v) {
                setState(() {
                  _isVegan = v;
                });
              }),
              buildsitchlisttile("Vegetarian", _isVegetarian, (v) {
                setState(() {
                  _isVegetarian = v;
                });
              })
            ],
          ))
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
