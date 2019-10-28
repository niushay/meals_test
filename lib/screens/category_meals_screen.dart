import 'package:flutter/material.dart';
import 'package:niu_meals/widgets/meal_item.dart';

import '../dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  //final String categoryId;
  //final String categoryTitle;

  //CategoryMealsScreen(this.categoryId, this.categoryTitle);
  static const routeName = '/categories-meals';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: ListView.builder(
            itemBuilder: (ctx, index) {
              return MealItem(
                  id:categoryMeals[index].id ,
                  title: categoryMeals[index].title,
                  imageUrl: categoryMeals[index].imageUrl,
                  affordability: categoryMeals[index].affordability,
                  complexity: categoryMeals[index].complexity);
            },
            itemCount: categoryMeals.length));
  }
}