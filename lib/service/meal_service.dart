import 'package:fast_kaskrot/models/meal.dart';
import 'package:flutter/material.dart';

import '../config/sql_db_config.dart';

class MealService {
  SqlDb database = SqlDb();

  Future<void> insertMeal(Meal meal) async {
    final int response = await database.insertData('meal', meal.toMap());
    if(response != 0) {
      debugPrint('$meal has been saved successfully');
    }
  }

  Future<List<Meal>> meals() async {
    // Get a reference to the database.
    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await database.queryData('meal');

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return Meal(
        restaurantId: maps[i]['restaurant_id'],
        id: maps[i]['id'],
        imageName: maps[i]['image_name'],
        title: maps[i]['title'],
        availability: maps[i]['availability'],
        description: maps[i]['description'],
        price: maps[i]['price'],
      );
    });
  }
}