import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/widgets/meal_item.dart';

class CategoriesMealsScreen extends StatefulWidget {
  static final String routename = 'category_meals_screen';
  final List<Meal> avilablemeals;

  CategoriesMealsScreen(this.avilablemeals);
  @override
  _CategoriesMealsScreenState createState() => _CategoriesMealsScreenState();
}

class _CategoriesMealsScreenState extends State<CategoriesMealsScreen> {
  String categorytitle;
  List<Meal> categorymeales;
  @override
  void didChangeDependencies() {
    final routearg =
    ModalRoute
        .of(context)
        .settings
        .arguments as Map<String, String>;
    final categoryid = routearg['id'];
    categorytitle = routearg['title'];
    categorymeales = widget.avilablemeals.where((meal) {
      return meal.categories.contains(categoryid);
    }).toList();
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          categorytitle,
        ),
      ),
      body: new ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: categorymeales[index].id,
            imageUr1: categorymeales[index].imageUrl,
            title: categorymeales[index].title,
            duration: categorymeales[index].duration,
            complexity: categorymeales[index].complexity,
            affordability: categorymeales[index].affordability,
          );
        },
        itemCount: categorymeales.length,
      ),

    );
  }
}
