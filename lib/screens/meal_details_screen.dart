import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';

class MealDetails extends StatelessWidget {
  static final String routename = 'meals_details';
  final Function toggleFavorite;
  final Function isFavorite;
  MealDetails(this.isFavorite,this.toggleFavorite);

  Widget buildtext(BuildContext context, String text) {
    return new Container(
        margin: EdgeInsets.all(15),
        child: new Text(
          text,
          style: Theme.of(context).textTheme.title,
        ));
  }

  Widget buildcont(Widget child) {
    return new Container(
      decoration: new BoxDecoration(
        border: Border.all(color: Colors.purple),
        color: Colors.amberAccent,
        borderRadius: new BorderRadius.circular(15),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      width: 300,
      height: 200,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealid = ModalRoute.of(context).settings.arguments as String;
    final selectedmeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealid);
    return new Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.purpleAccent,
          title: new Text(selectedmeal.title),
        ),
        body: new SingleChildScrollView(
          child: new Column(
            children: [
              new Container(
                width: double.infinity,
                height: 300,
                child: new Image.network(
                  selectedmeal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              buildtext(context, 'Ingredients'),
              buildcont(
                new ListView.builder(
                  itemBuilder: (ctx, index) {
                    return new Card(
                        margin: EdgeInsets.all(10),
                        child: new Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                          child: new Text(
                            selectedmeal.ingredients[index],
                            style: new TextStyle(color: Colors.black),
                          ),
                        ));
                  },
                  itemCount: selectedmeal.ingredients.length,
                ),
              ),
              buildtext(context, 'Steps'),
              buildcont(
                new ListView.builder(
                  itemBuilder: (ctx, index) {
                    return ListTile(
                      leading: new CircleAvatar(
                        child: new Text('# ${index+1}'),
                      ),
                      title: new Text(
                        selectedmeal.steps[index],
                        style: new TextStyle(color: Colors.black),
                      ),
                    );
                  },
                  itemCount: selectedmeal.steps.length,
                ),
              )
            ],
          ),
        ),
        floatingActionButton: new FloatingActionButton(
          onPressed: () => toggleFavorite(mealid),
          child: new Icon(
              isFavorite(mealid) ? Icons.star : Icons.star_outlined
          ),
        ),
    );

  }
}
