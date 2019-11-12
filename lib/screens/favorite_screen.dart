import 'package:flutter/material.dart';
import 'package:niu_meals/models/meal.dart';

class FavoriteScreen extends StatelessWidget {
  final List <Meal> favoriteMeals;

  FavoriteScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('The Favorites'),);
  }
}
