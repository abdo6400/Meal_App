import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import '../widgets/categoryitem.dart';
class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(15),
      children: DUMMY_CATEGORIES.map((catdata) =>
      CategoryItem(id: catdata.id,title: catdata.title,color: catdata.color),
      ).toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 20,
      ),
    );
  }
}
