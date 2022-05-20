import 'package:flutter/material.dart';
import 'package:meal_app/screens/MainDrawer.dart';

class FiltersScreeen extends StatefulWidget {
  static const routename = 'filters_screen.dart';
  final Function savefilters;
  final Map currentfilters;

  FiltersScreeen(this.savefilters, this.currentfilters);

  @override
  _FiltersScreeenState createState() => _FiltersScreeenState();
}

class _FiltersScreeenState extends State<FiltersScreeen> {
  bool isGlutenFree = false;

  bool isLactoseFree = false;

  bool isVegan = false;

  bool isVegetarian = false;

  @override
  initState() {
    isGlutenFree = widget.currentfilters['isGlutenFree'];

    isLactoseFree = widget.currentfilters['isLactoseFree'];

    isVegan = widget.currentfilters['isVegan'];

    isVegetarian = widget.currentfilters['isVegetarian'];
    super.initState();
  }

  Widget buildSwwitchList(
      String title, String dsecription, bool Currentvalue, Function f) {
    return new SwitchListTile(
      title: new Text(title),
      subtitle: new Text(dsecription),
      value: Currentvalue,
      onChanged: f,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          'Filters',
          style: new TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
        actions: [
          new IconButton(
            icon: new Icon(Icons.save),
            onPressed: () {
              final Map<String, bool> Filters = {
                'isGlutenFree': isGlutenFree,
                'isLactoseFree': isLactoseFree,
                'isVegan': isVegan,
                'isVegetarian': isVegetarian,
              };
              widget.savefilters(Filters);
            },
          ),
        ],
      ),
      body: new Column(
        children: [
          new Container(
            child: new Text(
              'Select your filters',
              style: Theme.of(context).textTheme.title,
            ),
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            alignment: Alignment.center,
            color: Colors.indigo,
          ),
          Expanded(
            child: new ListView(
              children: [
                buildSwwitchList(
                    'GlutenFree', 'Food without gluten', isGlutenFree, (value) {
                  setState(() {
                    isGlutenFree = value;
                  });
                }),
                buildSwwitchList(
                    'LactoseFree', ' Food without lactose', isLactoseFree,
                    (value) {
                  setState(() {
                    isLactoseFree = value;
                  });
                }),
                buildSwwitchList('Vegan', 'Food with vegan', isVegan, (value) {
                  setState(() {
                    isVegan = value;
                  });
                }),
                buildSwwitchList(
                    'Vegetarian', 'Food with vegetarian', isVegetarian,
                    (value) {
                  setState(() {
                    isVegetarian = value;
                  });
                }),
              ],
            ),
          )
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
