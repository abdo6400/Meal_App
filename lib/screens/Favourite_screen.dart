import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/widgets/meal_item.dart';

class FavouriteScreen extends StatelessWidget {
  final List<Meal> FavoriteMeals ;

  FavouriteScreen(this.FavoriteMeals);

  @override
  Widget build(BuildContext context) {
    if(FavoriteMeals.isEmpty)
      {
        return new Center(
          child: new Text('You have no favorite yet - start adding soon!'),
        );
      }
    else{
      return new ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: FavoriteMeals[index].id,
            imageUr1: FavoriteMeals[index].imageUrl,
            title: FavoriteMeals[index].title,
            duration: FavoriteMeals[index].duration,
            complexity: FavoriteMeals[index].complexity,
            affordability: FavoriteMeals[index].affordability,
          );
        },
        itemCount: FavoriteMeals.length,
      );
    }
  }
}
