import 'package:flutter/material.dart';
import 'package:meals/components/meal_item.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/category.dart';
import 'package:meals/models/meal.dart';

class CategoriesMealsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Category category =
        ModalRoute.of(context).settings.arguments as Category;

    List<Meal> categoryMeals = DUMMY_MEALS
        .where((Meal meal) => meal.categories.contains(category.id))
        .toList();

    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text(category.title),
        ),
        body: ListView.builder(
          itemCount: categoryMeals.length,
          itemBuilder: (ctx, index) {
            return MealItem(categoryMeals[index]);
          },
        ),
      ),
    );
  }
}
