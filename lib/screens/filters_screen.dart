import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilters;
  final Map<String, bool> currentFilters;
  FiltersScreen(
    this.currentFilters,
    this.saveFilters,
  );

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var glutenFree = false;
  var vegetarian = false;
  var vegan = false;
  var lactoseFree = false;
  Widget builSwitchTile(String title, var currentValue, Function changeValue) {
    return SwitchListTile(
      value: currentValue,
      onChanged: changeValue,
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: [
          IconButton(
              onPressed: () {
                final selectedFilters = {
                  'gluten': glutenFree,
                  'lactose': lactoseFree,
                  'vegan': vegan,
                  'vegetarian': vegetarian,
                };
                widget.saveFilters(selectedFilters);
              },
              icon: Icon(Icons.save))
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust Your Filters',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              builSwitchTile('GlutenFree', glutenFree, (newValue) {
                setState(() {
                  glutenFree = newValue;
                });
              }),
              builSwitchTile('LactoseFree', lactoseFree, (newValue) {
                setState(() {
                  lactoseFree = newValue;
                });
              }),
              builSwitchTile('Vegetarian', vegetarian, (newValue) {
                setState(() {
                  vegetarian = newValue;
                });
              }),
              builSwitchTile('Vegan', vegan, (newValue) {
                setState(() {
                  vegan = newValue;
                });
              }),
            ],
          ))
        ],
      ),
    );
  }
}
