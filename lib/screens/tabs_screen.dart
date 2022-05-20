import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/Favourite_screen.dart';
import 'package:meal_app/screens/categories_screen.dart';
import 'MainDrawer.dart';

class Tabsscreen extends StatefulWidget {
 final List<Meal> FavoriteMeals ;

   Tabsscreen(this.FavoriteMeals);

  @override
  _TabsscreenState createState() => _TabsscreenState();
}

class _TabsscreenState extends State<Tabsscreen> {
  List<Map<String,Object>> pages;
  @override
  initState()
  {
    pages = [
      {
        'page': CategoriesScreen(),
        'title': 'Category'
      },
      {
        'page': FavouriteScreen(widget.FavoriteMeals),
        'title': 'Favourite'
      }
    ];
    super.initState();
  }
  int indexpage=0;
  void selectpage(int value) {
    setState(() {
      indexpage=value;
    });
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(pages[indexpage]['title']),
      ),
      body: pages[indexpage]['page'],
      bottomNavigationBar: new BottomNavigationBar(
          onTap: selectpage,
          currentIndex: indexpage,
          items: [
            new BottomNavigationBarItem(
                icon: Icon(Icons.category),
                title: new Text('Categories') ,
            ),
            new BottomNavigationBarItem(
              icon: Icon(Icons.star),
              title: new Text('Favourites'),
            )
          ]
      ),
      drawer: MainDrawer(),
    );
  }
}
