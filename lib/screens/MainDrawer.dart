import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/screens/filters_screen.dart';

import 'category_meals_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildlisttile(String title, IconData icon, Function x) {
    return new ListTile(
      title: new Text(
        title,
        style: new TextStyle(
          color: Colors.black,
          fontSize: 24,
        ),
      ),
      leading: new Icon(icon),
      onTap: x,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Drawer(
        child: new Column(
      children: [
        new Container(
          child: new Text(
            'Cooking up!',
            style: Theme.of(context).textTheme.title,
          ),
          padding: EdgeInsets.all(15),
          color: Theme.of(context).accentColor,
          alignment: Alignment.centerLeft,
          width: double.infinity,
          height: 120,
        ),
        new SizedBox(
          height: 20,
        ),
        buildlisttile('Meals', Icons.restaurant, () {
          Navigator.of(context).pushReplacementNamed('/');
        }),
        buildlisttile('Filters', Icons.settings, () {
          Navigator.of(context).pushReplacementNamed(
            FiltersScreeen.routename,
          );
        })
      ],
    ));
  }
}
