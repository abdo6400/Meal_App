import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/meal_details_screen.dart';

class MealItem extends StatelessWidget {
  final String imageUr1;
  final String title;
  final String id;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  MealItem({
    @required this.imageUr1,
    @required this.title,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
    @required this.id,
  });

  void selectmeal(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(MealDetails.routename, arguments: id,
    ).then((value) {
      /*if(value != null)
        removeitem(value);*/
    });
  }
  String get AffordabilityKind {
    String Kind;
    switch (affordability) {
      case Affordability.Affordable:
        Kind = 'Affordable';
        break;
      case Affordability.Luxurious:
        Kind = 'Luxurious';
        break;
      case Affordability.Pricey:
        Kind = 'Pricey';
        break;
      default:
        Kind = 'unknown';
        break;
    }
    return Kind;
  }
  String get ComplexityKind {
    String Kind;
    switch (complexity) {
      case Complexity.Simple:
        Kind = 'Simple';
        break;
      case Complexity.Hard:
        Kind = 'Hard';
        break;
      case Complexity.Challenging:
        Kind = 'Challenging';
        break;
      default:
        Kind = 'unknown';
        break;
    }
    return Kind;
  }

  @override
  Widget build(BuildContext context) {
    return new InkWell(
      onTap: () => selectmeal(context),
      child: new Card(
        shape:
            new RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: EdgeInsets.all(15),
        child: new Column(
          children: [
            new Stack(
              children: [
                new ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: new Image.network(imageUr1,
                      height: 200, width: double.infinity, fit: BoxFit.cover),
                ),
                new Positioned(
                    bottom: 20,
                    right: 10,
                    child: new Container(
                      width: 300,
                      color: Colors.black54,
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                      child: new Text(
                        title,
                        style: new TextStyle(
                          fontSize: 26,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.fade,
                        softWrap: true,
                      ),
                    ))
              ],
            ),
            new Padding(
              padding: EdgeInsets.all(15),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  new Row(
                    children: [
                      new Icon(Icons.access_time),
                      new SizedBox(
                        width: 6,
                      ),
                      new Text(
                        '$duration min',
                        style: new TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                  new Row(
                    children: [
                      new Icon(Icons.work),
                      new SizedBox(
                        width: 6,
                      ),
                      new Text(
                        ComplexityKind,
                        style: new TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                  new Row(
                    children: [
                      new Icon(Icons.attach_money),
                      new SizedBox(
                        width: 6,
                      ),
                      new Text(
                        AffordabilityKind,
                        style: new TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
