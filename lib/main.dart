import 'package:flutter/material.dart';
import './dummy_data.dart';
import 'package:meal_app/screens/categories_screen.dart';
import 'package:meal_app/screens/filters_screen.dart';
import 'package:meal_app/screens/meal_details_screen.dart';
import 'package:meal_app/screens/tabs_screen.dart';
import 'models/meal.dart';
import 'screens/category_meals_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> filters = {
    'isGlutenFree': false,
    'isLactoseFree': false,
    'isVegan': false,
    'isVegetarian': false,
  };
  List<Meal> avilablemeals = DUMMY_MEALS;
  List<Meal> FavoriteMeals = [];

  void setfilters(Map<String, bool> map) {
    setState(() {
      filters = map;
      avilablemeals = DUMMY_MEALS.where((meal) {
        if (filters['isGlutenFree'] && !meal.isGlutenFree) {
          return false;
        }
        if (filters['isLactoseFree'] && !meal.isLactoseFree) {
          return false;
        }
        if (filters['isVegan'] && !meal.isVegan) {
          return false;
        }
        if (filters['isVegetarian'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void toggleFavorite(String mealid) {
    final existIndex = FavoriteMeals.indexWhere((meal) => meal.id == mealid);

    if (existIndex >= 0) {
      setState(() {
        FavoriteMeals.removeAt(existIndex);
      });
    } else {
      setState(() {
        FavoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealid));
      });
    }
  }
  bool ismealfavorite(String id)
  {
    return FavoriteMeals.any((meal) => meal.id == id);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meal App',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        accentColor: Colors.purpleAccent,
        canvasColor: Color.fromRGBO(225, 255, 230, 1),
        textTheme: new TextTheme(
          body1: new TextStyle(
            color: Color.fromRGBO(225, 255, 230, 1),
          ),
          body2: new TextStyle(
            color: Color.fromRGBO(225, 255, 230, 1),
          ),
          title: new TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      //home: MyHomePage(),
      routes: {
        '/': (context) => Tabsscreen(FavoriteMeals),
        CategoriesMealsScreen.routename: (context) => CategoriesMealsScreen(avilablemeals),
        MealDetails.routename: (context) => MealDetails(ismealfavorite,toggleFavorite),
        FiltersScreeen.routename: (context) => FiltersScreeen(setfilters, filters),
      },
    );
  }
}
